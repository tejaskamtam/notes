---
course: MATH 170E
area: ucla
created: 2023-01-30T11:58
updated: 2023-02-03T20:01
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$r^{th}$﻿ moment of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X$﻿ about @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$b$﻿

- if $X$﻿ is a d.r.v. from countable set $S\sube \R$﻿ and $b\in \R$﻿, then for $r\in \N$﻿

$\mathbb E[(X-b)^r]$

- if $b=0$﻿ then the $r^{th}$﻿ moment of $X$﻿ is $\mathbb E[X^r]$﻿

## Variance

- lt $X$﻿ be a d.r.v., the variance of $X$﻿ is

$\text{var}(X)=\mathbb E[(X-\mathbb E[X])^2]$

- when the variance converges

$\sigma^2_X=\text{var}(X)$

- such that the standard deviation of $X$﻿ is

$\sigma_X=\sqrt{\text{var}(X)}$

## Properties

### Transformations

- if $X$﻿ is a d.r.v and $a,b\in \R$﻿ then

$\mathbb E[a\cdot X+b]=a\cdot\mathbb E[X]+b\\\space\\$

### Variance as a sum

- if $X$﻿ is d.r.v

$\text{var}(X)=\mathbb E[X^2]-\mathbb E[X]^2$

### Uniform r.v.

- let $m\ge 1$﻿ and $X\sim\text{Uniform(\{1,…,m\})}$﻿

$\text{var}(X)=\frac{m^2-1}{12}$

  

### Bernoulli r.v.

$\text{var}(X)=p(1-p)$

## Moment Generating Function (MGF)

- if $X$﻿ is a d.r.v then MGF of $X$﻿ is

$M_X(t)=\mathbb E[e^{tX}]\quad t\in \R$

### Bernoulli r.v.

$M_X(t)=1-p+e^tp\quad\forall t\in\R$

  

- sps. MGF is defined and smooth for $t\in(-\delta,\delta)$﻿ for $\delta>0$﻿

$\frac{d^r}{dt^r}M_X(t)\Bigr|_{t=0}=\mathbb E[X^r]\quad \text{s.t.}\quad r\in\N$

$\frac d{dt}\log M_X\Bigr|_{t=0}=\mathbb E[X]\\\space\\$

# Resources

---

![[/Lecture_9_filled.pdf|Lecture_9_filled.pdf]]

📌

**SUMMARY  
**