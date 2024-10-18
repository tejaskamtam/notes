---
course: MATH 170E
area: ucla
created: 2023-02-01T11:58
updated: 2023-02-16T21:00
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Binomial Distribution

Number of success in fixed number of trials

- A Binomial distribution is the distribution of $n\ge 1$﻿ independent, identical Bernoulli trials that we write $X\sim\text{Binomial(n,p)}$﻿ where $n$﻿ is the number of trials and $p$﻿ is the probability of each success (prob. of success of 1 trial)
- then the **PMF** is

$p_X(x)=\binom nxp^x(1-p)^{n-x}\quad x\in\{0,1,...,n\}$

- CDF

$F_X(x)=\mathbb P(X\le x)=\begin{cases}$

- then the **MGF** is

$M_X(t)=\mathbb E[e^{tX}]=(1-p+pe^t)^n\quad\forall t\in\R$

- then the **expected value** (mean) is

$\mathbb E[X]=np$

- then the **variance** is

$\text{var}(X)=np(1-p)$

# Resources

---

![[/Lecture_10_filled.pdf|Lecture_10_filled.pdf]]

📌

**SUMMARY  
**