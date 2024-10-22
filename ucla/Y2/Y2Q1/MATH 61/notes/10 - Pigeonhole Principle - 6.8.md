---
course: MATH 61
area: ucla
created: 2022-10-14T11:14
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 10 - Pigeonhole Principle - 6.8

layout: note

---
# Recall

# Notes

Supplemental Definitions

Examples

- e.g. pigeon holes
    - there are 7 pigeons in 4 holes
    - thus, there must be at least 2 pigeons in the same hole
- e.g. name classes
    - 10 students with first names: Alice, Ben, Charles and last names: Leo, Mcduff, Ng
    - show ≥ 2 people have same first and last names
    - there are 3*3=9 total names, and 9 names < 10 people so by the (p.p.) ≥ 2 people have the same name
- e.g. math courses
    - show that 151 math courses numbered between 1-300 (inclusive) must have ≥ 2 numbered consecutively
    - let $a_i$﻿ be position of the i-th course
    - $X=\{a_1,…,a_{151}\}\sube [1,300]$﻿
    - $Y=\{a_1+1,…,a_{151}+1\}\sube [2,301]$﻿
    - $|X|+|Y|=302 > 301\therefore$﻿ by p.p. there must be at least 2 consecutively ordered math courses
- e.g. sitcom DVDs
    - the library has a list of 89 sitcom DVDs either marked A or U when there are exactly 50 A items
    - show ≥ 2 A items on the list exactly 9 apart
    - let $a_i$﻿ be the position of the i-th item
    - $X=\{a_1,…,a_{50}\}\sube[1,89]$﻿
    - $Y=\{a_1+9,…,a_{50}\}\sube[10,98]$﻿
    - $|X|+|Y|=100 > 98 \therefore$﻿ by the p.p., there must be at least 2 A items exactly 9 positions apart

Big Ideas

- pigeonhole principle (p.p.)
    - if n “pigeons” in k “pigeonholes” where k<n
    - some pigeonhole contains at least 2 pigeons
- corollary to p.p. 1
    - if $f:X\to Y$﻿ where X,Y are finite and $|X|>|Y|$﻿
    - $f(x_1)=f(x_2), x_1,x_2\in X, x_1\neq x_2$﻿
    - i.e. f is not injective (thus not bijective)
- corollary to p.p. 2
    - let $f:X\to Y$﻿ for X,Y are finite sets, sps. $|X|=n,|Y|=m$﻿
    - let $k=\lceil n/m \rceil$﻿
    - then there are at least k distinct values for $a_1,…,a_k\in X$﻿ s.t. $f(a_1)=…=f(a_k)$﻿

# Lecture

![[/61_-_Week_3_notes_--_6.2_6.3_6.7_6.8 2.pdf|61_-_Week_3_notes_--_6.2_6.3_6.7_6.8 2.pdf]]

📌

**SUMMARY  
**