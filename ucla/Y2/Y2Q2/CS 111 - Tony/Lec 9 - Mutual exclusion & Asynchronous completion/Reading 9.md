[https://pages.cs.wisc.edu/~remzi/OSTEP/threads-locks.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/threads-locks.pdf)

### Pthread Locks:

- mutex()
- mutual exclusion between threads

### How to build a lock

1. does it provide mutual exclusion?
    1. earliest solution: disable system interrupt
2. is it fair?
3. performance

### Spin Lock

**test and set** instruction, return status of the lock while simultaneously updating it

- provide mutual exclusion
- no fairness, a thread spinning may spin forever
- performance - single processor bad, multiple CPUs maybe good

**compare and swap**

- identical behavior to test and set if just used for spin lock mechanism

### Load-Linked and Store-Conditional

### Fetch And Add

- ticket lock
    - ensure progress for all locks

### Yielding instead of Spinning

- yield()

### Sleeping with Queue

- park()
- unpark()

### Futex Lock

### Two Phase Locks

[https://pages.cs.wisc.edu/~remzi/OSTEP/threads-cv.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/threads-cv.pdf)

### Condition Variable

- Want parent to sleep and release the lock until the child is done executing and can use the lock.
- wait() - executed when a thread wishes to put itself to sleep
- signal() - is executed when a thread has changed something in program and thus wants to wake a sleeping thread waiting on the condition

  

### Producer / Consumer, Bounded Buffer

- producers generate data items and place them in buffer, consumer grab items from the buffer than consume them
- lock the pipe when writing / accessing data
- Hoare semantics vs mesa semantics
- consumer shouldn’t wake other consumers and producer shouldn’t wake producers
- **covering condition** - cover all the cases where a thread needs to wake up

[https://man7.org/linux/man-pages/man2/flock.2.html](https://man7.org/linux/man-pages/man2/flock.2.html)

flock()

  

[https://man7.org/linux/man-pages/man3/lockf.3.html](https://man7.org/linux/man-pages/man3/lockf.3.html)

lockf()