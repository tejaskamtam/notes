[https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-sched.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-sched.pdf)

### Scheduling:

turnaround time - time at which the job completes minus the time at which the job arrived in the system

### Metric: Turn around time

### FIFO:

- simple and easy to implement
- can cause convoy effect - short tasks got queued behind long tasks

### Shortest Job First

- good average turnaround time if all tasks arrive at the same time

### Shortest Time to Completion First

- allow for preemption
- good if only measure average turnaround time
- not so good for response time

### Metric: Response time

### Round Robin

- time slicing
- if time slice is too short, bad overhead

  

[https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-sched-mlfq.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/cpu-sched-mlfq.pdf)

### Multi-Level Feedback Queue

- Rule 1: If Priority(A) > Priority(B), A runs (B doesn’t).
- Rule 2: If Priority(A) = Priority(B), A & B run in RR.
- Rule 3: When a job enters the system, it is placed at the highest priority (the topmost queue).
- Rule 4: Once a job uses up its time allotment at a given level (regardless of how many times it has given up the CPU), its priority is reduced (i.e., it moves down one queue
- Rule 5: After some time period S, move all the jobs in the system to the topmost queue

[https://lasr.cs.ucla.edu/reiher/cs111/realtime.html](https://lasr.cs.ucla.edu/reiher/cs111/realtime.html)

## Real Time Scheduling

different metrics than traditional time share and fairness:

- timeliness
- predictability
- feasibility
- hard real time
- soft real time

Difference:

- may know how long each task will take to run, more intelligent scheduling
- starvation may be acceptable
- may have fixed workload

### Real Time Scheduling Algorithms

- may have static scheduling
- may not like preemption