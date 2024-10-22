---
course: CS 111
area: ucla
created: 2023-01-17T07:56
updated: 2023-01-17T09:50
📕 courses:
  - "[[CS 111- Operating Systems]]"
tags: cs
parent: CS 111

title: 2 - Interfaces and Abstractions

layout: note

---
# Definitions

---

# Big Ideas

---

## OS Interfaces

- OS is meant to support other progs via abstract services
- meant to be very general → supports many diff progs
- interfaces are required bw OS and progs to offer general services

### Application Program Interfaces (APIs)

help write programs for OS → fro the programmers

- source level interface specifies include files, data types, constants, macros, routines and params
- basis for sw portability
    - recompile program for desire architecture
    - linkage edit w/ eOS-specific libs
    - resulting binary runs on architecture and OS
    - an API compliant prog will compile and run on any compliant system

### Application Binary Interfaces (ABIs)

help install binaries on OS → for the users

- binary interface specifies DLLs, data formats, call sequence, linkage conventions
- basis for binary compatibility
    - one binary serves all customers for that hw (chipset architecture)

### Libraries and Interfaces

- normal libraries (shared or otherwise) are accessed with an API
    - source-level definitions of how to access the library
    - readily portable bw diff machines
- DLL also through API
    - dynamic loading mechanism is ABI specifiic
    - issues of word length, stack format, linkages, etc.

### Interfaces and Interoperability

- strong stable interface are key to program interoperability
- allow OS evolution → don’t want upgrades to break existing progs

### Interoperability requires stability

- progs use syscalls, lib routines, operate on ext files, comms w/ other progs
- if interfaces change, programs fail
- API reqs frozen at compile time
    - execution platform must support those interfaces
    - all services must support the API protocol
    - all future upgrades must be API backward compatible

### Interoperability requires compliance

- deep interoperability testing is impossible
    - due to number of apps, implementations
    - new apps/platforms added all the time
- instead → focus on interfaces
    - interfaces are completely and rigorously specified
    - standard bodies manage interface definitions
    - compliance suites validate implementations
- hope sample testing is sufficient

### Side Effects

- when an action has non-obvious consequences
    - effects not specified by interfaces, could impact other objects
- often due to shared state between seemingly. independent modules/functions
- → resulting bugs difficult to find

## Abstractions

- many actions an OS handles are complex (varities of hw/sw config)
- life is simple under simple abstractions
- OS creates/manages/exports simple abstractions

### Simplifying Abstractions

- hw is fast but complex and limited
    - using it correctly is complex → may not support desired functionality
    - a building block not solution
- abstraactiions
    - encapsulate implementation details
        - error handling, perf optimizations, eliminate irrelevant behavior
    - provide convenient powerful behavior → better suited to user specs

## Critical OS Abstractions

# Resources

---

![[/Lecture_3.pdf|Lecture_3.pdf]]

📌

**SUMMARY  
**