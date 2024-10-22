---
course: MATH 170E
area: ucla
created: 2023-01-23T10:16
updated: 2023-02-01T11:18
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: 05 - Conditional Probability - lec. 5

layout: note

---
# Definitions

---

- set coverage
    
    $A\sube\bigcup_{j=1}^kB_j$
    
    ![[/Untitled 43.png|Untitled 43.png]]
    

# Big Ideas

---

## Conditional Probability

- the probability of a an event given the occurrence of another event (dependence)
- $B\sube\Omega\quad |\quad|\mathbb P(B)\neq0$﻿, then the prob. of an event $A\sube\Omega$﻿ given $B$﻿ is

$\mathbb P(A|B)=\frac{\mathbb P(A\cap B)}{\mathbb P(B)}$

### Properties

- $B\sube\Omega\quad |\quad|\mathbb P(B)\neq0\implies \mathbb P(\cdot|B)$﻿ is the probability measure
- $\mathbb P(\cdot | B):\mathcal F\mapsto[0,1]$﻿$\mathbb P(\cdot | B):\mathcal F\longmapsto[0,1]$﻿

1. Identity
    
    $\mathbb P(\Omega|B)=1$
    
2. Countable Additivity
    
    1. $\{A_j\}^k_{j=1}$﻿ are mutually exclusive (disjoint)
    
    $\mathbb P\left(\bigcup_{j=1}^kA_j|B\right)=\sum_{j=1}^k\mathbb P(A_j|B)$
    
3. Complement
    
    $\mathbb P(A'|B)=1-\mathbb P(A|B)$
    

### Independence

- if $A,B$﻿ are independent and $\mathbb P(B)\neq 0$﻿

$\mathbb P(A|B)=\mathbb P(A)$

## Law of Total Probability

- Let $A\sube \Omega$﻿ be an event and $\{B_j\}^k_{j=1}\sube\Omega$﻿ be mutually exclusive s.t. $\mathbb P(B_j)\neq0$﻿ for $j\in\{1,…,k\}$﻿ and $\{B_j\}$﻿ **covers** $A$﻿
- then

$\mathbb P(A)=\sum_{j=1}^k\mathbb P(A|B_j)\cdot\mathbb P(B_j)$

# Resources

---

![[/Lecture_5_filled.pdf|Lecture_5_filled.pdf]]

📌

**SUMMARY  
**