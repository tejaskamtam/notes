---
course: MATH 170E
area: ucla
created: 2023-02-16T16:50
updated: 2023-02-16T23:48
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Continuous R.V.

- cont. r.v. define probabilities over an interval such that:

$\mathbb P(X=x) = 0\\$

### PDF from CDF (@import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X,F_X:\R\to[0,1]$﻿)

$F_X:=\mathbb P(X\le x)\\$

- We say X is a cont. r.v. if $\exists f_X:\R\to[0,\infin)$﻿ called the prob. density. func.

$\mathbb P(X\le x)=F_X(x)=\int_{-\infin}^xf_X(t)\space dt\\$

### Probability in Interval

$\mathbb P(X\in(a,b])=\mathbb P(a\lt X\le b)=\int_a^bf_X(x)\space dx$

### Expected Value

$\mathbb E[X]=\int_{-\infin}^\infin xf_X(x)\space dx$

$\mathbb E[g(X)]=\int_{-\infin}^\infin g(x)f_X(x)\space dx$

### MGF

$M_X(t)=\mathbb E[e^{tX}]=\int_{-\infin}^\infin e^{tx}f_X(x)\space dx$

## Uniform R.V.

- if there’s an eq. prob. of picking any point in an interval $[a,b]$﻿ then $X\sim\text{Uniform}([a,b])$﻿

### PDF

$f_X(x)=\begin{cases}$

### CDF

$F_X(x)=\begin{cases}$

### Mean & Var

$\mathbb E[X]=\frac 12(a+b)\\\space\\$

## Exponential Distribution

- given an approx. Poisson $\lambda \gt 0$﻿ then $X\sim\text{Exponential}(\theta=\frac 1\lambda)$﻿ where theta is the mean waiting time

### PDF

$f_X(x)=\frac 1\theta e^{- x/\theta}\quad x\gt 0$

### CDF

$F_X(x)=\begin{cases}$

### MGF

$M_X(t)=\frac{1}{1-\theta t}\quad t\lt \frac 1\theta$

### Mean/Var

$\mathbb E[X]=\theta\\\space\\$

  

# Resources

---

![[/Lecture_14_filled.pdf|Lecture_14_filled.pdf]]

📌

**SUMMARY  
**