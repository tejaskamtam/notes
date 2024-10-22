---
course: MATH 170E
area: ucla
created: 2023-02-01T10:51
updated: 2023-02-01T11:29
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Expected Value - lec. 8

layout: note

---
# Definitions

---

# Big Ideas

---

## Expected Value

- if $X$﻿ is a discrete random variable taking values from $S\sube \N$﻿, its expected value is

$\mathbb E[X]=\sum_{x\in S} xp_X(x)=\sum_{x\in S}x\mathbb P(X=x)$

- when the expected value converges, we write

$\mu_X=\mathbb E[X]$

## Bernoulli Random Variable

- let $p\in(0,1)$﻿. A discrete random variable $X$﻿ is a Bernoulli random variable i.e. $X\sim \text{Bernoulli(p)}$﻿ if it has PMF:

$p_X(x)=\begin{cases}$

- then the expected value of $X$﻿ is

$\mathbb E[X]=\sum_{X\in S\in \{0,1\}}xp_X(x)=p$

## Uniform random variable

- let $m\ge 1$﻿ and $X\sim\text{Uniform(\{1,…,m\})}$﻿ such that $p_X(x)=\frac1m$﻿
    
    $\sum_{x=1}^mx=\frac{m(m+1)}{2}$
    
- then the expected value of $X$﻿ is

$\mathbb E[X]=\frac{m+1}2$

## Propositions

### Expectation of a Function of a r.v.

- if $X$﻿ is a discrete random variable taking values in a countable set $S\sube \R$﻿ and $g:S\to\R$﻿ is a function, then the expected value of $g(X)$﻿ is

$\mathbb E[g(X)]=\sum_{x\in S}g(x)p_X(x)$

- should the sum converge: $\mathbb E[a]=a\quad\forall a\in \R$﻿

### Linear Addition of Expectation

- if $X$﻿ is a d.r.v. from $S\sube\R$﻿ and $a,b\in\R$﻿ and $g,h:S\to\R$﻿, then

$\mathbb E[a\cdot g(X)+b\cdot h(X)]=a\cdot\mathbb E[g(X)]+b\cdot \mathbb E[h(X)]$

### Expectation Inequality

- if $g,h:S\to\R$﻿ s.t. $g(x)\le h(x)\space\forall x\in S\sube \N$﻿

$\mathbb E[g(X)]\le\mathbb E[h(X)]$

![[/Untitled 76.png|Untitled 76.png]]

  

# Resources

---

![[/Lecture_8_filled.pdf|Lecture_8_filled.pdf]]

  

📌

**SUMMARY  
**