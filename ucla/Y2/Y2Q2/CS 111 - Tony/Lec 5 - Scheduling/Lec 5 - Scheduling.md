[[Reading 5]]

## What is Scheduling?

- an OS has choices about what to do next
- making these decisions is sheduling
- Ex.
    - in what order to handle a set of block requests
    - if we sent multiple messages, what order should they be sent

### How to Schedule?

- different scheduling algorithms optimize different quantities
- we generally choose goals we wish to achieve and tailor to achieve those goals

### The Process Queue

- OS typically keeps a queue of processes that are ready to run, ordered by which everyone should run next
- the OS drab the first one in the queue when it comes to schedule a new process

### Potential scheduling goals

- Maximize throughput: Get as much work done as possible
- Minimize average waiting time
- Ensure some degree of fairness: e.g. minimize worst case waiting time
- Meet explicit priority goals
- Real time scheduling: Scheduled items tagged with a deadline to be met

## Types of systems & scheduling goals

We should schedule our cores by

- Time sharing
    - Fast response time to interactive programs
    - Each user gets an equal share of CPU
- Batch
    - Maximize total system throughput
    - Delays of individual processes are unimportant
- Real-time
    - Critical operations must happen on time
    - Non-critical operations may not happen at all
- Service level agreement (SLA): A contract between a service provider and its customers that documents what services the provider will furnish and defines the service standards the provider is obligated to meet.
    - Make sure all agreements are met
    - Various agreements may differ in details

### Scheduling: Policy and Mechanism

- the scheduler will move jobs onto and off a processing core
    - requiring various mechanics to do so
    - part of the scheduling mechanism
- how dispatching is done should not depend on the policy used to decide who to dispatch
- desirable to separate the choice of who runs from the dispatching mechanism
    - also desirable that OS process queue structure not be policy-dependent

### Preemptive Scheduling vs Non-preemptive Scheduling

**Non-preemptive scheduling**: Scheduled work always runs to completion

**Preemptive scheduling**: Scheduler temporarily halts running work to run something else

Pros of non-preemptive

- Low scheduling **overhead** (amount of system capacity spent on internal processes instead of other value-creating activities)
- Tends to produce high throughput
- Conceptually very simple

Cons of non-preemptive

- Poor response time for processes
- Bugs can cause machine to freeze up
    - e.g. process contains infinite loop
- Poor fairness
- May make real time and priority scheduling difficult

Pros of preemptive

- Give good response time
- Produce very fair usage
- Good for real-time and priority scheduling

Cons of preemptive

- More complex
- Requires ability to cleanly halt process and save its state
- May not get good throughput
- Possibly higher overhead

![[/Untitled 84.png|Untitled 84.png]]

### Scheduling and Performance

How policy schedule important system activities has a major effect on performance.

Scheduling performance differ under light vs heavy load.

We quantify scheduling performance using

- Candidate metric: throughput (processes/sec)
    - Process completion time not controlled by scheduler
- Candidate metric: delay (ms)
    - Time to finish a job (**turnaround time**)
    - Time to get some responses
    - Some delays are not the scheduler’s fault, which the policy can’t optimize
        - Time to complete a service request
        - Time to wait for a busy resource
        - e.g. Web browser can’t know response time of a fetched resource from a server
- Mean time to completion (sec)
    - For a particular job mix (**benchmark**)
- Throughput (operations per sec)
    - For a particular job mix (benchmark)
- Mean response time (ms)
    - Time spent on the ready queue
- Overall “goodness”
    - Requires a customer-specific weighting function
    - Often stated in service level agreements (SLAs)

![[/Untitled 1 61.png|Untitled 1 61.png]]

### Why don’t we achieve idea throughput

- scheduling is not free
    - takes time to dispatch a process (overhead)
    - more dispatches means more overhead (lost time)
    - less time per second is available to run processes
- How to minimize the performance gap
    - reduce the overhead per dispatch
    - minimize the number of dispatched per second
- this phenomenon is seen in many areas besides process scheduling

![[/Untitled 2 54.png|Untitled 2 54.png]]

### Why Does Response Time Explode?

- real system have finite limits
    - such as queue size
- when limit exceeded, requests are typically dropped
    - aka infinite response time
    - may be automatic retries (ex. TCP), but they could be dropped too
- if load arrives a lot faster than it services, lots of stuff gets dropped
- overheads will explode during periods of heavy load

### Graceful Degradation

- When is a system “overloaded”?
    - when it is no longer able to meet its service goals
- what can we do when overloaded?
    - continue service, but with degraded performance
    - maintain performance by rejecting work
    - resume normal service when load drops to normal
- what should we not do when overloaded?
    - allow throughput to drop to zero (aka stop doing work)
    - allow response time to grow without limit

### Non-Preemptive Scheduling

- the scheduled process runs until it yields CPU
- works well for simple systems
    - a small number of processes
    - with natural producer-consumer relationships
- good for maximizing throughput
    - a piggy process can starve others
    - a buggy process can lock up the entire system

## Non-Preemptive Scheduling Algorithms

- first come first served
- shortest job next
    - check the readings for more details!
- real time schedulers

### First Come First Served

- the simplest of all scheduling algorithms
- run the first process on the ready queue
- highly variable delays
- all processes will eventually be served

### When does it make sense?

- FCFS scheduling is very simple
- when response time is not important
- where minimizing overhead more important than any single job’s completion time (expensive HW)
- in embedded systems
    - where computations are brief
    - and/or exist in natural producer/consumer relationships

### Real Time Schedulers

- for certain systems, something must happen at particular times
- these systems must schedule on the basis of real-time deadlines
- can be either hard or soft

### Hard Real Time Schedulers

- the system absolutely must meet its deadlines
- by definition, system fails if a deadline is not met
- How can we ensure no missed deadlines
- typically by very, very careful analysis
    - make sure no possible schedule causes a deadline to be missed
- by working it out ahead of time
- then scheduler rigorously enforces deadlines

### Ensuring Hard Deadlines

- Must have deep understanding of the code used in each job
- vital to avoid non-deterministic timings
    - even if the non-deterministic mechanism usually speeds things up
    - you are screwed if it ever slows them down
- Typically means you do things like turn off interrupts
- and scheduler is non-preemptive
- typically you set a predefined schedule

### Soft Real Time Schedulers

- highly desirable to meet your deadlines
- but some of them can occasionally be missed
- goal of scheduler is to avoid missing deadlines
    - with the understanding that you miss a few
- may have different classes of deadlines
    - some “harder” than others
- Need not require quite as much analysis

### Soft Real Time Schedulers and Non-Preemption

- not as vital that tasks run to completion to meet their deadline
    - Also not as predictable, since you probably did less careful analysis
- in particular, a new task with an earlier deadline might arrive
- if you don’t pre-empt, you might not be able to meet that deadline

### What If you don't meet a deadline

- depends on the particular type of system
- might just drop the job whose deadline you missed
- might allow system to fall behind
- might drop some other job in the future
- at any rate, it will be well defined in each particular system

### What Algorithms Do You Use for Soft Real Time

- most common is earliest deadline first
- each job has a deadline associated with it
- keep the job queue sorted by those deadlines
- prune the queue to remove missed deadlines
- goal: minimize total lateness

## Preemptive Scheduling

- a thread or process is chosen to run
- it runs until either it yields
- or the OS decides to interrupt it
- at which point some other process/thread runs
- typically, the interrupted process/thread is restarted later

### Implications of Forcing Preemption

- a process can be forced to yield at any time
    - if a more important process becomes ready
    - if running process’s importance is lowered
- interrupted process might not be in a “clean” state
    - could complicate saving and restoring state
- enables enforced fair share scheduling
- introduces gratuitous context switches
- creates potential resource sharing problems

### Implementing Preemption

- need a way to get control away from process
    - ex. process makes a sys call, or clock interrupt
- consult scheduler before returning to process
    - has any ready process had its priority raised? or awakened? priority lowered?
- Scheduler finds highest priority ready process
    - if current process, return as usual
    - if not, yield on behalf of current process and switch to higher priority process

### Clock Interrupts

- Modern processors contain a clock
- A peripheral device
- generate an interrupt at a fixed time interval
- key technology for preemptive scheduling

  

## Round robin scheduling algorithms

Goal: fair share scheduling

All processes are offered

- Equal shares of CPU
- Experience similar queue delays
- Assigned a nominal time slice

Each process is scheduled in turn

1. Runs until it blocks, or its time slice expires
2. Then put at the end of the process queue
3. Runs again when reaches front of queue again

### Pros & Cons

Pros

- All processes get relatively quick chance to do some computation
    - At the cost of not finishing any process as quickly
    - A big win for interactive processes, e.g. keystroke
- Runaway processes do relatively little harm, which only take 1/nth of the overall cycles

Cons

- Far more context switches, which can be expensive

### I/O interrupts

Processes get halted if their time slice expires.

However, if they block for I/O (or anything else) on their own, the scheduler doesn’t halt them (they halt themselves).

Thus when I/O occurs in a process and gets blocked, some percentage of time in round robin acts no different than FIFO.

### Example

![[/Screen_Shot_2022-04-22_at_1.22.23_AM.png|Screen_Shot_2022-04-22_at_1.22.23_AM.png]]

- Average waiting time much lower than FIFO (100 vs 595 ms)
- Context switches much higher than FIFO (27 vs 5)
- First job completed time slightly higher than FIFO (475 vs 350 ms)

### Choosing a time slice

Performance depends heavily on how long a time slice is.

Long time slices avoid too many context switches, which waste cycles, giving better throughput.

Short time slices provide better response time to processes.

### Costs of a context switch

- Entering OS
    - taking interrupt, saving registers, calling scheduler
- Cycles to choose who to run by dispatcher
- Moving OS context to new process
    - Switch stack, non-resident process description
- Switching process address spaces
    - Map-out old process, map-in new process
- Losing instructions and data caches
    - Greatly slowing down the next hundred instructions
    - The most important cost for modern systems

### Priority Scheduling Algorithms

- sometimes processes aren’t all equally important
- we want to preferentially run the more important processes first
- assign each job a priority number
- run according to priority number

### Priority and Preemption

- if non-preemptive, priority scheduling is just about ordering processes
- much like shortest job first, but ordered by priority instead
- but what if scheduling is preemptive
- in that case, when new process is created, it might preempt running process

![[/Untitled 3 47.png|Untitled 3 47.png]]

### Problems With Priority Scheduling

- possible starvation
- can a low priority process ever run?
- may make more sense to adjust priorities
    - processes that have run for a long time have priority temporarily lowered
    - processes that have not been able to run have priority temporarily raised

### Hard Priorities Vs. Soft Priorities

**Hard priority**: Higher priority has absolute precedence over lower ones.

**Soft priority:** Higher priority gets a larger share of the resource than lower ones.

### Priority scheduling in Linux

Linus use a soft priority system.

Each process in Linux has a soft priority called a **nice value**: describes share of CPU that the process should get

Commands can be run to change process priorities.

- Anyone can request lower priority for his processes

### Priority scheduling in Windows

Windows has 32 different priority levels

- Half for regular tasks, half for soft real time
- Real time scheduling requires special privileged
- Use a multi-queue approach

Users can choose from 5 of these priority levels.

Kernel adjusts priorities based on process behavior.

- Goal of improving response time

## Multi-level feedback queue (MLFQ) scheduling

One time slice length may not fit all processes.

Create multiple ready queues that runs round robin in each queue

- Short quantum (foreground) tasks that finish quickly
    - Short but high priority time slices
    - To optimize response time
- Long quantum (background) tasks that run longer
    - Longer but low priority time slices
    - To minimize overhead

### How Do I Know What Queue to Put New Process Into

- if it’s in the wrong queue, its scheduling discipline causes it problems
- start all processes in short quantum (high priority) queue
    - give it a standard allocation of CPU
    - reduce its allocation everytime it runs
    - move to longer quantum (lower priority queue) after it uses its allocation
- Periodically move all processes to a higher-priority queue
    - to avoid starvation

### Pros of MLFQ

- Acceptable response time for interactive jobs
- Efficient but fair CPU use for non-interactive jobs
- Dynamic and automatic adjustment of scheduling based on actual behavior of jobs