---
course: MATH 170E
area: ucla
created: 2023-02-16T21:57
updated: 2023-02-24T02:05
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Central Limit Theorem

- sps. $X=X_1+…+X_n$﻿ s.t. $X_j\sim\text{Bernoulli}(p)$﻿ s.t. $\mathbb E[X]=np$﻿ and $\sigma^2_X=np(1-p)$﻿

$\mathbb P\left(a\le \frac{X-\mathbb E[X]}{\sigma_X}\le b\right)\to\frac{1}{\sqrt{2\pi}}\int_a^b e^{-x^2/2}\space dx\quad n\to\infin$

## Normal Distribution @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X\sim \mathcal N(\mu,\sigma^2)$﻿

- PDF

$f_X(x)=\frac{e^{-\frac{(x-\mu)^2}{2\sigma^2}}}{\sqrt{2\pi\sigma^2}}\quad x\in\R$

$1=\int_{-\infin}^\infin \frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{(t-\mu)^2}{2\sigma^2}}\space dt$

- MGF

$M_X(t)=e^{\mu t+\frac 12\sigma^2t^2}\quad t\in \R$

- Mean and Var

$\mathbb E[X]=\mu\\$

- for general normal dist.

$Z=\frac{X-\mu}{\sigma}\sim\mathcal N(0,1)$

$\mathbb P(X\le x)=\Phi\left(\frac{x-\mu}{\sigma}\right)=\mathbb P\left(Z\le \frac{x-\mu}{\sigma}\right)$

## Standard Normal when @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X\sim\mathcal N(0,1)$﻿

- PDF

$f_X(x)=\frac{1}{\sqrt{2\pi}}e^{-x^2/2}$

- Phi function

$\mathbb P(X\le x)=\Phi(x)=\int_{-\infin}^x\frac{1}{\sqrt{2\pi}}e^{-t^2/2}\space dt\quad X\sim\mathcal N(0,1)\quad x\ge 0$

$\Phi(-x)=1-\Phi(x)\quad x\gt 0$

- Standard Normal Table
    
    ![[/Untitled 69.png|Untitled 69.png]]
    

  

# Resources

---

![[/Lecture_17_filled.pdf|Lecture_17_filled.pdf]]

  

📌

**SUMMARY  
**