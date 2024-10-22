---
course: MATH 170E
area: ucla
created: 2023-02-08T17:42
updated: 2023-02-16T16:50
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Poisson Distribution - lec. 13

layout: note

---
# Definitions

---

# Big Ideas

---

## Poisson R.V.

- there are $\lambda\gt0$﻿ occurrences
- let $X$﻿ be the number of occurrences in some time span and takes values from $S=\{1,2,…\}$﻿ (assuming population is infinite)
- Assuming time intervals are disjoint: $(t_1,t_2],(t_2,t_3],…,(t_n,t_{n+1}]\implies$﻿then occurrences on each time interval are **independent**
- If $h=t_2-t_1\gt 0$﻿ is sufficiently small $\implies \mathbb P(X=1\text{ in } (t_1t_2])=\lambda h$﻿ and converges rapidly to zero as $h\to 0$﻿ i.e. an approximate Poisson r.v.

$X\sim\text{Poisson($\lambda$})$

- PMF

$p_X(x)=\frac{e^{-\lambda}\lambda^x}{x!}$

- CDF

$F_X(x)=e^{-\lambda}\sum_{k=0}^x\frac{\lambda^k}{k!}$

- Mean and Variance

$\mathbb E[X]=\lambda\\$

# Resources

---

![[/Lecture_13_filled.pdf|Lecture_13_filled.pdf]]

  

📌

**SUMMARY  
**