> [!info]  
> undefined  
> [https://pages.cs.wisc.edu/~remzi/OSTEP/intro.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/intro.pdf)  

### Von Neumann model of computing

- the processor fetches an instruction from memory
- decodes it
- executes it
- repeat until the program completes

## How can OS make sure the system is efficient and easy to use?

### Virtualization

- the OS takes a physical resource (such as the processor, or memory, or a disk) and transform it into a more general, powerful, and easy to use virtual form of itself. AKA virtual machine

### Standard Library

- the interface that the OS provides that exports system calls that applications use to run program, access memory, and etc.

### Resource Manager

- the OS manage CPU, memory, disk, and other resources of the system

# Major Themes 💾

## Virtualization

### Virtualizing the CPU 💻

- turning a single or small sets of CPUs into a seemingly infinite number of CPUs and thus allowing many programs to seemingly run at the same time
- achieved by implementing policy and mechanisms

### Virtualizing the Memory 🗒️

- **Memory** is just an array of bytes determined by **address**
- each process that is running has its own private **virtual address space**, which is mapped by the OS to the physical memory of the machine.
- the physical memory became a shared resource, with each process thinking that it has its own dedicated physical memory

## Concurrency 🪙

- when running multiple processes concurrently, the order of which the instructions from different processes execute affects the output of the processes.
    - Ex. in book: two threads share and increment the same counter variable. Because it takes 3 instructions to update the counter: load the value in the register, increment the value, and store it back into the memory, and that these 3 instructions don’t execute atomically, the final value of the counter variable is inconsistent

## Persistence 💪

- data can be easily lost in system memory.
- DRAM store data in a volatile manner
- Hard drive / SSD provide persistent storage
- **file system** is the software in the OS that manages the disk and stores files in a efficient and reliable manner
- the OS **does not** create a private virtualized disk for each application because system programs often want to share resources/data
    - ex. editing python file with vs code

## Summarizing what the OS does🖊️

- It takes physical resources, such as a CPU, memory, or disk, and virtualized them.
- it handles issues related to concurrency.
- it stores files persistently

## OS Design Goal:

**Abstractions** - allow us to write complex programs without thinking about the intricate details of how the system is handling it from the OS down to the hardware level

**Performance** - virtualization to minimize system overheads such as extra instructions or extra memory

**Protection -** prevent applications from each other. rely on the principle of **isolation**, which means to isolate processes from one another.

**Reliability** - if one process fails, the other processes must be able to keep running

**Energy Efficiency**

**Security**

**Mobility**

## Some History:

- earliest operating system only provided low level API for commonly used functions like i/o code
- file system is invented on the idea that code running on the behalf of the OS is special
- system call is invented, as oppose to procedure call, system call transfers control into the OS while raising the hardware privilege level and limit the privilege of programs to add protection
- multiprogramming means the OS would load a number of jobs into memory and switch rapidly between them to improve CPI utilization