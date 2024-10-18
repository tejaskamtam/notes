[https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-intro.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-intro.pdf)

## Process

- running program
- **machine state** - what a program can read or update when it is running
    - memory
    - registers
    - persistent storage devices

## Virtualizing the CPU

- time sharing
    - running one process, then stopping it and running another
- need mechanism and policies

[https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-api.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-api.pdf)

## Process API

### Create

- an OS must include some method to create new processes

### Destroy

- system should have an interface to destroy processes forcefully

### Wait

- wait for a process to stop running

### Miscellaneous Control

- other than killing or waiting for a process, allow other controls.
- ex. suspend the process for a little bit

### Status

- get info about the status of a process

### Details

- each process has a name, the name is a number known as process ID (PID)
- **fork()** system call is used in UNIX systems to create a new process. The creator is called the parent; the newly created process is called the child. As sometimes occurs in real life, the child process is nearly identical copy of the parent
- **wait()** system call allows a parent to wait for its child to complete execution
- **exec()** family of system calls allows a child to break free from its similarity to its parent and execute an entirely new program
- A unix shell commonly uses the above commands to launch user commands. Separation of fork and exec enables features like input/output redirections, pipes, and other cool features without changing anything about the programs being run
- Process control is available in te form of signals, which can cause jobs to stop, continue, or terminate
- which process can be controlled by a particular person is encapsulated in the notion of a user, the OS allows multiple users on to the system, and ensures users can only control their own processes
- A **superu**s**er** can control all processes

## Process Creation:

- OS first load program code and static data into memory
    - read from disk and place in memory
- memory must be allocated for the program’s run-time stack and heap
    - heap is used for explicitly requested dynamically allocated data, malloc() and free()
- I/O setup

## Process States

### Running

- executing instructions

### Ready

- a process is ready run but the OS has chosen not to run it at this momemt

### Blocked

- not ready to run until some other events takes place

Running → Ready: Descheduled

Read → Running: Scheduled

Running → Blocked → Ready

**OS Scheduler decides what process to run**

## Process List

- contains information about all processes in the system. Each entry is found in what is called a **process control block**, which is a just a structure that contains information about a specific process

[https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-mechanisms.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-mechanisms.pdf)

## Limited Direct Execution

The basic idea is: run one process for a little while, then run another one, and so forth.

- phase 1:
    - boot time, the kernel initializes the trap table, the CPI remembers its location for subsequent use
- phase 2
    - kernel sets up a few things before using a return-from-trap instruction to start the execution of the process
    - if the process wishes to issue a system call, it traps back into the OS, which handles it and once again returns control through a return-from-trap to the process
    - once the process finish it will return from main() and return to some code and properly exit the program

### User Mode

code that runs in user mode is restricted in what it can do, however, can access privileged operation via system call

### Kernel Mode

where the OS/Kernel runs in, the code can do whatever it likes like using privileged operations and restricted instruction

### System Call

- a routine that allows a user application to request actions that require special privileges
- a program must execute a special trap instruction to transfer control to the kernel and raise the privilege level to kernel mode
- when finished, the os call return-from-trap instruction
- use a trap table to keep track of what code to run inside the OS
- a **system call number** is usually assigned to each system call, use code is responsible for placing the desired system call number at a specified location on the stack
    - offer protection since the user code cannot specify an exact address to jump but rather a service via number

### Trap Table

- tell the hardware what code to run when certain exceptional events occur
- tell hardware the locations of the trap handlers

## How can OS regain control of the CPU so it can switch between processes?

### Cooperative approach

- the os trusts the processes of the system to behave reasonably
- OS regains control of the CPU by waiting for a system call or an illegal operation of some kind
- not ideal since a process can be stuck in an infinite loop and not transfer control back to the OS

### Non cooperative approach: OS takes Control

- timer interrupt, a timer device can be programmed to raise an interrupt every so many milliseconds
- interrupt handler in the OS runs and running process is halted

### Scheduler

- the part of the os that decide whether to continue running the current active process, or switch to a different one
- to switch: executes **context switch**
    - save a few register values of the current running process and restore a few for the soon to be executing process, all in the kernel stack

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/objmods.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/objmods.html)

## Linking and Libraries

### Software Generation Tool Chain (compiled languages)

### Type of files:

**Source modules** - editable text in some language that can be translated into machine language by a compiler or assembler

**Relocatable object modules -** sets of compiled or assembled instructions created from individual source modules, but which are not yet complete programs

**libraries -** collections of object modules, from which we can fetch functions that are required by the original source/object modules

**load modules** - complete programs, usually by combining object modules, that are ready to be loaded into memory

### Software tools (in order of which they are used):

**compiler** - processes the source modules and generate lower-level code, usually into assembly language code.

**assembler** - assembly language is much lower level, with each line of code translating directly into a single machine language instruction.

- in user mode, modules in assembler:
    - performance critical string and data structure manipulations
    - routines to implement calls into the operating system
- in os:
    - CPU initilization
    - first level trap/interrupt handlers
    - synchronization operations

Output: an object module containing mostly machine language code

- some functions may not yet be present
- locally defined symbols may not been assigned hard in-memory addresses, and may be expressed as offsets to some TBD starting point

**linkage editor** - reads a specified set of object modules, placing them consecutively into a virtual address space, and noting where each was placed and unresolved external references. Then it searches a specified set of libraries to resolve references with object modules and place them in the virtual address space. Lastly, it finds every reference to a relocatable or external symbol and updates it to reflect the address where desired code/data was actually placed. Resulting bits are loaded into an executable load module.

**Program Loader -** part of the OS. create virtual address space, reads instructions and initialize data from load module. Load additional (shared) libraries to resolve references if there are any.

### Object Modules

**relocatable object modules vs executable load modules:**

- lom may be incomplete, may make reference to code or data items that must be supplied from other modules
- not yet determined where they will be loaded into memory, reference to code/data items within the module can only be relative addresses

**ELF (executable and linkage format)** - object module format common across many ISA.

- header section - types, sizes, location of other sections
- code and data sections - each containing bytes that are to be loaded into memory
- symbol table - lists external symbols defined or needed by this module
- collection of relocation entries, each include:
    - location of a field that requires relocation
    - width/type of the field to be relocated
    - symbol table entry, whose address should be used to perform that relocation

### Libraries

- a collection of object modules
- contain commonly used reusable code
- order of which the libraries are loaded are important, since one library may depend on the other

### Linkage Editing

3 things need to be done to turn a collection of relocatable object modules into a runnable program:

- resolution - search specified libraries to find object modules that can satisfy all unresolved external references
- loading - lay the text and data segments from all of those object modules down in a single virtual address space, and note where the symbols are placed
- relocation - go through all of the relocation entries in all of the loaded object modules, each reference to correctly reflect the chosen addresses

### Load Module

- complete and require no relocation, when called:
    - consults the load module to determine the required text and data segment size and locations
    - allocates the appropriate segments within the virtual address space
    - reads the contents of the text and data segments from the load module into memory
    - creates a stack segment and initialize the stack pointer to point to it

### Static Library

- loaded directly during linkage editing process, library modules were directly incorporated into the load module

### Shared Library

- loaded during the program load time
- since all program share the same library, it cannot store data

### Dynamically Loaded Library

- not loaded until they are actually needed, during run time

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/linkage.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/linkage.html)

# Stack Frames and Linkage Convention