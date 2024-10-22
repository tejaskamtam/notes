---
course: MATH 170E
area: ucla
created: 2023-03-19T01:21
updated: 2023-03-20T16:32
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Law of Large Numbers (weak) - lec. 24

layout: note

---
# Definitions

---

- e.g. Chebyshev Approximation
    
    ![[/Untitled 54.png|Untitled 54.png]]
    

# Big Ideas

---

## Background

### Proposition 5.10

- $X_1,…,X_n$﻿ are r.v. (disc. or cont.) and $a_1,…\in \R$﻿

$Y=a_1X_1+...+a_nX_n\\\implies\\$

- then, if the r.v.s $X_j$﻿ are independent

$\text{var}(Y)=\sum_j a_j^2\text{var}(X_j)$

### Sample Sum and Average

- let r.v.s $X_1,…$﻿ be i.i.d (independent and identically distributed - same PDF)
- sample sum

$S_n=\sum_j X_j$

- Sample Average

$\overline X_n = \frac 1n\sum_j X_j=\frac1n S_n$

- mean and vars

$E[S_n] = n\mu\quad E[\overline X_n]=\mu\\$

## (Weak) Law of Large Numbers

The sample average of an i.i.d sequence of r.v.s converges to its $\mathbb E$﻿ as trials approach $\infin$﻿

### Convergence of real numbers

A sequence $(x_n)_{n=1}^\infin$﻿ converges to $x$﻿ is written as

$x_n\to x\quad \text{as} \quad n\to \infin$

- if for some $\varepsilon>0$﻿ the series for some $n\ge N$﻿ follows $x-\varepsilon < x_n < x+\varepsilon$﻿
    
    ![[/Untitled 1 41.png|Untitled 1 41.png]]
    

### Convergence of R.V.s

- For ssome sequence of r.v.s:

$X_n\to X\quad\text{in probability: as}\quad n\to \infin\\$

- THis suggts the prob. of a rar event gets small as num trials inc.

### The Weak Law of Large Numbers

Let $X_1,…,X_n$﻿ be an i.k.d. seq. of r.v.s. w/ finite mean $\mu$﻿

$\overline X_n=\frac1n\sum_j^n X_j\to\mu\quad \text{in prob. as}\quad n\to\infin\\\implies\\ P(|\overline X_n-\mu|\ge \varepsilon)\to 0\quad\text{as}\quad b\to\infin$

### Markov’s Inequality

Let $X>0$﻿ be an r.v. Given $\lambda>0$﻿ and $k\ge 1$﻿

$P(X\ge \lambda)\le E[X]/\lambda$

- Generalized

$P(X\ge \lambda)\le \frac{E[X^k]}{\lambda^k}$

### Chebyshev’s Inequality

Let $X>0$﻿ be an r.v. with $\mu,\sigma^2$﻿ then for $\lambda>0$﻿

$P(|X-\mu|\ge \lambda)\le \frac{\sigma^2}{\lambda^2}$

# Resources

---

![[/Lecture_24_filled.pdf|Lecture_24_filled.pdf]]

![[/Lecture_25_filled.pdf|Lecture_25_filled.pdf]]

📌

**SUMMARY  
**