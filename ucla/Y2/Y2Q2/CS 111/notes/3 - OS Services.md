---
course: CS 111
area: ucla
created: 2023-01-12T18:59
updated: 2023-01-17T09:15
📕 courses:
  - "[[CS 111- Operating Systems]]"
tags: cs
---
# Definitions

---

- general instruction set (GIS)
- privileged instruction set (PIS)

# Big Ideas

---

## OS and Resource Abstraction

- the OS offers abstract versions of resources (instead of physical resources)
    - e.g. processes are an abstraction of the CPU and RAM
- abstractions are generally simpler and better suited for user use ass it compartmentalizes complexity and creates an expected (convenient) behavior
- variations in platforms → different formats should be generalized with a common unifying model
    - e.g. PDF for printers/documents

## OS Resources

### Serially reusable resources

- used by multiple clients in series (time multiplexing)
- requires access control for exclusive use
- requires graceful transitions from one process to another
    - a switch of processes/users that hides the fact that the resource belonged to a previous user → create a “like new” status/condition
- e.g. irl printers, water stands, bathroom stalls, a single core in CPU

### Partitionable Resources

- divided into disjoint pieces for multiple classes (spacial multiplexing)
- needs access control for
    - containment - scope within the partition
    - privacy - no parallel usage of a single partition
- requires graceful transitions as most partitionable resources are not permanently allocated

### Shareable Resources

- usable by multiple concurrent users
    - clients dint wait for access and don’t own the resource or any subsets of it
- could involve limitless resources
    - e.g. air in a room, electricity, the OS itself (read-only)
- no need for graceful transitions

## General OS Trends

- OS have grown larger and more complex
- → role has fundamentally changed
    - from managing use of hardware → security, providing apps powerful compute platform, scheduling
- still firmware between hw and sw → understood by services/functionality they provide
- these changes due to what users want → increased services to apps as apps became more complex in internal behavior, interfaces, and interactions

### OS convergence

- Windows, MacOS, Linux and few special purpose (Raspbian, TinyOS, etc.)
- OSes in the same “family” are used for different purposes → challenge for designers as they are based mostly on old models
- convergence due to cost of creation and maintenance, usage by customers → requires clear advantages over competitors
- Windows
    - most powerful PC use (laptops, desktopss) some use in servers and smaller devices
- MacOS
    - exclusively for Apple products but in all Apple products
- Linux
    - industrial servers, cloud compute, CS nerds, and embedded systems

## OS Services

- important services generally as abstractions
- CPU/Memory abstractions
    - processes, threads, VMs
    - virtual addresses, shared segments
- Persistent storage abstraction
    - files and file systems
- I/O abstraction
    - virtual terminal sessions, windows, sockets, pipes, VPNs, signals/interrupts
- Higher level abstractions
    - cooperating parallel processes
        - locks, conditional variables, distributed transactions
    - security
        - user auth, encryption
    - interface
        - GUI, desktop, window management, widgets, multi-media
- under the hood abstractions
    - power, fans, fault handling
    - software updates and configuration
    - dynamic resource allocation
        - CPU, memory, bus resources, disk, network
    - scheduling
    - networks, protocols, domains
        - USSB, BlueTooth, TCP/IP, DHCP
- how does the OS deliver services
    - apps call subroutines, syscalls, notify miiddleware
    - each options works on a diff layer of the stack software

## OS Layering

- modern OS offer services via layers of hw/sw
- high level abstract services offered t higher sw layers and vice versa
- EOD everything is mapped down to simple hw

### Software Layering

- visual
    
    ![[/Untitled 34.png|Untitled 34.png]]
    

### Service Delivery via Subroutines

- works on app level code → call subroutine → return service actions
    - invoking of service is “cheap” (nano-seconds)
    - likely runs on middleware layer
- run-time implementation binding is possible → calls subroutine when required (run-time)
- all services implemented in same address space → runs at user level → GIS
- limited ability too interwork between languages
- usually calls libraries in implementation

### via Libraries

- one subroutine delivery approach
- library is a collection of object modules
    - a single file that contains many pre-compiled files
- most OS load with a library already contained and can be expanded by add-ons
- in the middleware layer → binary interface
- **characteristics**
    - reusable code, well maintained and written
    - encapsulated complexity
    - multiple bind time options
        - static - load module at link time
        - shared - map into address space at exec time
        - dynamic - choose and load at run-time
    - no PIS access, its just code
- **sharing libraries**
    
    - static library modules are added to aa program’s load module
        - each load module has its own copy of the compiled library
        - program must be re-linked to add new libraries
    - instead → make each library module shareable code segments
        - one in memory copy processed by all
        - kept separate from load modules
        - OS loads library with prog
    - advantages
        - reduces memory consumption → faster program startups
        - simple updates → no need to re-link → progs automatically get newest version when recompiled
    - limitations
        - not all modules work in shared libs → undefined global data storage
        - added into prog memory whether or not needed
        - called routines must be defined/known at compile-time
            - i.e. only fetching is at run-time
            - symbols at compile, bound at link, fetched at run
        - Dynamic Loadable Libraries (DLLs)
            - eliminate limitations at aa price
    
      
    

### via System Calls

- force entry into OS
    - parameters/returns similar to subroutines
        - implementation is in shared/trusted kernel
- characteristics
    - able to allocate and use new/privileged resources
    - able to communicate with other processes
    - 100x-1000x slower than subroutines
- **services via the Kernel**
    - primarily functions that require privilege
        - PIS (interrups, I/O)
        - allocation of physical resources in memory
        - ensuring privacy and scope/encapsulation and integrity of critical resources
    - some operations are out-sourced
        - system daemons (background process), server processes
    - some plugins less trusted
        - device drivers, file systems, network protocols
    - kernel is in middleware
- **system** **services outside the kernel**
    - not all trusted code must be in kernel
        - may not need access to kernel resources or PIS
    - some are somewhat privileged
        - e.g. login acts as a daemon and sets user credentials
        - some can directly execute I/O
    - some are merely trusted
        - e.g. sendmail trusted to behave correctly

### via Messages

- exchanges messages with a server (via syscalls)
- advantages
    - server can be anywhere on earth
    - highly scalable and available
    - implemented in user-mode code
- disadvantages
    - 1,000x-100,000x slower than subroutines
    - limited ability to operate on process resources
- **via Middleware**
    - software that is part of the app/platform but not part of OS
        - DB, messaging system
        - HTTP/proxy servers: Apache, NGINX
        - distributed computing: Hadoop, zookeper, beowulf, openstack
        - cassandra, RAMcloud, Ceph, GLuster
    - kernel code is expensive and dangerous
        - user-mode code is easier to build/teest/debug, portable, can crash safely

  

# Resources

---

![[/Lecture_2.pdf|Lecture_2.pdf]]

  

📌

**SUMMARY  
**