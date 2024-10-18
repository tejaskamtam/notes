[[Reading 1]]

## Why OS?

- help us perform complex operations:
    - that interact
    - use various hardware
    - provide various bits of software
- Hide the complexity and make our job easier 😄

## What is an OS?

- software system software intended to provide support for higher-level applications
    - higher-level system software applications but primarily for user processes
- the software that sits between the hardware and everything else

![[/Untitled 81.png|Untitled 81.png]]

## What does an OS do?

- Manages hardware for programs
    - Allocates hardware and manages its use
    - Enforces controlled sharing and privacy
    - Oversees execution and handles problems
- Abstracts hardware
    - Makes hardware easy to use and improves software portability
    - Optimizes hardware use performance
- Provides new abstractions for applications
    - Powerful features beyond bare hardware

## How do you work with OS?

- configure it
- use their features when you write programs
- use the services they offer:
    - memory management
    - persistent storage
    - scheduling and synchronization
    - interprocess communications
    - security

## Some OS Wisdom

### **View services as objects and operations**

### I**nterface vs. Implementation**

- ==An== **==interface==** ==specification is a contract that specifies the responsibilities of producers & consumers==
- ==An== ==**implementation**== ==is not a specification. Many compliant deployments are possible.==
- change the implementation and not the interface, many compliant implementations are possible
- changing the interface will break the programs that use it
- inappropriate dependencies cause problems
- modularity and functional encapsulation
    - complexity hiding and abstraction hiding

### Policy vs Mechanism

- Policy determines what can/should be done.
- Mechanism implements basic operations to do it, but shouldn’t dictate or limit policies.

Policies must be changeable without changing mechanisms.

### Parallelism and asynchrony are powerful and vital

### OS extends a computer

CPU supports objects (data types) and operations

- bytes, shorts, longs, floats, pointers
- add, subtract, copy, compare, indirection

So does OS, but at a higher level with richer objects and more powerful operations

- files, processes, threads, devices, ports
- create, destroy, read, write, signal

OS views services as objects and operations. Behind every object there is a data structure.

  

## What’s Special About the OS?

### It’s always in control of the hardware

- first software to have access to hardware
- automatically loaded when the machine boots
- keep running while apps come and go

### It has complete access to hardware

- privileged instruction set, all of memory and I/O

### It mediates applications’ access to hardware

- block, permit, or modify application requests

### It is trusted

- store and manage critical data

### If the OS crashes, it takes everything else with it

## ISA

Instruction Set Architectures are the set of instructions supported by a computer.

### Difference in ISAs

There are many different ISAs, all incompatible with each other.

- word/bus widths (8, 16, 32, 64 bit)
- features (low power, floating points, digital signal processors)
- design philosophies (RISC vs CISC)
- competitive reasons (68000, x86, PowerPC)

ISAs usually come in families.

- newer model add features (e.g. Pentium vs 386)
- but remain upwards-compatible with older models

### RISC vs CISC

The CISC approach attempts to minimize the number of instructions per program, sacrificing the number of cycles per instruction.

RISC does the opposite, reducing the cycles per instruction at the cost of the number of instructions per program.

### Privileged vs General instructions

Any code running on the machine can execute general instructions.

Processor must be put into a special mode (often when OS is running) to execute privileged instructions, and do things that are “dangerous”

## Platform

Variation of functionalities beyond the user mode instructions

### ISA doesn’t completely define a computer

Functionalities beyond user mode instructions

- interrupt controllers, DMA controllers
- memory management unit, I/O busses
- BIOS, configuration, diagnostic features
- multi-processor & interconnect support

I/O

- Display, disk, network, serial device controllers

### These variations are called “platforms”

- The platform on which the OS must run
- There are lots of them

## Portability to Multiple ISAs

### A successful OS will run on many ISAs

- some customers cannot choose their ISA
- if you don’t support it, you can’t sell to them

### OS will abstract the ISA

### Minimal assumptions about specific hardware

- General frameworks are hardware independent
    - File systems, protocols, processes, etc
- hardware assumptions isolated to specific modules
    - context switching, I/O, memory management
- Careful use of types
    - Word length, sign extension, byte order, alignment

### Binary distribution model

OS is distributed in binary to to all the different ISAs, at least one binary distribution per ISA.

OS is written in source code, compiled into binary and ready to run.

Device drivers (for plugin devices like hard drive or monitor) are distributed by 3rd parties that connects with the OS interface. Same driver works with many versions of OS.

### Binary configuration model

Automatic configuration when OS is distributed to an ISA, which eliminates manual or static configuration and enables one distribution to serve all users

- Automatic hardware discovery
    - Gets all hardwares available and their information
    - e.g. ask REM for its memory space
- Automatic resource allocation
    - Eliminate fixes sizes resource pools and dynamically (re)allocate resources on demand

## What functionality is in the OS

- as much as necessary, as little as possible
    - OS code is very expensive to develop and maintain
- Functionality must be in the OS if
    - requires the use of privileged instructions
    - requires the manipulation of OS data structures
    - must maintain security, trust, or resource integrity
- Functions should be in libraries if they
    - are a service commonly needed by applications
    - do not actually have to be implemented inside OS
- Performance
    
    - some things may be faster if done in the OS