---
course: CS 180
area: ucla
created: 2023-09-28T08:15
updated: 2023-10-03T20:30
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
# Supplemental

- algorithm - portable, a process/rules to solve problems
- ALWAYS use “arbitrary” unless randomness is required

# Lecture

- Lower Bound - the most optimized algo
- von Neumann Model of computation - serial model in this class
    - I/O (1u time), ALU (1u), REG (const), MEM (1u)
    - 95% of problems covered use this model of computation
    - complexity determined by a number of “questions” (checks) performed per iteration
- optimization criteria - reach the lower bound model of computation by asking the fewest questions across all iterations
- worst case analysis - worst time complexity

## Finding the “Famous” person

- someone is famous if everyone knows them AND they know no-one
- threfore, either 1 or 0 famous people

### Naive

- for each person we ask n-1 other people if they know them and another n-1 if t person knows veryone else
- thus 2(n-1) for each person, and 2n(n-1) ⇒ 2n for the whole population

### Optimized

- with 1 qustion: A knows B ⇒ yes - A not famous OR no - B not famous

1. Do a pair test (explained above) and eliminate A or B
2. Repeat (1) n-1 times
3. The 1 remaining person is the ONLY candidate to be famous

- this is n-1 to get here

1. Now ask everyone about the last person ⇒ 2(n-1)
2. Ask the last person about everyone else ⇒ 3(n-1) ⇒ O(n)

- polynomial time complxities - log n, kn, n^k - we will cover only these in class
- exponential time complxitiies - k^n, n!, … - incredibly slow

### Order notation

- $f(n)=O(g(n))\quad iff.\quad f(N)\le c\cdot g(n),\space \forall n \ge n_0\space|\space n_0 \gg 0$﻿
- technically $n$﻿ is also $O(2^n)$﻿ but not $O(\log n)$﻿

# Discussion

  

# Resources

---

[](https://www.notion.soundefined)

📌

**SUMMARY  
**