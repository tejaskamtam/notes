---
course: MATH 170E
area: ucla
created: 2023-01-13T11:58
updated: 2023-02-01T11:18
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: 03 - Independent Events - lec. 3

layout: note

---
# Definitions

---

- e.g. Haggis and Black Pudding
    - given
        - 40% of Scots dislike haggis
        - 49% of Scots like black pudding
        - 80% of Scots like both
    - let $\Omega=\{\text{Scottish population in the survey}\}$﻿
    - $\mathscr F=\text{all subsets of } \Omega \quad A,B\in\mathscr F$﻿
    - s.t. $A,B=\{\text{Scots who like h, bp}\}$﻿$A,B=\{\text{Scots who like haggis,bp}\}$﻿
    - $\implies\mathbb P(A\cup B)=0.61$﻿
- disjoint events
    - $\mathbb P(A\cap B = \emptyset)=0$﻿

# Big Ideas

---

## Inclusion Exclusion Principle

$\mathbb P(A\cup B)=\mathbb P(A)+\mathbb P(B)-\mathbb P(A\cap B)$

- this principle removes the double representation of $A\cup B$﻿
- for finite countable number of sets:

$\mathbb P(\cup_{j=1}^n \space A_j)=\sum_{k=1}^n(-1)^{k-1}\sum_{I\sube \{1,...,n\}\space:\space|I|=k}\mathbb P(\bigcap_{j\in I} \space A_j)$

## Independence

- 2 events $A,B\sube\Omega$﻿ are independent $\iff$﻿

$\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)$

- otherwise, the events are dependent
- independence is not sufficient to prove events are disjoint
- implied properties of independence $\iff$﻿

$\mathbb P(A\cap B')=\mathbb P(A)\cdot\mathbb P(B')\\\mathbb P(A'\cap B')=\mathbb P(A')\cdot\mathbb P(B')$

- given mutually independent events $A_1,…,A_n\sube\Omega$﻿

$\mathbb P(\cap_{l=1}^k\space A_{j_l})=\prod_{l=1}^k\mathbb P(A_{j_l})$

# Resources

---

![[/Lecture_3_2.pdf|Lecture_3_2.pdf]]

  

📌

**SUMMARY  
**