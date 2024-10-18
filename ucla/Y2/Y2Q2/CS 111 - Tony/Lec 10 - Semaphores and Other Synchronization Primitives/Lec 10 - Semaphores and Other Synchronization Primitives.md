# Semaphores

**Semaphore** is a theoretically sound way to implement locks.

- With important extra functionality critical to use in computer synchronization problems

Semaphore is thoroughly studied and precisely specified, but not necessarily so usable.

- Like any theoretically sound mechanism, there are gaps between theory and implementation

### Computational Semaphores

Concept introduced by Edsger Dijkstra in 1968.

The classic synchronization mechanism.

- Behavior is well specified and universally accepted
- A foundation for most synchronization studies
- A standard reference for all other mechanisms

More powerful than simple locks.

- Incorporate a FIFO waiting queue
- Have a counter rather than a binary flag

### Operations of semaphores

A semaphore has two parts:

1. An integer counter (init value unspecified)
2. A FIFO waiting queue

P (proberen/test): “wait”

- Decrement counter, if count ≥ 0, return (finish wait)
- If counter < 0, add process to waiting queue

V (verhogen/raise): “post / signal”

- Increment counter
- If queue non-empty, wake one of the waiting process

e.g. When counter = -1, one thread is holding the lock and one thread is waiting for the lock

When counter = 1, nobody is using the lock

## Use semaphores for exclusion

Initialize semaphore count to 1.

- Count reflects _# of threads allowed to hold lock_

Use P/wait operation to take the lock.

- The first wait will succeed
- Subsequent waits will block

Use V/post operation to release the lock.

- Increment semaphore count to indicate one less waiting request
- If any threads are waiting, unblock the first in line

### Example of exclusion use

1. When thread A comes and take the lock, the counter decrements to 0 (meaning the lock is being held).
2. Then thread B comes and waits for A, counter is -1 (meaning one thread is waiting).
3. After thread A finishes and posts a signal, counter is 0 and runs B.
4. After B finishes, counter is 1 and allows new thread to hold the lock.

Critical section bank account balance example

![[/Screen_Shot_2022-05-07_at_10.38.29_PM.png|Screen_Shot_2022-05-07_at_10.38.29_PM.png]]

## Use semaphores for notifications

Threads wait for notifications by OS on asynchronous event arrivals.

- Event hasn’t arrive: thread waits
- Event already arrived: return to thread

Initialize semaphore count to 0

- Count reflects _# of completed events_

Use P/wait operation to await completion

- If already posted, it will return immediately
- Else all callers will block until V/post is called

Use V/post operation to signal completion

- Increment the count
- If any threads are waiting, unblock the first in line

One signal per wait: no broadcasts

### Example of notification use

Events arrived after wait

1. Thread A wants to wait for an event, calls P operation and gets blocked (count=-1)
2. Thread B calls P op and gets blocked (count=-2)
3. An event arrives, calls V op, and wakes up A. (count=-1)
4. Another event arrives, calls V op, and wakes up B. (count=0)

Events arrived before wait

1. 5 events arrived and call V op. (count=5)
2. Thread C wants 4 events, calls P op and get 4 - no need to wait. (count=1)

## Counting semaphores

Initialize semaphore count to

- # of available resources

Use P/wait operation to consume a resource

- If available, it returns immediately
- Else all callers will block until V/post is called

Use V/post operation to product a resource

- Increment the count
- If any threads are waiting, unblock the first in line

One signal per wait: no broadcasts.

### Limitations of semaphores

Semaphores are a very basic mechanism, which lacks many practical synchronization features:

- It is easy to deadlock with semaphores
- A coming thread can’t check the lock (count value) without blocking (must block if wait)
- Don’t support reader/writer shared access
    - If many processes are waiting only to read the account balance, they can access at once, which semaphores don’t support
- No way to recover from a wedged (failed) V operation
    - If a thread finished with the lock doesn’t call V, no thread in the queue gets waked up
- No way to deal with priority

Nevertheless, most OS support semaphores.

# Locking to solve high level synchronization problems

- Mutexes & object level locking
- Problems with locking and how to solve them

## Mutexes

**Mutexes** is a linux/unix locking mechanism

- Intended to lock sections of code
    - Locks are expected to held briefly
- Typically for multiple threads of the same process
- Low overhead and very general

## Object level locking

Mutexes protect code critical sections.

- Brief durations (e.g. ns, ms)
- Other threads operating on the same data
- All operating in a single address space

Persistent objects (e.g. files) are more difficult.

- Critical sections are likely to last much longer
- Many different programs can operate on them
- May not even be running on a single computer

Solution: lock _objects_ rather than code

- Typically specific to object type

### Linux file descriptor locking

**int flock(fd, operation)**

Supported `operation`

- LOCK_SH: shared lock
- LOCK_EX: exclusive lock (one at a time)
- LOCK_UN: release a lock

Lock applies to open instances of same _fd_

- Lock passes with the relevant fd
- Distinct opens are not affected

Locking with flock() is purely advisory

- Doesn’t prevent reads, writes, unlinks

### Advisory vs enforced locking

Enforced locking

- Done within the implementation of object methods
- Guaranteed to happen, whether or not user wants it
- May have problems like a thread not opening a lock or read-only threads can only access one at a time

Advisory locking

- Users are expected to lock object before calling methods
- Gives users flexibility in what and when to lock
- Mutuxes and flock() are advisory locks

### Linux ranged file locking

**int lockf(fd, cmd, offset, len)**

Supported `cmd`

- F_LOCK: get/wait for an exclusive lock
- F_ULOCK: release a lock
- F_TEST/F_TBLOCK: test, or non-blocking request
- `offset` and `len` specific portion(s) of the file to be locked (don’t need to lock the entire file)

Locks applies to file, not the open instance

- Process specific
- Closing any fd for the file releases for all of a process’ fds for that file

Locking may be enforced

- Depending on the underlying file system

# Locking problems

- Performance & overhead
- Contention
    - Convoy formation
    - Priority inversion

### Performance of locking

Locking often performed as an OS system call.

- Particularly for enforced locking

If they are called frequently, high overhead.

- So enforced locking is often only used for file locking
- Sometimes used from libraries

Many critical sections are very brief

- In and out in a matter of nanoseconds
- Overhead of locking operation may be higher than the time spent in the critical section

When a thread can’t get a lock, blocking it is much more expensive than getting a lock.

- e.g. 1000x
- Microseconds to yield and context switch
- Milliseconds if swapped-out or queue forms
- Performance depends on conflict probability
    
    ![[/Screen_Shot_2022-05-07_at_11.25.20_PM.png|Screen_Shot_2022-05-07_at_11.25.20_PM.png]]
    

## Convoy

Only one process gets the resource, and other processes get in line behind him.

- Forming a **convoy**
- Processes in a convoy are all blocked waiting for the resource
- Parallelism is eliminated

That resource becomes a **bottleneck**.

### Convoy formation

In general,

![[/Screen_Shot_2022-05-07_at_11.29.55_PM.png|Screen_Shot_2022-05-07_at_11.29.55_PM.png]]

Probability of conflict increases as threads spend more time in the critical section.

![[/Screen_Shot_2022-05-07_at_11.28.32_PM.png|Screen_Shot_2022-05-07_at_11.28.32_PM.png]]

Unless a FIFO queue forms, and Twait becomes huge.

![[/Screen_Shot_2022-05-07_at_11.30.42_PM.png|Screen_Shot_2022-05-07_at_11.30.42_PM.png]]

Throughput drops since parallelism ceases.

![[/Screen_Shot_2022-05-07_at_11.33.16_PM.png|Screen_Shot_2022-05-07_at_11.33.16_PM.png]]

## Priority inversion

Priority inversion means that the priority associated with a process becomes somewhat meaningless.

It can happen in priority scheduling systems that use locks

- A low priority process P1 has mutex M1 and is preempted
- A higher priority process P2 blocks for mutex M1
- P2 is effectively reduced to priority of P1

### The Pathfinder Priority Inversion

- special purpose hardware running VxWorks real time OS
- used preemptive priority scheduling
    - so a high priority task should get the processor
- multiple components shared an information bus
    - used to communicate between components
    - essentially a shared memory region
    - protected by a mutex

### Example

Process B can’t get the lock from M since it has lower priority and can’t release the lock.

![[/Screen_Shot_2022-05-08_at_12.05.35_AM.png|Screen_Shot_2022-05-08_at_12.05.35_AM.png]]

### Priority inheritance

Solves priority inversion by temporarily increase the priority of the running process that holds the lock.

- Processes will execute by the order of priority again.

In the previous example, gives M higher priority so it can unblocks B once it finishes.

## Reduce overhead & contention of locking

### Reduce overhead

Locking code in OS is usually highly optimized

- Not much more to be done here

### Reduce contention

- Eliminate the critical section (shared resource)
    - Give everyone their own copy
    - Use atomic instructions (only possible for simple operations)
- Eliminate preemption during critical section
    - Get out of the critical section as soon as possible
    - Carefully extend their time slice in scheduling
- Reduce time spent in critical section
    - Complete blocking operations that doesn’t require the shared resources before or after the process enters the critical section
        - e.g. I/O, allocate memory for the process
    - Minimize code inside the critical section
- Reduce frequency of entering critical section
    - Batch operations
    - “Sloppy counters”: move most updates to a private resource
        - e.g. When need to update a counter, update the local counter for each process, and update the global counter later when needed.
        - Cons:
            - Global counter is not always up to date
            - Thread failure could lose many updates
- Reduce exclusive use of the serialized resource
    - Allow multiple readers, only writers require exclusive access
        - By research, read/writes > 50 for file, > 1000 for directory
    - Only enforce exclusivity when a writer is active
        - Potential starvation if writers must wait for readers
        - Solution: give writers higher priority and blocks readers
- Spread requests out over more resources
    - change lock granularity
    - Divide the shared resources into multiple pieces
        - If process A only need to lock piece 1, process B can access piece 2
    - Coarse grained - one lock for many objects
        - simpler, and more idiot proof
        - greater resource contention
    - Fine grained - one lock per object
        - spreading activity over many locks reduces contention
        - dividing resources into pools shortens searches
        - a few operations may lock multiple objects pools
    - However, there may be more locks, time/space overhead, and more gets/releases

### Lock Granularity - Pools vs Elements

- consider a pool of objects, each with its own lock
- most operations lock only one buffer within the pool
- but some operations require locking the entire pool
    - 2 threads both try to add buffer AA to the cache
    - thread 1 looks for buffer B while thread 2 deleting it
- the pool lock could become a bottle-neck, so
    
    - minimize its use
    - reader/writer locking
    - sub-pools
    
      
    

[[Reading 10]]