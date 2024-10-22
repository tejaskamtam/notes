---
course: MATH 170E
area: ucla
created: 2023-02-16T21:26
updated: 2023-02-17T18:59
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Gamma Distribution - lec. 16

layout: note

---
# Definitions

---

# Big Ideas

---

## Gamma R.V.

- given Poisson $\lambda \gt 0$﻿ and if $\alpha\in \Z \ge 1$﻿ let $X$﻿ be the time of the $\alpha$﻿th arrival
- $X\sim\text{Gamma}(\alpha,\theta)$﻿ s.t. $\alpha = 1\implies X\sim \text{Exp}(\theta=\frac 1\lambda)$﻿

### PDF (@import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\alpha\in\Z\ge 1$﻿)

$f_X(x)=\frac 1{\theta^\alpha(\alpha-1)!}x^{\alpha-1}e^{-x/\theta}\quad x\gt 0$

$f_X(x)=\frac{1}{\theta^\alpha\Gamma(\alpha)}x^{\alpha-1}e^{-x/\theta}\quad x\gt 0$

### Gamma function

$\Gamma(\alpha)=\int_0^\infin x^{\alpha-1}e^{-x}\space dx\quad \alpha\gt 0$

$\Gamma(1)=1$

$\Gamma(\alpha)=(\alpha-1)\Gamma(\alpha-1)\quad \alpha\gt 1$

$\Gamma(\alpha)=(\alpha-1)!\quad \alpha\ge 1$

  

### MGF

$M_X(t)=\frac{1}{(1-\theta t)^\alpha}\quad t\lt \frac 1\theta$

### Mean and Variance

$\mathbb E[X]=\alpha\theta\\\space\\$

![[/Untitled 62.png|Untitled 62.png]]

# Resources

---

![[/Lecture_16_filled.pdf|Lecture_16_filled.pdf]]

  

📌

**SUMMARY  
**