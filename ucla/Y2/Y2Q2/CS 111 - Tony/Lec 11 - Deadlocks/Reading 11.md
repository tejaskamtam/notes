[https://pages.cs.wisc.edu/~remzi/OSTEP/threads-bugs.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/threads-bugs.pdf)

### Common Concurrency Problems

Non-deadlock bugs

- atomicity violation
- order violation

Deadlock

- Mutual exclusion: Threads claim exclusive control of resources that  
    they require (e.g., a thread grabs a lock).
- Hold-and-wait: Threads hold resources allocated to them (e.g., locks  
    that they have already acquired) while waiting for additional resources (e.g., locks that they wish to acquire).
- No preemption: Resources (e.g., locks) cannot be forcibly removed  
    from threads that are holding them.
- Circular wait: There exists a circular chain of threads such that each  
    thread holds one or more resources (e.g., locks) that are being requested by the next thread in the chain.

[https://pages.cs.wisc.edu/~remzi/OSTEP/threads-events.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/threads-events.pdf)

### Event-based Concurrency

- weight for something to occur, and when it does you check what type of event it is and do small amount of work it requires
- select()

Issues

- blocking issues
- asynchronous I/O
- manual stack management
- event handling without lock is not possible on multicore system
- does not integrate well with some system activity, ex paging (implicit blocking)

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/avoidance.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/avoidance.html)

### Deadlock Avoidance

- reservations
- over-booking
- dealing with rejection

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/monitoring.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/monitoring.html)

### Health Monitoring and Recovery

deadlock detection in real system

- difficult to perform
- inadequate to diagnose most hangs
- does not enable us to fix the problem

Check if the system is making progress:

- internal monitoring agent watch traffic
- asking client to submit failure reports
- having each server send periodic heart-beat messages
- external health monitoring service send periodic test requests to the service that is being monitored

manage recovery

- restart
    - warm start
    - cold start
    - reset and reboot
- progressive scope of restarts
    - restart only a single process
    - restart processes involved in the delivery of a service
    - restart all software on a single node
    - restart a group of nodes

false reports

- hard to know if a process actually failed, and declaring one as such can potentially be very expensive
- there are better options and trade-offs
- non-disruptive rolling upgrades
- prophylactic reboots

[**Java synchronizationLinks to an external site.**](https://docs.oracle.com/javase/tutorial/essential/concurrency/syncmeth.html)

[**Java intrinsic locksLinks to an external site.**](https://docs.oracle.com/javase/tutorial/essential/concurrency/locksync.html)

[**MonitorsLinks to an external site.**](https://en.wikipedia.org/wiki/Monitor_(synchronization))