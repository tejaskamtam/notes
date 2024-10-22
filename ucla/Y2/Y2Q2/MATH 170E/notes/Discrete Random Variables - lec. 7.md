---
course: MATH 170E
area: ucla
created: 2023-02-01T10:23
updated: 2023-02-16T20:38
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Discrete Random Variables - lec. 7

layout: note

---
# Definitions

---

# Big Ideas

---

## Random Variable (r.v.)

- random variables are a function given a set $S$﻿ and prob. space $(\Omega, \mathcal F, \mathbb P)$﻿:

$X:\Omega\to S$

- if $x\in S$﻿ and $A\sube S$﻿

$\mathbb P(X=x):=\mathbb P(\{\omega\in\Omega:X(\omega)=x\})\\$

- the function’s diagram can be depicted as
    
    ![[/Untitled 63.png|Untitled 63.png]]
    

## Discrete Random Variables

- a random variable is discrete if the range (output) is finite or countable i.e. one-to-one

$X:\Omega\to S\sube\N$

### Probability Mass Function (PMF) ( or Discrete Density)

- PMF of r.v.s. function $X$﻿:

$p_X:S\to[0,1]\\$

### Cumulative Distribution Function (CDF)

- oof $X$﻿

$F_X:\R\to [0,1]$

- two r.v.s are identically distributed if they have the same CDF

$X \sim Y$

### Visual for PMF vs CDF

![[/Untitled 1 48.png|Untitled 1 48.png]]

## Propositions

$\mathbb P(X\in A\sube \N)=\sum_{x\in A\cap S}p_X(x)\implies A\cap S\sube S$

$F_X(x)=\sum_{y\in S,\space y\le x}p_X(y)\implies y\in A\cap S$

$\mathbb P(a\lt X\le b)=F_X(b)-F_X(a)$

## Uniform Random Variables

- r.v.s. $X$﻿ is uniformly distributed on $\{1,…,m\}$﻿ s.t.

$X\sim \text{Uniform}(\{1,...,m\})$

- i.e. if it has PMF

$p_X(x)=\frac 1 m\quad x\in\{1,...,m\}$

- this uniform random variable has CDF

$F_X(x)=$

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

![[/Lecture_7.pdf|Lecture_7.pdf]]

[https://youtu.be/YXLVjCKVP7U](https://youtu.be/YXLVjCKVP7U)

📌

**SUMMARY  
**