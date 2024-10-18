### What is a deadlock?

1. A situation where two entities have each locked some resource
2. Each needs the other’s locked resource to continue
3. Neither will unlock till they lock both resources

Therefore, neither can ever make progress

### Why is deadlock important?

- A major peril in cooperating parallel processes
    - Relatively common in complex applications
    - Result in catastrophic system failures
- Finding them through debugging is very difficult
    - They happen intermittently and are hard to diagnose
    - Much easier to prevent at design time
- Once you understand them, you can avoid them
    - Most deadlocks result from careless/ignorant design

### Deadlocks may not be obvious

- Process resource needs are ever-changing, depending on
    - what data they are operating on
    - where in computation they are
    - what errors have happened
- Modern software depends on many services
    - Most of which are ignorant of one another
    - Each of which requires numerous resources
- Services encapsulate much complexity
    - We don’t what resources they require
    - We don’t know when/how they are serialized

### Deadlocks & different resources types

1. Commodity resources
    - Clients need an amount of it, e.g. memory
    - Deadlocks result from over-commitment
    - Avoidance can be done in resource manger
2. General resources
    - Clients need a specific instance of something
        - A particular file or semaphore
        - A particular message or request completion
    - Deadlocks result from specific dependency relationships
    - Prevention is usually done at design time

## Four basic conditions for deadlocks

For a deadlock to occur, 4 conditions must hold

1. Mutual exclusion
2. Incremental allocation
3. No pre-emption
4. Circular waiting

### Mutual exclusion

The resources in question can each only be used by one entity at a time.

- If multiple entities can use a resource, just give it to all of them
- If only one can use it, others can only use it until the resource holder releases it

### Incremental allocation

Processes are allowed to ask for resources whenever they want.

- As opposed to getting everything they need before they start

If they must pre-allocate all resources, either:

- They get all they need and run to completion
- They don’t get all they need. gets block, spin wait to get the lock again

In either case, no deadlock.

### No pre-emption

When an entity has a lock, nobody else can take it away.

- If you can, deadlock are simply resolved by taking someone’s resource away.

### Circular waiting

A waits on B which waits on A

In graph term, there’s a cycle in a graph of resource requests

- which can involve more than two entities

![[/Screen_Shot_2022-05-12_at_8.23.30_PM.png|Screen_Shot_2022-05-12_at_8.23.30_PM.png]]

If there is no such cycle, someone can complete without anyone releasing a resource.

## Deadlock avoidance

Use methods that guarantee that no deadlock can occur, by their nature.

Advance reservations

- The problems of under/over-booking
- Dealing with rejection

### Avoiding deadlocks using reservations

Advance reservations for commodity resources

- Resource manager tracks outstanding reservations
- Only grants reservations if resources are available

Over-subscriptions are detected early

- Before processes ever get the resources

Client must be prepared to deal with failures

- But these don’t result in deadlocks

Dilemma: over-booking vs under-utilization

### Overbooking vs Under-utilization

Processes generally can’t perfectly predict their resource needs.

- To ensure they have enough, they tend to ask for more than they will ever need

The resource manager can either:

- Grants requests until everything’s reserved
    - But most of it won’t be used
- Grants requests beyond the available amount
    - But someone won’t get a resource he reserved

### Handling reservation problems

Clients seldom need all resources all the time

- All clients won’t need allocation at the same time

We can “safely” over-book resources

- One where everyone will be able to complete
- Some people may have to wait for other complete
- We must be sure there are no deadlocks

### Commodity resource management

Advanced reservation mechanisms are common.

- Memory reservations
- Disk quotas, quality of service contracts

Once granted, system must guarantee reservations.

- Allocation failures only happen at reservation time
- One hopes before the new computation has begun
- System behavior is more predictable, easier to handle

e.g. AWS can guarantee high utilization from reservation of requests.

But clients must deal with reservation failures.

### Dealing with reservation failures

Resource reservation eliminates deadlock.

But apps must deal with reservation failures

- Application design should handle failures gracefully
    - e.g. refuse to perform new request, but continue running
- App must have a way of reporting failure to requester
    - e.g. error messages or return codes
- App must be able to continue running
    - All critical resources must be reserved at start-up time

Rejecting app request is not great, but it’s better than failing later.

- With advance notice, app may be able to adjust service to no need the unavailable resource.
- If app is in the middle of servicing a request and got no allocation, it must undo everything half-way

## Deadlock prevention

Deadlock avoidance tries to ensure no lock causes deadlock, while deadlock prevention tries to assure that a _particular_ lock doesn’t cause deadlock.

- By attacking one of the four necessary conditions for deadlock
- If any one doesn’t hold, no deadlock

### Mutual exclusion

Deadlock can’t happen over a shareable resource or private resource.

### Incremental allocation

Incremental allocation only release a lock until the next lock required is freed.

1. Allocate all required resources in a single operation
    - If the process can’t get everything, system returns failure and locks nothing
    - When the process returns, it have all or nothing
2. Non-blocking requests
    - A request that can’t be satisfied will immediately fail, rather than being blocked
3. Disallow blocking while holding resources
    1. Release all held locks prior to blocking
        - the blocking may be due to can’t get another lock
    2. Reacquire them after you return
        - reacquire locks must be in a single all-or-none transaction

### No pre-emption

Deadlock can be broken by resource confiscation.

- Resource “leases” with time-outs and “lock breaking”
- Resource can be seized and reallocated to new client

Revocation (roll back everything the previous holder done to the resource) must be enforced.

- Invalidate previous owner’s resource handle
- If revocation is not possible, kill the previous owner

Some resources may be damaged by lock breaking.

- Previous owner was in the middle of critical section
- May need mechanisms to audit/repair resource

If preemption will be used, resources must be designed with revocation in mind.

The OS can only “seize” a resource when

- It knows where the lock is
- It can invalidate (give signal to stop) the current holder’s resource handle

OS can’t revoke a process’ access if the process has direct access to the object.

- e.g. the object is part of the process’ address space
- Revoking access requires destroying the address space
- Usually killing the process

### Circular dependencies

Using **total resource ordering.**

- All requesters allocate resources in same order
- First allocate resource R1 and then R2 afterwards
- Someone else may have R2 but he doesn’t need R1

Assumes we know how to order resources.

- Order by resource type, e.g. groups before members
- Order by relationship, e.g. parents before children

May require a **lock dance.**

- release R2, allocate R1, reacquire R2

### Lock dance

![[/Screen_Shot_2022-05-12_at_10.36.43_PM.png|Screen_Shot_2022-05-12_at_10.36.43_PM.png]]

When a process needs use a resource in a buffer, we want to lock it, or even remove it.

- List head must be locked for searching, adding, and deleting.
- Individual buffers must be locked to perform I/O and other operations.

To avoid deadlock, we must always lock the list head before we lock an individual buffer.

To find a desired buffer

1. read lock list head
2. search for the desired buffer
3. lock the desired buffer
4. unlock list head
5. return (locked) buffer

To delete a (locked) buffer from list

1. unlock buffer (because we can’t unlock the list head or any buffer before it when it’s locked)
2. write lock list head (update pointers)
3. search for the desired buffer
4. lock the desired buffer
5. remove from list
6. unlock list head

### Which avoidance & prevention approach to use?

There is no universal solution to all deadlocks.

- Fortunately, we don’t need one solution for all resources
- We only need a solution for each resource

Solve each individual problem any way you can

- Make resources wherever possible
- Use reservation for commodity resources
- Ordered locking or no hold-and-block where possible
- As a last resort, leases and lock breaking

OS must prevent deadlocks in all system services.

### Ignore deadlocks

Since measures to avoid or prevent deadlocks are very expensive, the OS developer can ignore them and hope they don’t happen.

If any measures isn’t used, just detect deadlocks and recover when they happen.

## Deadlock detection & recovery

Allow deadlocks to happen, detect if they happened and recover.

### Implement deadlock detection

To detect all deadlocks, need to identify all resources that can be locked

- Not always clear in OS, especially if some locks are application level

Must maintain wait-for graph or equivalent structure.

- When lock requests, the structure is updated and checked for deadlock

### Deadlocks outside OS

Some application use locking internally

- Not as an OS feature
- Built into the application’s own code

Database systems are a main example

- Often allow locking of records
- OS knows nothing of these locks

Deadlock detection may make sense here.

- Since the database knows all relevant locks
- OS rolls back a transaction resulted in deadlocks

### Not all synchronization bugs are deadlocks

There are other problems

- Livelock
    - Process is running, but won’t free resource R1 until it gets message
    - Process that will send the message is blocked for R1
    - R1 is locked to wait for a process that won’t be blocked for a long time
- Flaws in lock implementation
- Simple bugs in how code operates

Therefore, an approach that handles the whole range synchronization bugs is helpful to know why OS is not making progress.

## Dealing with general synchronization bugs

Deadlock detection seldom makes sense

- Extremely complex to implement
- Only detects true deadlocks for a known resource

Service/application **health monitoring** is better.

- Monitor application progress/submit test tractions
- If response takes too long, declare service “hung”

### Process health monitoring

Monitor process health by:

- Look for obvious failures
    - Process exists or core dumps
- Passive observation to detect hangs
    - Is the process consuming CPU time, or is it blocked?
    - Is the process doing network and/or disk I/O?
- External health monitoring
    - “Pings” (send a message to the process and see if it receives)
    - Null requests and standard test requests ((similar to pings to see if it response)
- Internal instrumentation
    - White box audits (an administration panel that shows what every process/thread is doing)
    - Exercisers (is work getting done), monitoring

Pros of health monitoring

- Easy to implement
- Can detect a wide range of problems

### What to do with “unhealthy” processes?

Kill and restart “all of the affected software”

- Since the hung processes may not be the ones that are broken, they are caused by related processes
    - e.g. blocked but needs to send a message to the hung process
- Kill and restart as many related processes as necessary, but as few as possible

How kills and restarts affect current clients depends on the service APIs and protocols

- App must be designed for cold/warm/partial restarts

Highly available systems, e.g. AWS, define restart groups

- Define inter-group dependencies, e.g. restart B after A

### Failure recovery methodology

- Retry if possible, but not forever.
    - Client should not be kept waiting indefinitely
    - Resources are being held while waiting to retry
- Roll back failed operations and return an error.
- Continue with reduced capacity or functionality.
    - Accept requests you can handle, reject those you can’t
- Automatic restarts (cold, warm, partial)
- Escalation mechanisms for failed recoveries
    - Restart more groups, reboot more machines

# Making synchronization easier

Locks, semaphores, mutexes are hard to use correctly

- Might not be used when needed
- Might be used incorrectly
- Might lead to deadlock, livelock, etc.

How to make synchronization easier for programmers?

### One approach

Identify shared resources.

- Objects whose methods may require serialization

Write code to operate on those objects.

- Assume all critical sections will be serialized.

Compilers generates the serialization.

- Automatically generated locks & releases
- Using appropriate mechanisms
- Correct code in all places

## Monitors

Each monitor object has a semaphore.

- Automatically acquired on any method invocation
- Automatically released on method return

Good encapsulation.

- Developers don’t need to identify critical sections
- Clients don’t need to be concerned with locking
- Protection is completely automatic

High confidence of adequate protection.

### Java synchronized methods

Each objects has an associated mutex.

- Only acquired for specified methods
- Nested calls (by the same thread) don’t reacquire
- Automatically released upon final return

Static synchronized methods lock class mutex.

Pros

- Finer lock granularity, reduced deadlock risk

Cons

- Developers must identify serialized methods

![[/Screen_Shot_2022-05-23_at_1.36.20_PM.png|Screen_Shot_2022-05-23_at_1.36.20_PM.png]]

  

[[Reading 11]]