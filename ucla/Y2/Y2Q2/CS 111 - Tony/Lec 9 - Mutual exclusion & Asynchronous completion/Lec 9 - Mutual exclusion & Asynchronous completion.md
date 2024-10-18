# Mutual exclusion

## Critical sections

### Critical sections in applications

Most common for multithreaded applications.

- Which frequently share data structures

Can also happen with processes.

- Which share OS resources like files

Avoidable if you don’t share resources of any kind.

### Recognizing critical sections

Generally involves updates to object state.

- May be updates to a single object
- May be related updates to multiple objects

Generally involves multi-step operations.

- Object state inconsistent until operation finishes
- Pre-emption compromises object or operation

Correct operation requires mutual exclusion.

- Only one thread at a time has access to object(s)
- Client 1 completes before client 2 starts

### Critical sections & atomicity

Using mutual exclusion to achieve **atomicity** of a critical section.

Atomicity has two aspects:

1. Before or after atomicity
    - A enters critical section before B starts, and B enter critical section after A completes, vice versa
    - There’s no overlap
2. All or none atomicity
    - An update that starts will complete or will be undone
    - An uncompleted update has no effect

Correctness generally requires both.

## 3 options for protecting critical sections

Since turning off interrupts is not possible (discussed in lec7), there are 3 options for protecting critical sections.

1. Avoid shared data whenever possible
2. Hardware mutual exclusion (atomic CPU instructions)
3. Software locking

### Avoiding shared data

Don’t share things you don’t need to share

- A good design choice if feasible
- But not always an option
- Even if possible, may lead to inefficient resource use

Sharing read-only data also avoids problems.

- If no writes, the order of reads doesn’t matter
- But a single write can make mess

### Atomic instructions

CPU instructions are uninterruptible since they only have one move, which won’t have change in order.

- Atomic (uninterruptible) read/modify/write operations
- Can be applied to 1-8 contiguous bytes
- Simple: increment/decrement, and/or/xor
- Complex: test-and-set, exchange, compare-and-swap

But we can’t generally do entire critical section in one atomic instruction.

- Unusable for complex critical sections
- Unusable as a waiting mechanism

## Locking

Protect critical sections with a data structure called **lock.**

- Only the party holding a lock can access the critical section
- When finished with critical section, release the lock, which someone else can then acquire

![[/Screen_Shot_2022-04-26_at_10.09.30_AM.png|Screen_Shot_2022-04-26_at_10.09.30_AM.png]]

### Build locks

The very operation of locking and unlocking a lock is accessing a critical section shared by parties.

- If we don’t protect it, two threads might acquire the same lock

It sounds like a chicken-and-egg problem, but we can solve it with hardware assistance

- Since individual CPU instructions are atomic.

![[/Screen_Shot_2022-04-26_at_10.15.25_AM.png|Screen_Shot_2022-04-26_at_10.15.25_AM.png]]

1. When a thread calls TS with its flag, TS sets rc (lock) and flag to true, and !TS with original returned rc=false will pass.
2. When another thread tries to access, the lock is true so !TS won’t pass

![[/Screen_Shot_2022-04-26_at_10.24.37_AM.png|Screen_Shot_2022-04-26_at_10.24.37_AM.png]]

get and free lock checks the input flag of the thread.

Another implementation

![[/Screen_Shot_2022-04-26_at_10.22.38_AM.png|Screen_Shot_2022-04-26_at_10.22.38_AM.png]]

1. The first thread that calls compare_and_swap set p to IN_USE and get the lock
2. Other threads afterwards can’t get the lock.

### Lock enforcement

Locking resources only works if either

- It’s not possible to use a locked resource without the lock
- Everyone who might use the resource carefully follows the rules

# Asynchronous completion problem

Parallel activities move at different speeds, so one activity may need to wait for another to complete

The main problem lies in: How to perform such waits without killing performance?

Examples of asynchronous completions:

- Waiting for an I/O operation to complete
- Waiting for a response of a network request
- Delaying execution for a fixed period of real time

## Spin locks

The thread that doesn’t get the load do **spin waiting**: keeps trying if the lock is unlocked until it gets the lock.

Pros

- Properly enforces access to critical sections
- Simple to program

Cons

- Wasteful (spinning uses processor cycles)
- Likely to delay freeing of desired resource
    - The cycles burned could be used by the locking party to finish its work
- Bug may lead to infinite spin-waits

### Proper use cases of spin locks

1. When awaited operation proceeds in parallel
    - A hardware device accepts a command
    - Another core releases a briefly held spin lock
2. When awaited operation is guaranteed to happen soon
    - Spinning is less expensive than sleep/wakeup
3. When spinning doesn’t delay awaited operation
    - Burning CPU delays running another process
    - Burning memory bandwidth slow I/O
4. When contention is expected to be rare
    - Multiple waiters greatly increase the cost

### Yield & Spin

1. Check if you event occurred a few times
2. Then yield and get rescheduled for a later time
3. Once rescheduled, start spinning again

However, there are problems:

1. Extra context switches
2. Still wastes cycles if you spin each time you’re scheduled
3. You might not get scheduled to check until long after lock gets unlocked
4. Works very poorly with multiple waiters (unfairness)

## Completion events

If you can’t get the lock, block. Ask OS to wake you when the lock is available.

Similarly for anything else you need to wait for

- I/O completion, another process to finish its work

Implemented with **condition variables.**

### Condition variables

Create a synchronization object associated with a resource or request.

- Requester blocks and is queued awaiting event on that object
- Upon completion, the event is posted
- Posting event to object unblocks the waiter

![[/Screen_Shot_2022-04-26_at_10.45.26_AM.png|Screen_Shot_2022-04-26_at_10.45.26_AM.png]]

1. Block a process or thread when a condition variable is used, moving it out of the ready queue
2. It observes when the desired event occurs
3. Then unblocks the the blocked process or thread, putting it back in the ready queue

Generally OS provides condition variables

- Or library code that implements the thread does

### Waiting lists

Threads will wait on several different things, so it’s pointless to wake up everyone on every event.

- Each should wake up only when his event happens

Suggests each completion event needs an associated **waiting list**

- When posting an event, consult the list to determine who’s waiting for that event
- Then choosing which thread to wait up depends on event and application
    - Wake up everyone on the list
    - One-at-a-time in FIFO order
    - On-at-a-time in priority order (possible starvation)

Evaluation of waiting list options

- Effectiveness
- Progress (tradeoff involving cutting in line)
- Fairness
- Performance

### Locking & Waiting lists

The waiting list is a shared data structure, so it has a critical section.

- A lock for the waiting list for a locked event

The sleep/wakeup race condition

![[/Screen_Shot_2022-04-26_at_11.00.38_AM.png|Screen_Shot_2022-04-26_at_11.00.38_AM.png]]

Example

1. Thread B has locked a resource and thread A needs to get that lock
2. Thread A calls sleep() and wait for the lock to be free
3. Thread B finishes and calls wakeup() to release the lock

However, if B wakes up during A calls sleeps and gets blocked, no one will wake him up since B is already finished.

![[/Screen_Shot_2022-04-26_at_11.08.56_AM.png|Screen_Shot_2022-04-26_at_11.08.56_AM.png]]

This suggests there is a critical section in sleep():

- Starting before we test the posted flag
- Ending after we put ourselves on the notify list and block

During this section, we need to prevent:

- Wakeup of the event
- Other people waiting on the event

  

[[Reading 9]]