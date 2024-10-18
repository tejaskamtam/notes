[[Reading 8]]

## Processes vs Threads

### Why not just processes?

Processes are very expensive

- To create: they own resources
- To dispatch: they have address spaces

Different processes are very distinct

- Can’t share same address space
- Can’t usually share resources

Not all programs require strong separation

- Multiple activities working cooperatively for a single goal
- Mutually trusting elements of a system

### What is a thread?

Strictly a unit of execution/scheduling.

- Each thread has its own stack, PC, registers
- But other resources are shared with other threads

Multiple threads can run in a process.

- They all share the same code and data space
- They all have access to same resources
- This makes them cheaper to create and run

Sharing the CPU between multiple threads

- User level threads (with voluntary yielding)
- Scheduled system threads (with preemption)

### When to use process?

- To run multiple distinct programs
- When creation/destruction are rare events
- When running agents with distinct privileges
- When there are limited interactions and shared resources
- To prevent interference between executing interpreters
- To firewall one from failures of the other

### When to use thread?

- For parallel activities in a single program
- When there is frequent creation and destruction
- When all can run with same privileges
- When they need to share resources
- When they exchange many messages/signals
- When you don’t need to protect them from each other

### Tradeoff

If you use multiple processes

- Your application may run much more slowly
- It may be difficult to share some resources

If you use multiple threads

- You will have to create and manage them
- You will have serialize resource use
- Your program will be more complex to write
- If threads require protection from each other, it’s your problem

## Thread content

### Thread state & Thread stacks

Each thread has its own registers, PS, PC, and stack area.

Maximum stack size specified when thread is created

- Threads in a process can’t have stacks that overlap each other
- Stack space must be reclaimed when thread exists

Procedure linkage conventions are unchanged.

### User-level vs kernel threads

Kernel threads:

- An abstraction provided by the kernel
- Still share one address space
- But scheduled by the kernel
    - So multiple threads can use multiple CPU cores at once

User-level threads:

- Kernels knows nothing about them
- Provided and managed via user-level library
- Scheduled by library, not by kernel

# IPC

Even fairly distinct processes may occasionally need to exchange information

OS provides mechanism called **inter-process communications (IPC).**

### Goals of IPC

We look for many things in an IPC mechanism.

- simplicity
- convenience
- generality
- efficiency
- robustness / reliability

Some of these are contradictory.

- Partially handled by providing multiple different IPC mechanisms

### OS support for IPC

Provided through system calls.

Typically require activity from both communicating processes.

- Usually can’t “force” another process to perform IPC

Usually mediated at each step (multiple sys calls) by OS

- To protect both processes
- And ensure correct behavior

For local processes in the machine, data is in memory space of the sender, and the data needs to get to the memory space of the receiver.

Two choices:

- OS copies the data
    - Conceptually simple
    - Less likely to lead to user/programmer confusion since each process has its own data copy
    - Potentially high overhead
- OS uses VM techniques to switch ownership of memory to the receiver.
    - Much cheaper than copying data
    - Requires changing page tables
    - Only one of the two processes sees the data at a time

### IPC: sync & async

Synchronous IPC

- Writes block until message is sent/delivered/received
- Reads block until a new message is available
- Very easy for programmer

Asynchronous operations

- Writes return when system accepts message
    - No confirmation of transmission/delivery/reception
    - Requires auxiliary mechanism to learn of errors
- Read returns promptly if no message available
    - Requires auxiliary mechanism to learn of new messages
    - Often involves “wait for any of these” operations
- Much more efficient in some circumstances

### Typical IPC operations

1. Create/destroy an IPC channel
2. Write/send/put: insert data into the channel
3. Read/receive/get: extract data from the channel
4. Channel content query (how much data is currently in the channel)
5. Connection establishment and query
    - Control connection of one channel end to another
    - Provide informations like
        - Who are the endpoints?
        - What is the status of connection?

### IPC: messages vs streams

A fundamental dichotomy in IPC mechanisms

Streams

- A continuous stream of bytes
- Write and read buffer sizes are unrelated
- Stream may contain app-specific record delimiters
- Known by application, not by IPC

Messages (datagrams)

- A sequence of distinct messages
- Each message has its own length (subject to limits)
- Each message is typically read/written as a unit
- Delivery of a message is typically all-or-nothing
- Known by IPC

Each style is suited for particular kinds of interactions.

### IPC & flow control

**Flow control**: making sure a faster sender doesn’t overwhelm a slow receiver

Queued IPC consumes system resources

- Buffered in OS until the receiver asks for it
- Faster sender increases buffer space

There must be a way to limit required buffer space.

- Sender side: block sender or refuse communication
- Receiving side: stifle sender, flush old data (to have space for new data)
- Handled by network protocols or OS mechanism

### IPC Reliability and Robustness

- Within a single machine, OS won’t accidentally lose IPC data
- Across a network, requests and responses can be lost
- even on a single machine, a sent message may not be processed
    - receiver is invalid, dead or not responding

### Reliability Options

- when do we tell the sender “OK”
- How persistently does the system attempt delivery
- Do channels/contents survive receiver restarts?

## Styles of IPC

- Pipelines
- Sockets
- Shared memory

There are some that won’t be discussed in detail.

- Mailboxes
- Named pipes
- Simple messages
- IPC signals

### Pipelines

Data flows through a series of programs

- e.g. ls | grep | sort | mail
- Macro processor | compiler | assembler

Data is a simple byte stream

- Buffered in OS
- No need for intermediate temporary files

There are no security/privacy/trust issues.

- All under control of a single user

Error conditions

- Input: end of file
- Output: next program failed

Simple, but very limiting (not so general)

### Sockets

Connections between addresses/ports

- Connect/listen/accept
- Lookup: registry, DNS, service discovery protocols

Many data options

- Reliable or best effort datagrams
- Streams, messages, remote procedure calls, etc.

Complex flow control and error handling

- Retransmissions (to another node), timeouts, node failures
- Possibility of reconnection or fail-over

Trust/security/privacy/integraty

Very general, but more complex

### Shared memory

OS arranges for processes to share read/write memory segments.

- Mapped into multiple process’ address spaces
- Applications must provide their own control of sharing
- OS is not involved in data transfer
    - Just memory reads and writes via limited direct execution
    - So very fast

Simple in some ways

- Terribly complicated in others
- The cooperating processes must themselves achieve whatever synchronization/consistency effects they want

Only works on a local machine.

### Named pipes

An extension to a traditional pipe in Unix system.

- A traditional pipe is unnamed and lasts only as long as the process
- A named pipe lasts as long as the system is up, beyond the life of process
- Created by `mkfifo()` and can be deleted if no long used

“Simple rendezvous between unrelated processes on the same machine.”

# Synchronization problems in parallelism

### Synchronization

Making things happen in the right order.

Easy if only one set of things is happening, or simultaneously occurring things don’t affect each other. Very complicated otherwise.

Since we have parallelism everywhere, we must make sure synchronization of multiple tasks.

- Results depend on the order of instruction execution
- Parallelism make execution order non-deterministic
- Results become combinatorially intractable

### Benefits of parallelism

- Improved throughput
    - Blocking of one activity doesn’t stop others
- Improved modularity
    - Separating complex activities into simpler pieces
- Improved robustness
    - The failure of one thread doesn’t stop others
- A better fit to emerging paradigms
    - Client server computing, web based services
    - Our universe is cooperating parallel processes, e.g. traffic lights for crossroad
    - The start of parallelism starts since 1970s

### Race conditions

What happens depends on execution order of processes/threads running in parallel.

- Different results on different runs with same input

But some race conditions affect correctness

- Conflicting updates (mutual exclusion)
- Check/act races (sleep/wakeup problem)
- Multi-object updates (**all-or-none transactions**: if all of the transactions occurred or none occurred)
- Distributed decisions based on inconsistent views)

Each of these classes can be managed

### Non-deterministic execution

Parallel execution makes process behavior less predictable

- Processes block for I/O or resources
- Time-slice end preemption
- Interrupt service routines
- Unsynchronized execution on another core
- Queuing delays
- Time required to perform I/O operations
- Message transmission/delivery time

# Synchronization in parallelism

Synchronization controls key points of interactions, majorly two problems.

- Critical section serialization
- Notification of asynchronous completion

## Critical section problem

A **critical section** is a resource that is shared by multiple interpreters.

- By multiple concurrent threads, processes or CPUs
- By interrupted code and interrupt handler

Use of the resource changes its state.

- Contents, properties, relation to other resources

Correctness depends on execution order

- When scheduler runs/preempts which threads
- Relative timing of asynchronous/independent events

**Mutual exclusion**: only one thread can execute a critical section at a time.

### Interrupt disables

Temporarily block some or all interrupts

- No interrupts - no other process preempts my code in the middle
- Can be done with a privileged instruction
- Side-effect of loading new Processor Status Word

Abilities

- Prevent time-slice end (timer interrupts)
- Prevent re-entry of device driver code

![[/Screen_Shot_2022-04-26_at_9.47.45_AM.png|Screen_Shot_2022-04-26_at_9.47.45_AM.png]]

Dangers

- Not an option in user mode
    - Requires use of privileged instructions
- Dangerous if improperly used
    - Could disable preemptive scheduling, disk I/O, etc.
- Delays system response to important interrupts
    - Received data is processed until interrupt serviced
    - Device will sit idle until next operation is initiated

Solutions to dangers

- Avoid shared data whenever possible
- Eliminate critical sections with atomic instructions
    - Atomic (uninterruptible) read/modify/write operations
    - Can be applied to 1-8 contiguous bytes
    - Simple: increment/decrement, and/or/xor
    - Complex: test-and-set, exchange, compare-and-swap
- Use atomic instructions to implement locks
    
    - Use lock operations to protect critical sections