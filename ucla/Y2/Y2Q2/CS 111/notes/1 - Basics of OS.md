---
course: CS 111
area: ucla
created: 2023-01-10T08:35
updated: 2023-01-12T19:24
📕 courses:
  - "[[CS 111- Operating Systems]]"
tags: cs
parent: CS 111

title: 1 - Basics of OS

layout: note

---
# Definitions

---

# Big Ideas

---

## What is System Software

### System Software

- an OS is made of a set of system software that provides services/support for higher level applications
- the system software is usually built with or on the kernel which connects the hardware with the software i.e. firmware

### Common System Software

- memory management
- persistent storage (drives, paged data)
- scheduling and synchronization (scheduler, pipeline)
- interprocess communications (IPC: pipe, etc.)
- security
- many OS system software are used as features in higher level applications
- Other problems handled by OS
    - coordinate separate comms
    - manage shared resources
    - virtualize hardware ans software
    - organize comms
    - protect computing resources

## OS Wisdom

- view services as objects and operations
    - every object is implemented w a data structure

### Implementation

- an implementation is not a specification
- many spec compliant implementations are possible
- inappropriate dependencies usually cause problems

### Interface Spec

- an interface spec is a contract which specifies responsibilities of producers/consumers
- the interface spec is the basis for product/release interoperability

### Modularity and Encapsulation

- complexity of system software hiding the level of abstraction

### Policy vs. mechanism

- policy determines what can and should be done
- mechanism implements basic operations to follow the policy which don’t dictate/limit policies
- policies should be malleable without requiring new mechanisms
- parallelism and asynchronous behavior is powerful and vital but dangerous when unchecked
- performance and correctness are often at odds and correctness is not always implemented

  

## What is an OS

- low level software that provides better abstractions of the computer hardware to allow easy/safe/fair use and sharing of hardware/system software resources

### What does an OS do

- manages hardware resources for programs
    - allocates hardware and manage its use (scheduler)
    - enforces privacy and controlled sharing
    - oversees execution of programs and handles problems
- abstracts the hardware
    - makes it easier to use and improv sw portability
    - optimizes performance
- provides new abstractions for applications
    - powerful features beyond just hardware

### What does an OS look like

- a set of management and abstraction services run behind the scenes
- applications see objects and their services

## Where does the OS fit in

- infographic
    
    ![[/Untitled 30.png|Untitled 30.png]]
    
- the OS runs above the Hardware through the standard and privileged instruction sets
- the OS provides a system call interface for system services/libraries to use

### What’s special about the OS

- always in control of the hardware because only the OS has **complete** access to hardware
    - auto load when machine boots, first software to access hardware, access to privileged instruction set, all memory and IO
- it is the middle-man for applications’ access to hardware
- trusted to store/manage data and always act in good faith
- if it crashes, it takes everything with it (e.g. blue screen of death)

## ISAs

- set of instructions supported by a computer
- many different ISAs that may be incompatible w/ the OS
    - bus/bandwidth (32 bit → 64 bit)
    - philosophies (RISC vs CISC)
    - competition (x86 vs ARM)

### Privileged vs General Instructions

- modern ISAs divide instruction sets
- top-level applications can execute general instructions
- processor must be in special mode to execute privileges instructions
    - can be dangerous in abuse

### Platforms

- ISA don’t completely define a computer
- PC have functionality beyond user mode instructions
    - different hardware, controllers, memory management, IO bus, BIOS, feature support
- these variations define a platform
    - the platform on which the OS runs
- Requires successful OS to run on as many platforms and ISAs
- implies OS will abstract ISAs
    - and makes minimal assumptions of HW i.e. hw independent (file systems, protocols, processes, etc.)

## Binary Distribution Model

- Binary is aa derivative of the source code which is distributed
    - the OS is written in the source which is compiled to a binary
- may be multiple binaries per ISA
- device drivers can be published later or after-market for platform support

## Binary Configuration Model

- the binary will configure to the environment/user based on specific access to hardware/features
- automatic hardware discovery
    - self identifying busses (device to transfer data)
    - PCI/e, USB, PCMIA, EISA, etc.
- automatic resource allocation
    - eliminate fixed size resource pools based on config
    - → dynamically re/allocate resources on demand

  

## Functionality of OS

- as much as necessary with as little as possible
    - OS code is expensive to develop and maintain in price and time
- functionality that must be in the OOS
    - use of privileged instructions
    - manipulation of OS data structures
    - must maintain security/trust and resource integrity
- performance code/functionality

# Resources

---

![[/Lecture_1-1.pdf|Lecture_1-1.pdf]]

📌

**SUMMARY  
**