---
area: ucla
quarter: Y3Q1
created: 2023-10-05 08:03
updated: Friday 6th October 2023 10:22:07
course: CS 131
📕 courses:
  - "[[CS 180 - Algorithms]]"
---

# Supplemental
- no sudocode or code for algos
- make steps in bullets, NO paragraphs
- don't make assumptions abt the problem unless stated
# Run Time
- the stable matching has complexity $O(n^2)$ in terms of *iterations*
- But run time $T(n)\stackrel{?}{=} O(n^2)$ iff. each iteration has a constant run time
- We find this by picking apart the steps:
## Gale-Shapley Run Time Analysis
Per iteration:
1. identify a free student
	1. if we use a linked list for students, picking first is const time, and if we displace a student, placing them back is const time at front or back
2. For each student $s$ find the highest-ranked med school $m$ that the student has not approached before
	1. if we use an array (pre-sorted by ranking) for each student, then checking the first element is const. time
3. For med $m$ check if it's paired, and find the student $s'$ paired with $m$
	1. we can store this as a single integer for each med school representing the assigned student, all initialized at 0 at the beginning and once assigned, only switch to another assignment if at all, thus const. time
4. Find $m$'s relative ranking of $s$ and $s'
	1. if we also give m a priority list of students using a hashmap or a list where the index is the student and the value is the ranking, we can get the ranks and compare in const. time


# Election Problem
## Problem Statement
- $m$ candidates, $n$ votes (stored as an array of size $n$ with possible values being candidates 1,...,$m$)
- majority - the number of votes is $\gt n/2$  $\therefore$  either 0 or 1 majorities
-  $m$ and $n$ might NOT be const (they could be functions of each other)
- Find the majority candidate if there exists one
- only use constant additional storage
- algo should run in linear time $O(n)$
## Consider problem minimization
- given a list of 11 votes where one of them is 3, and another is 2 (arbitrarily)
- then the majority must have 6 or more votes for that number (e.g., 6 3s)
- now delete those two (3,2) from the list of 11 to make a list of 9 -> This list should still have a majority (if we deleted a majority) e.g. 5 or more 3s
## Algo
- create storage one int for majority candidate number, another int for count
- iterate through the votes, and store the `[1,1]` as the ints `[maj_cand,count]`
- if the next vote is the same as the current `maj_cand`, increase the count, else decrease the count, if count reaches 0 set `maj_cand`
- if the count goes from 0 to 1, change the `maj_cand` to whoever changed the count from 0 to 1
- at the end of the first scan, the count means nothing but the `maj_cand` left remaining is the only possible `maj_cand` possible if count is > 1, else if `maj_cand` is 0 i.e., count is 0 -> no majority
- now do another scan and verify the possible majority candidate `maj_cand` by counting the number of appearances and check $\gt n/2$
- thus, $f(n)=2n=>O(n) 