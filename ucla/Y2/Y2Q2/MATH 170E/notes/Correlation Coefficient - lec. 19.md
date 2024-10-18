---
course: MATH 170E
area: ucla
created: 2023-03-03T22:06
updated: 2023-03-08T15:33
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Cauchy Schwarz

$|\mathbb E[XY]|\le \sqrt{\mathbb E[X^2]\mathbb E[Y^2]}$

## Covariance

$\text{cov($X,Y$)}=\mathbb E[(X-\mathbb E[X])\cdot(Y-\mathbb E[Y])]=\mathbb E[XY]-\mathbb E[X]\mathbb E[Y]$

$=\sum_{(x,y)\in S}(x-\mu_X)(y-\mu_Y)\cdot p_{XY}(x,y)$

- visual
    
    ![[/Untitled 59.png|Untitled 59.png]]
    

### Proposition (R.V.)

If $X$﻿ is a R.V.:

$\text{cov($X,X$)}=\text{var($X$)}$

### Proposition (Independence)

$\text{cov($X,Y$)}=0$

Covariance of 0 is necessary to prove independence but not sufficient

### Transformations

$\text{cov}(aX,bY)=ab\cdot\text{cov}(X,Y)$

## Correlation Coefficient

$\rho(X,Y)=\frac{\text{cov}(X,Y)}{\sqrt{\text{var($X$)var($Y$)}}}$

$\text{var}(X)=E[X^2]-E[X]^2$

### Transformations

$\rho(aX,bY)=\frac{ab}{|ab|}\cdot\rho(X,Y)$

### Proposition (Limits)

$-1\le\rho(X,Y)\le 1\implies |\rho(X,Y)|\le 1\\\therefore\\$

# Resources

---

![[/Lecture_19_filled.pdf|Lecture_19_filled.pdf]]

📌

**SUMMARY  
**