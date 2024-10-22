---
course: MATH 170E
area: ucla
created: 2023-02-06T20:47
updated: 2023-02-16T21:00
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Geometric Distribution - lec. 11

layout: note

---
# Definitions

---

- $\log=\ln=\log_e$﻿ in Stats

# Big Ideas

---

## Geometric Random Variable

Number of trials until FIRST success

- independent, identical Bernoulli trials with $p\in \{0,1\}$﻿ probability
- $X$﻿ is an r.v. taking values from $S=\{1,…,n\}$﻿

$X\sim\text{Geometric($p$)}$

- PMF

$p_X(x)=p\cdot(1-p)^{x-1}\quad x\in\{1,...\}$

- CDF

$F_X(x)=\mathbb P(X\le x)=1-(1-p)^x$

- MGF

$M_X(t)=\frac{pe^t}{1-(1-p)e^t}\quad t\lt -\log (1-p)$

- Mean

$\mathbb E[X]=\frac 1p$

- Variance

$\text{var($X$)}=\frac{1-p}{p^2}\\\space\\$

# Resources

---

![[/Lecture_11-2.pdf|Lecture_11-2.pdf]]

📌

**SUMMARY  
**