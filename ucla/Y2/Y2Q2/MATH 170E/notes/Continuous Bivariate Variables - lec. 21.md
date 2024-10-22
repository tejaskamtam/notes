---
course: MATH 170E
area: ucla
created: 2023-03-14T14:00
updated: 2023-03-16T19:56
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Continuous Bivariate Variables - lec. 21

layout: note

---
# Definitions

---

- e.g. double integral for bounded area
    
    ![[/Untitled 50.png|Untitled 50.png]]
    
- e.g. E[XY]
    
    $E[XY]=\iint_\R xy\cdot f_{X,Y}(x,y)\space dxdy$
    

# Big Ideas

---

## Double Integrals Review

### Volume

![[/Untitled 1 38.png|Untitled 1 38.png]]

### Areas between functions (vert. & horiz.)

![[/Untitled 2 35.png|Untitled 2 35.png]]

![[/Untitled 3 29.png|Untitled 3 29.png]]

## Continuous Bivariate Distributions

### Joint PDF

$P((X,Y)\in A)=\iint_A f_{X,Y}(x,y)\space dxdy$

- Normalization

$\iint_R f_{X,Y}(x,y)\space dxdy=1$

### Marginal PDFs

$f_X(x)=\int_\R f_{X,Y}(x,y)\space dy\\\space\\$

$P(a\lt X\le b)=\int_a^b f_X(x)\space dx$

  

### Expected Value

$E[g(X,Y)]=\iint_\R g(x,y)f_{X,Y}(x,y)\space dxdy$

- transformations

$E[ag(X,Y)+bh(X,Y)]=aE[g(X,Y)]+bE[h(X,Y)]$

### Independence

$\iff f_{X,Y}(x,y)=f_X(x)f_Y(y)\quad \forall(x,y)\in \R^2$

- then

$E[g(X)h(Y)]=E[g(X)]\cdot E[h(X)]$

### Covariance and Correlation

$\text{cov}(X,Y)=\bigg[(X-E[X])(Y-E[Y])\bigg]=E[XY]-E[X]E[Y]$

$\rho(X,Y)=\frac{\text{cov}(X,Y)}{\sqrt{\text{var($X$)var($Y$)}}}$

- Cauchy-Schwarz

$-1\le\rho\le 1$

# Resources

---

![[/Lecture_22_filled 2.pdf|Lecture_22_filled 2.pdf]]

![[/Lecture_21_filled_(1).pdf|Lecture_21_filled_(1).pdf]]

📌

**SUMMARY  
**