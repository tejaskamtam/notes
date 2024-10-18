---
course: CS 180
area: ucla
created: 2023-10-03T07:51
updated: 2023-10-03T09:02
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
# Supplemental

# Lecture

## Stable Matching Problem

- set A and B of n elements
- each element of each set has a full and unique ranking of all elements of the other set (priority list)
    - some problems only have 1 set matching
- must be a complete matching
    - from sset A of n obj and B of n obj
    - we want exactly 1-to-1 matching
- must be a stable matching
    - there are no unstable pairs
    - unstable pair - x prefers y’ to its assigned y AND y’ prefers x to its assigned x’

## Gale-Shapley (”Propose-and-reject”, 1962)

- algorithm - GUARANTEES stable matching
- pick an arbitrary element from set A, e.g., 4
- now pick 4’s FIRST preference from set B: m1
- TREE: check if m1 is already matched to some other element of A
    - if it’s already matched, e.g., with 7
        - check if 4 comes before or after 7 in m1’s preference list
            - prefers 4 more than 7
                - match 4 and m1
            - else - move onto 4’s next mot preferred: m2 (and loop until matched)
    - else - match
- now loop until there are no unmatched elements of set A

### Worst case time complexity: O(n^2)

### Termination

- terminates after at most $n^2$ iterations
- after $n$ elements from $B$ gets matched, e.g., $m_1$, it never gets unmatched only traded up - only the elements of set A can be unmatched
- each iteraation an element of set A proposesmatch with a NEW element of B
- so, there are only at most n^2 possible proposals

### Perfection

- all elements are matched exatly for 1 pairing
- Contradictorily: if one from A is not matched, then another from B is not matched
- so we can pair these up so theres no more unmatched

### Stability
- no unstable pair
![[Pasted image 20231006110118.png]]


## Run Time Analysis
Per iteration:
1. identify a free student
	1. if we use a linked list for students, picking first is const time, and if we displace a student, placing them back is const time at front or back
2. For each student $s$ find the highest-ranked med school $m$ that the student has not approached before
	1. if we use an array (pre-sorted by ranking) for each student, then checking the first element is const. time
3. For med $m$ check if it's paired, and find the student $s'$ paired with $m$
	1. we can store this as a single integer for each med school representing the assigned student, all initialized at 0 at the beginning and once assigned, only switch to another assignment if at all, thus const. time
4. Find $m$'s relative ranking of $s$ and $s'
	1. if we also give m a priority list of students using a hashmap or a list where the index is the student and the value is the ranking, we can get the ranks and compare in const. time

# Resources

---

![[hosted/Excalidraw/attachments/01StableMatching-2x2.pdf|01StableMatching-2x2.pdf]]