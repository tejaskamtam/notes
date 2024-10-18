[[Reading 4]]

## What is a Process

- a type of interpreter
- an executing instance of a program
- a virtual private computer
- a process is an object
    - characterized by its properties
    - characterized by its operations

## What is State?

- a mode or condition of being
- All persistent objects have state
    - distinguish them from other objects
    - characterize object’s current condition
- Content of state depends on object
    - complex op = complex state
    - representable as a set of bits
    - can save/restore bits of total state
    - can talk of a state subset

### Examples of OS Object State

- scheduling priority of a processs
- current pointer into a file
- completion condition of an I/O operation
- List of memory pages allocated to a process
- OS objects’ state is mostly managed by the OS itself

## Process Address Spaces

- each process has some memory addresses reserved for its private use
- that set of addresses is called its address space
- a process’ address space is made up of all memory locations that the process can address
- modern OSes pretend that every process’ address space can include all of the memory

## Program vs. Process Address Space

![[/Untitled 83.png|Untitled 83.png]]

## Process Address Space Layout

- all required memory elements for a process must be put somewhere in its address space
- different types of memory elements have different requirements
- each OS has some strategy for where to put these process memory segments

### Layout of Unix Processes in Memory

- in Unix systems:
    - code segments are statically sized
    - data segment grows up
    - stack segment grows down

### Address Space: Code Segments

- start with a load module
    - the output of a linkage editor
    - resolve all external references
    - combine all modules into a few segments
- Code must be loaded into memory
    - instructions can only be run from RAM
    - a code segment must be created
    - code must be read in from load module
    - map segment into process’ address space
- Code segments are read/execute only and sharable

### Address Space: Data Segments

- data too must be initialized in address space
    - process data segment must be created and mapped into process’ address space
    - initial contents must be copied from load module
- data segments:
    - are read/write, and process private
    - program can grow or shrink it (using the sbrk system call)

## Processes and Stack Frames

- modern programming languages are stack-based
- each procedure call allocates a new stack frame
    - storage for local variables
    - storage for invocation parameters
    - save and restore registers
- most modern CPUs also have stack support

### Address Space: Stack Segment

- size of stack depends on program activities
- OS manages the process’ stack segment
- Stack segments are read/write and process private

### Address Space: Libraries

- static libraries are added to load module
    - each load module has its own copy of each library
    - program must be re-linked to get new version
- shared libraries use less space
    - one in memory copy, shared by all processes
    - keep library separate from the load modules
    - OS loads library along with program
- reduced memory use, faster program loads
- easier and better library upgrades

### Other Process State

- Registers
- Process’ own OS resources
- OS related state information
- need data structure to keep track of all the info

### Process Descriptors

- Basic OS data structure for dealing with processes
- stores all information relevant to the process
    
    - state to restore when process is dispatched
    - references to allocated resources
    - information to support process operations
    
    managed by the OS
    
    - used for scheduling, security decisions, allocation issues

### Linux Process Control Block

- the data structure Linux and other Unix systems use to handle process
    - aka PCB
- An example of a process descriptor:

![[/Untitled 1 60.png|Untitled 1 60.png]]

  

### Other Process State

- Not all process state is stored directly in the process descript
- Other process state is in several other places
    - app execution state is on the stack and in registers
    - Linux processes also have a supervisor-mode stack
        - to retain the state of in-progress program calls
        - to save the state of an interrupt preempted process
- A lot of process state is stored in the other memory areas

## Handling Processes

- creating processes
- destroying processes
- running processes

### Where Do Processes Come From?

- created by the OS
    - use some method to initialize their state, to set up a particular program to run
- at the request of other processes
    - specify the program to run
    - and other aspects of their initial state
- Parent processes
    - the processes created by your process
- Child processes
    - the processes your process created

### Creating a Process Descriptor

- process descriptor is the OS’s basic per-process data structure
- so a new process needs a new descriptor
- what does the OS do with the descriptor?
- typically puts it into a **process table**
    - the data structure the OS uses to organize all currently active process
    - PCB contains one entry for each process

### What Else Does a New Process Need?

- an address space to hold the segments
- the os needs to create one
- os then loads program code and data into new segments
- initializes a stack segment
- sets up initial registers (PC, PS, SP)

### Choices for Process Creation

1. start with a “blank” process
    1. no initial state or resources
    2. this si the basic windows approach
2. Use the calling process as a template
    1. give the new process the same stuff as the old one
        1. including code, PC, etc
    2. this is the Unix/Linux approach

### Window Process Creation

- the `CreateProcess()` system call:
- a very flexible way to create new processes
- generally, the system call includes the name of the program to run
- different parameters fill out other critical information for the new process
    - environment information, priorities, etc

### Process Forking

- the way Unix/Linux creates processes
- essentially clones the existing parent process
- on assumption the new child process is a lot of the old one
    - designed decades ago for reasons no longer relevant
    - has advantages like easing creation of pipelines

### What Happens After a Fork

- There are now two processes
    - different IDs to identify each of them
- the program executes a fork
- now there are two programs
    - with the same code and program counter
- write code to figure out which is which

![[/Untitled 2 53.png|Untitled 2 53.png]]

### Forking and the Data Segments

- Forked child shares the parent’s code
- but not its stack
    - own stack initialized to match the parent’s
    - as if the second process running the same program reached the same point in its run
- child should also have its own data segment
    - don’t typically share the same data segment

### Forking and Copy on Write

- if the parent had a big data area, setting up a separate copy for the child is expensive
- if neither parent nor child write the parent’s data area, though, no copy necessary
- so set it up as _copy-on-write_
- if one of them writes it, then make a copy and let the process write the copy

![[/Untitled 3 46.png|Untitled 3 46.png]]

### What if I don’t want to Fork 😳

- you don’t want a copy and want a process to something entirely different
- Handled with `exec()`
    - a UNIX system call to remake a process
    - changes the code associated with a process
    - resets much of the rest of its state
        - like open files

### The exec() call

- a Linux/Unix system call to handle the common case
- replace a process’ existing program with a different one
    - new code
    - different set of other resources
    - different PC and stack
- Essentially, called after you do a fork
    - though you could call it without forking

### How Does the OS HAndle Exec?

- must get rid of the child’s old code and its stack and data areas
- must load a brand new set of code for that process
- must initialize child’s stack PC and relevant control structure
    - to start a fresh program run for the child process

## Destroying Processes:

- Most processes terminate
- when a process terminates, the OS needs to clean it up
- OS reclaim any resources the process may be holding:
    - memory
    - locks
    - access to hardware devices
- inform any other process that needs to know
    - those waiting for interprocess communications
    - parent and maybe child processes
- remove process descriptor from process table
    - reclaim its memory

## Running Processes

- processes must execute code to do their job
- which means the OS must give them access to a processor core
- but usually more processes than cores
- so processes will need to share the cores
    - they can’t all execute instructions at once
- sooner or later, a process not running on a core needs to be put onto one

## Loading a Process

- to run a process on a core, the core’s hardware must be initialized
- must load the cores’ registers
- must initialize the stack ad set the stack pointer
- must set up any memory control structures
- must set the program counter

### How a process runs on an OS

- it uses an execution model _limited direct execution_
- Most instructions are executed directly by the process on the core
- some instructions instead cause a **trap** to the os
    - privileged instructions that can only execute in the supervisor mode
    - the os takes care of things from there

### Limited Direct Execution

- CPU directly executes most application code
    - punctuated by occasional traps
    - with occasional timer interrupts
- maximizing direct execution is always the goal
    - for Linux and Windows user mode processes
    - for os emulation
    - for virtual machines
- enter the os as seldom as possible
    - get back to the application as quickly as possible

### Exceptions

- the technical term for what happens when the process can’t run an instruction
- some exceptions are routine
    - end of file, arithmetic overflow, conversion error
- some exceptions occur unpredictably
    - segmentation fault (e.g. dereferencing NULL)
    - User abort, hang-up, power-failure
    - these are asynchronous exceptions

### Asynchronous Exceptions

- inherently unpredictable
- programs can’t check for them, since no way of knowing when and if they happen
- some languages support try/catch operations
- hardware and os support traps
    - which catch these exceptions and transfer control to the OS
- OS also uses these for system calls
    - requests from a program for OS services

### Using Traps for System Calls

- made possible at processor design time, not OS design time
- reserve one or more privileged instruction for system calls
    - most ISAs specifically define such instructions
- Define system call linkage on convention
    - call: r0 = system call number, condition code indicates success/failure
    - return: r0 = return code, condition code indicates success/failure
- prepare arguments for the desired system call
- execute the designated system call instruction
    - which causes an exception that traps to the OS
- OS recognizes and performs the requested operation
    - enter the os through a point called a gate
- returns to instruction after the system call

### Trap Handling

- partially hardware, partially software
- Hardware portion of trap handling
    - trap cause an index into trap vector table or PC/PS
    - load new processor status word, switch to supervisor mode
    - push PC/PS of program that causes trap onto stack
    - load PC with address of 1st level handler
- software portion of trap handling
    - 1st level handler pushes all other registers
    - 1st level handling gathers info, selects 2nd level handler
    - 2nd level handler actually deal with the problem
        - handle the event, kill the process, return

### Traps and the Stack

- the code to handle a trap is just code
    - although run in privileged mode
- it requires a stack to run
    - since it might call many routines

![[/Untitled 4 44.png|Untitled 4 44.png]]

### Returning to User-Mode

- return is opposite of interrupt/trap entry
    - 2nd level handler returns to 1st level handler
    - 1st level handler restores all registers from stack
    - use privileged return instruction to restore PC/PS
    - resume user mode execution at next instruction
- saved registers can be change before return
    - change stacked user r0 to reflect return code
    - change stacked user PS to reflect success/failure

### Asynchronous Events

- some things are worth waiting for
    - when read(), want to wait for data
- other time waiting doesn't make sense
    - I want to do something else while waiting
    - I have multiple operations outstanding
    - some events demand very prompt attention
- We need event completion call-backs
    - a common programming paradigm
    - computers support interrupts
    - commonly associated with I/O devices and timers

### User-Mode Signal Handling

- OS defines numerous types of signals
    - exceptions, operator actions, communication
- Processes can control their handling
    - ignore this signal
    - designate a handler for this signal
    - default action
- Analogous to hardware trap/interrupts
    - but implemented by the os
    - delivered to user mode processes

### Managing Process State

- a shared responsibility
- the process itself takes care of its own stack
- and the contents of its memory
- the os keeps track of resources that have been allocated to the process
    - which memory segments
    - open files and devies
    - supervisor stack
    - and many other things

### Blocked Processes

- one important process state element is whether a process is ready to run
    - no point in trying to run it if it isn’t ready to run
    - processes not ready to run are blocked
- why might it not be ready to run?
    
    - waiting for Ior for some resources request to be satisfied
    
    - the os keeps track of whether is a process is blocked

### Blocking and Unblocking Processes

- Why do we block processes?
    - blocked/unblocked are notes to scheduler
    - so the scheduler knows not to choose them
    - and so other parts of OS know if they later need to be unblock
- any part of OS can set blocks, any part can remove them
    - and a process can ask to be blocked itself
        - through a system call

### who handles blocking?

- usually happens in a resource manager
    - when process needs an unavailable resource
        - change process’ scheduling state to “blocked”
    - when the required resource becomes available
        - change process’ scheduling state to ready
        - notify scheduler that a change has occured

## Conclusion

- processes are the fundamental OS interpreter abstraction
- they are created by the os at application request and managed via process descriptors
- there are different methods for creating processes
- processes use system calls to transfer control to the OS to obtain system servcies