[[Reading 3]]

## OS Interfaces

- Interfaces are required between the OS and other programs to offer general services

## Interfaces: APIs

Application Program Interface

- source level interface, specifying:
    - include files, data types, constants
    - macros, routines, and their parameters

a basis for software portability

- recompile program for the desired architecture
- linkage edit with OS-specific libraries
- resulting binary runs on that architecture

An API compliant program will compile and run on any compliant system

## Interfaces: ABI

Application Binary Interfaces

- a binary interface, specifying:
    - dynamically loaded libraries
    - data formats, calling sequences, linkage connections
    - binding of an API to a hardware architecture

A basis for binary compatibility

- one binary serves all customers for that hardware

An ABI compliant program will run on any compliant system

## Libraries and Interfaces

normal libraries are accessed through an API

- source-level definitions of how to access the library
- readily portable between different machines

Dynamically loaded libraries also called through an API

- dynamic loading mechanism is ABI-specific
- issues of work length, stack format, linkages

## Interfaces and Interoperability

- string stable interfaces are key to allowing programs to operate together
- key to allow OS evolution
- want upward compatibility with OS upgrades
- do not want to change the interface

## Interoperability requires:

### Stability

All programs:

- use system calls
- call library routines
- operate on external files
- exchange messages with other software
- changing interface programs fail 💀

API requirements are frozen at compile time

- execution platform must support the interfaces

### Compliance

- complete interoperability testing is impossible
    - cannot test all apps on all platforms
    - cannot test all implementations
    - new apps and platform are added continuously
- focus on the interface
    - must be rigorously specified
    - have standards to manage interface definitions
    - compliance validate implementations

## Side Effects

occurs when an action on one object has non-obvious consequences

- effects not specified by interfaces
- often due to a shared state between seemingly independent modules and functions
- cause unexpected behaviors

## Critical OS Abstractions

### Abstractions of Memory

Some Complicating Factors

- Persistent vs Transient memory
- size of memory operations
    - size users/app want vs size physics device actually works with
- Coherence
- atomicity
    - performing of a sequence of steps, called actions, so that they appear to be done as a single, indivisible step
- Latency
- same abstractions might be implemented with many different physical devices

### Where do complications come from?

- the OS doesn’t have abstract devices with arbitrary properties
- it has particular physical devices
- core OS abstraction problem:
    - creating abstract device with the desirable properties from physical device that lacks them

### Example:

- reading or writing the file
- we expect our next read to reflect the results of the write
    - coherence
- expect the entire read/write to occur
    - atmocity
- expect several reads/writes to occur in the same order

### What’s Implementing the File?

- a flash drive, has peculiar characteristics
    - re-writing requires an erase cycle which erases a whole block and is slow
    - atomicity of writing at word level
    - blocks can only be erased so many times
- the OS need to deal with these oddities

### Solution?

- different structures for the file system
- garbage collections to deal with blocks largely filled with inactive data
- maintaining a pool of empty blocks
- wear-leveling in use of blocks
- something to provide desired atomicity of multi-word writes

## Abstractions of Interpreters

- an **interpreter** is something that performs commands
- at the physical level we have a processor, but its hard to use

## Basic Interpreter Components

### An instruction reference

- tell the interpreter which instruction to do next

### A repertoire

- the set of things the interpreter can do

### An environment reference

- describes the current state on which the next instruction should be performed

### Interrupts

- situation in which the instruction reference pointer is overriden00

### Example

- we have a process
- the OS maintains a program counter for the process
- source code specifies its repertoire
- its stack, heap, and register contents are its environment
    - OS has pointers to all of them
- No other interpreters should be able to mess up the process’ resources

### Implementing the Process Abstraction

- there are almost always multiple processes
- the OS has limited physical memory
- only one set of register
    - one per core
- the process shares the CPU or core

### Solution

- Schedulers to share the CPU among various processes
- Memory management hard and software
- access control mechanisms for other memory abstractions8

## Abstractions of Communications

- a communication link allows one interpreter to talk to another
- at physical level, memory and cables
- at abstract levels, networks and interprocess communication mechanisms

### Why are Communication Links Distinct From Memory

- highly variable performance
- asynchronous
- receiver may only perform the operation because the send occurred
- additional complications when working with a remote machine

### Implementing the Communications Link Abstraction in the OS

- easy if both ends are on the same machine
- on same machine, use memory for transfer
- more complicated when remote

### Lead To:

- optimizing costs of copying data
- tricky memory management
- inclusion of complex network protocols in the OS itself
- worries about message loss, retransmission
- new security concerns that OS need to address

## Generalizing Abstractions

### How can applications deal with many varied resources?

- Make many different things appear the same
    - applications can all deal with a single class
    - often lowest common denominator + sub-classes
- Requires a common/unifying model
    - portable document format(PDF) for printed output
    - SCSI/SATA/SAS standard for disks, CDs, SSDs
- usually involves a federation of framework

### Federation Frameworks

- a structure that allows many similar but somewhat different things to be treated uniformly
- by creating one interface that all must meet
- then plugging in implementations for the particular things you have
    - make all hard disk drives accept the same command

### Are Federation Frameworks Too Limiting?

- the common model doesn’t have to be the lowest common denominator
- the model can include optional features
    - if present are implemented in a standard way
- Many devices will have features that cannot be exploited through the common model

## Abstractions and Layering

- It’s common to create increasingly complex services by layering abstractions
    - e.g. a generic file system layers on a particular file system, which layers on abstract disk, which layers on real disk
- layering allows good modularity
    - easy to build multiple services on a lower layer
    - easy to use multiple underlying services to support a higher layer

### Downside of Layering

- usually add performance penalties
- expensive to go from one layer to the next
    - require changing data structures or representation
- lower layer may limit what the upper layer can do

## Other OS Abstractions

- There are many other abstractions offered by the OS
- they provide different ways of achieving similar goals
- the OS must do work to provide each abstraction
- programmers and users have to choose the right abstractions to work with

## Conclusion

- Stable interfaces are critical to the proper performance of an OS
- Abstractions make OS easier to use for both programmers and conusmers
- the most important OS abstractions involve memory, interpreters, and communications