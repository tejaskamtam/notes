---
course: MATH 61
area: ucla
created: 2022-10-23T16:26
updated: 2022-10-27T17:20
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 11 - Recurrence Relations - 7.1

layout: note

---
# Recall

# Notes

Examples

- e.g. $S_n=5+(n-1)\cdot3,n\ge1$﻿
    - i.e. 5, 8, 11, 14, 17, …
    - $S_1=5$﻿
    - $S_2=5+3=S_1+3$﻿
    - …
    - $\therefore$﻿ the recurrence relation is defined to be:
    - $S_n=S_{n-1}+3,n\ge2,S_1=5$﻿
- e.g. Fibonacci
    - $f_i,i\ge1:$﻿ 1, 1, 2, 3, 5, 8, 13, 21, …
    - recurrence relation:
    - $f_n=f_{n-1}+f_{n-2},n\ge3,f_1=f_2=1$﻿
- e.g. $S_n=|\{\text{n-bit strings S}|\text{S does not contain pattern 111}\}|$﻿
- e.g. Tower of Hanoi
    - have n discs decreasing in diameter stacked on one of 3 pegs
    - Let $C_n=$﻿ # of moves to move all discs to another peg where a larger disc can never be placed atop a smaller disc
    - recurrence relation
    - $C_n=2C_{n-1}+1,n\gt1,c_1=1$﻿

Big Ideas

- recurrence relation
    - on a sequence $a_0,…$﻿
    - is an equation that relates $a_n$﻿ in terms of $a_0,…,a_{n-1}$﻿
    - I.e. the initial conditions for the sequence are provided values for finitely many terms of a sequence

# Lecture

![[/61_-_Week_4_notes_--_7.1.pdf|61_-_Week_4_notes_--_7.1.pdf]]

📌

**SUMMARY  
**