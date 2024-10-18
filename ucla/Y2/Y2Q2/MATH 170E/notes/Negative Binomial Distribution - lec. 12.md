---
course: MATH 170E
area: ucla
created: 2023-02-08T17:35
updated: 2023-02-16T21:00
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Negative Binomial R.V.

Probability of $n^{th}$﻿ success on $r^{th}$﻿ trial

- independent, identical Bernoulli trials with probability $p\in\{0,1\}$﻿ of success
- let $r\ge 1$﻿ and let $X$﻿ be the d.r.v. the first trial on which we first achieve the $r^{th}$﻿ success takes values from $S=\{r,r+1,r+2,…\}$﻿

$X\sim \text{Negative Binomial($r,p$)}\\$

- PMF

$p_X(x)=\binom{x-1}{r-1}p^r(1-p)^{x-r}\quad x\in S$

- CDF

$F_X(x)=\begin{cases}$

- Lemma for finding sum

$\left(\frac{1}{1-s}\right)^r=\sum_{x=r}^\infin\binom{x-1}{r-1}s^{x-r}$

- MGF

$M_X(t)=\left(\frac{pe^t}{1-(1-p)e^t}\right)^r\quad t\lt -\log(1-p)$

- mean and variance

$\mathbb E[X]=\frac rp\\\space\\$

# Resources

---

![[/Lecture_12_filled.pdf|Lecture_12_filled.pdf]]

📌

**SUMMARY  
**