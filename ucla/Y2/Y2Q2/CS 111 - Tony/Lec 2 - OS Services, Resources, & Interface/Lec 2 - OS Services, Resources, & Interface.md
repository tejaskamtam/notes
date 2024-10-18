## The OS and Abstraction

- One major function of an OS is to offer abstract versions of resources
    - as opposed to actual physical resources
- the OS implements the abstract resources using the physical resources
    - Ex. processes (an abstraction) are implemented using the CPU and RAM (physical resource)
    - files (an abstraction) are implemented using flash drives (physical resource)

## Why Abstract Resources?

The abstractions are typically simpler and better suited for programmers and users

- easier to use than the original resources
- compartmentalize/encapsulate complexity
    - Ex. don’t need to worry about what other executing code is doing and how to no disrupt it
- eliminate behavior that is irrelevant to the user
    - Ex. hide the slow erase cycle of flash memory
- create more convenient behavior
    
    - Ex. make it look like you have the network interface entirely for your own use
    
      
    

## Generalizing Abstractions

- Lots of variations in the machines’ HW and SW
- Make many different types appear the same
- usually involves a common unifying model
- Ex.
    - printer drivers make different printers look the same
    - browser plug-ins to handle multi-media data

# **Common Types of OS Resources** 🤟

## Serially Reusable Resources

- used by multiple clients, but only one at a time
    - time multiplexing
    - Ex. core on CPU
- Require access control to ensure exclusive use
- Require graceful transitions from one user to the next
- Ex. printer 🖨️, bathroom stalls 🚽

### What is a Graceful Transition? ✊

A switch that totally hides the fact that the resource used to belong to someone else

- don’t allow the second user to access the resource until the first user is finished with it
    - no incomplete operations that finish after the transition
- ensure that each subsequence user finds the resource in “like new” condition
    - no traces of data or state left over from the first user

## Partitionable Resources

- divided into disjoint pieces for multiple clients
    - spatial multiplexing
- needs access control to ensure
    - **containment** - you cannot access resources outside of your partition
    - **privacy** - nobody can access resources in your partition
- Ex. RAM, Hotel Room 🏨, hard drive 💽

**Do we still need graceful transitions?**

- Yes
- most partitionable resources aren’t permanently allocated
- the piece of RAM using currently will belong to another process later

  

## Shareable Resources

- usable by multiple concurrent clients
    - clients don’t wait for access to resource
    - clients don’t own particular subsets of the resource
- may involve limitless resources
    - air in a room 🌬️, shared by occupants
    - copy of OS shared by many

**Do we need graceful transitions?**

- usually not
- shareable resource usually doesn’t change state or isn’t reused
- we never have to lean up what doesn’t get dirty
    - like an execute-only copy of the OS
- Shareable resources are great! 👍

## General OS Trends

- They have grown larger and more sophisticated
- their role has fundamentally changed
    - from shepherding the use of the hardware
    - to shielding the applications from the hardware
    - to providing powerful application computing platform
    - to becoming a sophisticated “traffic cop”
- They still sit between applications and hardware
- Best understood through the services they provide

### Why?

- the OS must provide core services to applications
- applications have become more complex
    - more complex internal behavior
    - more complex interfaces
    - more interactions with other software
- the OS needs to help with all that complexity

## OS Convergence

- There are only a handful of widely used OS
    - window, mac, and linux 😢
    - and a few special purposes ones for ex. real time and embedded system OSes
- OSes in the same family are used for vastly different purposes
- Most OSes are based on the pretty old models

### Why Have OSes Converged?

- They’re expensive to build and maintain
- only successful if users choose them over other OS options
    - which can’t happen unless you support all the apps the users want
    - which requires other parties to do a lot of work
- you need to have some clear advantage over present acceptable alternatives

## Where Are the Popular OSes Used?

- Windows:
    - most popular choice for personal computers
- MaxOS:
    - all apple products
- Linux:
    - run servers (cloud computing)
    - for nerds

## OS Services

- the OS offers important services to other programs
- Generally offered as abstractions
- Important basic categories:
    - CPU/Memory Abstractions
        - processes, threads, virtual machines
        - virtual address spaces, shared segments
    - Persistent storage abstractions
        - Files and file systems
    - Other I/O abstractions
        - Virtual terminal sessions, windows
        - Sockets, pipes, VPNs, signals (as interrupts)

## Services: Higher Level Abstractions

- Cooperating parallel processes
    - locks, condition variables
    - distributed transactions, leases
- Security
    - User authentication
    - secure sessions, at-rest encryption
- User interface
    - GUI widgets, desktop and window management
    - multi-media

## Services: Under the Covers

- enclosure management
    - hot-plug, power, fans, fault handling
- Software updates and configuration registry
- Dynamic resource allocation and scheduling
    - CPU, memory, bus resources, disk, network
- Networks, protocols and domain services
    - USB, BlueTooth
    - TCP/IP, DHCP, LDAP, SNMP
    - iSCSI, CIFS, NFS

## How do the OS deliver services?

- app can call **subroutines**
- app can make **system calls**
- app can send messages to **software that performs the services**

## OS Layering

- Modern OSes offer services via layers of software and hardware
- high level abstract services offered at high software layers
- lower level abstract services offered deeper in the OS
- everything mapped down to relatively simple hardware

![[/Untitled 82.png|Untitled 82.png]]

## Service Delivery through Subroutine

- access services via direct subroutine calls
- high layers
- Pros 💚
    - extremely fast
    - run time implementation binding possible
- Cons ❤️
    - all services implemented in same address space
    - limited ability to combine different languages
    - can’t usually use privileged instructions

### Service Delivery via Libraries

- one subroutine service delivery approach
- A library is a collection of object modules
    - a single file that contains many files
    - can be used directly without recompiling

### Characteristics of Libraries

Advantages 👏:

- reusable code makes life easier
- a single well-written and maintained copy
- encapsulates complexity

Multiple bind-time options

- static - include in load module at link time
- shared - map into address space at exec time
- dynamic - choose and load at run-time

### Sharing Libraries

**Static Library** modules are added to a program’s load module

- each load modules has its own copy of each library
- program must be re-linked to incorporate new library

Instead, make each library a sharable code segment

- One in-memory copy, shared by all processes
- Keep the library separate from the load modules
- Operating system loads library along with program

### Advantages of Shared Libraries

- reduced memory consumption
- faster program start-ups
- simplified updates

### Limitations of Shared Libraries

- not all modules will work in a shared library
- they are added into program's memory
    - might not be used
- called routines must be known at compile time
    - only fetching of the code is delayed until runtime
    - symbols known at compile time, bound at link time
- **Dynamically Loadable Libraries** are more general
    - eliminate all of these limitation

### Dynamically Loaded Libraries:

- library loaded only when called
- each program that require the library will load its own private copy of the library in RAM

## Service Delivery via System Calls

- force an entry into the OS
    - parameters/return similar to subroutine
    - implementation is in shared and trusted kernel
- Advantages ✅
    - able to allocate/use new/privileged resources
    - able to share and communicate with other process
- Cons: ❌
    - 100x - 1000x slower than subroutine calls

### Providing Services via the Kernel

- primarily functions that require privilege
    - privileged instructions (interrupts, I/O)
    - allocation of physical resources
    - ensure process privacy and containment
    - ensure integrity of critical resources
- Some operations may be out-sourced
    - System daemons, server processes
- some plug-ins may be less trusted
    - Device drivers, file systems, network protocols

### System Services Outside the Kernel

- Not all trusted code must be in the kernel
    - may not need access to kernel data structure or execute privileged processes
- some are actually somewhat privileged process
    - login can create/set user credentials
    - some can directly execute I/O operations
- Some are merely trusted
    - sendmail is trusted to properly label messages
    - NFS driver is trusted to honor access control data

## Service Delivery via Messages

- exchange messages with a server
- advantages ✅
    - server can be anywhere on earth
    - service can be highly scalable and available
    - service can be implemented in user-mode code
- disadvantages ❌
    - 1000x - 100000x slower than subroutine
    - limited ability to operate on process resources

### System Services via Middleware

- Software that is key part of the app or service platform, but not in the OS
    - database, pub/sub messaging system
    - apache, nginx
    - cassandra, ramcloud, ceph
- kernel code is very expensive and dangerous
    
    - user-mode code is easier to build, test, and debug
    - user-mode code is more portable
    - user-mode code can crash and be restarted