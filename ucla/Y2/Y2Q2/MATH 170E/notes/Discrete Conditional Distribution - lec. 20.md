---
course: MATH 170E
area: ucla
created: 2023-03-07T11:31
updated: 2023-03-15T20:05
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Discrete Conditional Distribution - lec. 20

layout: note

---
# Examples

---

- e.g. conditional expectation
    
    ![[/Untitled 13.png|Untitled 13.png]]
    
- e.g. iterated expectation
    
    ![[/Untitled 1 5.png|Untitled 1 5.png]]
    

# Big Ideas

---

## Conditional Random Bivariate Variables

$\text{d.r.v.}:X|y\implies X|Y=y$

$p_{X|Y}(x|y)=\mathbb P(X=x|Y=y)=\frac{p_{XY}(x,y)}{p_Y(y)}$

### Proposition (Identity/Normalization)

$\sum_{x\in S_X}p_{X|Y}(x|y)=1\iff \mathbb P_Y(y)\neq 0$

### Conditional Expectation

$\mathbb E[X|Y](\omega)=g(Y(\omega))\quad\quad\mathbb E[Y|X]=g(X)$

s.t.

$g(x)=\mathbb E[Y|x]\quad\quad g(y)=\mathbb E[X|y]$

### Mean

$\mathbb E[Y|x] =g(x)=\sum_{y\in S_Y}y\cdot p_{Y|X}(y|x=a)\quad a\in \Z$

$\text{var}(Y|X)=\mathbb E\big[(Y-\mathbb E[Y|X])^2\big|X\big]$

### Conditional Variance

$h(x) = \text{var}(Y|x)\implies h(X) =\text{var}(Y|X)$

### Law of Iterated Expectation and Variance

$\mathbb E\big[\mathbb E[Y|X]\big]=\mathbb E[Y]=\mathbb E[Y]=\sum_{x\in S_X}\mathbb E[Y|x]\cdot p_X(x)\\=\sum_{x\in S_X}\bigg(\sum_{y\in S_Y}y\cdot p_{Y|X}(y|x)\bigg)\cdot p_X(x)$

$\text{var}(Y)=\mathbb E\big[\text{var}(Y|X)\big]+\text{var}\big(\mathbb E[Y|X]\big)$

## IMPORTANT Properties of D.R.V.

### Conditional Probability

$P(A|B)=\frac{P(A\cap B)}{P(B)}$

### Conditional Expectation

$E[X|Y]=g(Y)=\sum_xx\cdot p_{X|Y}(x|y)=\sum_x x\cdot\frac{p_{X,Y}(x,y)}{p_Y(y)}$

### Conditional Variance

$\text{var}(Y|X)=E\bigg[\big(Y-E[Y|X]\big)^2|X\bigg]=E[Y^2|X]-E[Y|X]^2$

### Iterated Expectation

$E\big[E[Y|X]\big]=E[Y]=\sum_x\mathbb E[Y|x]\cdot p_X(x)$

  

# Resources

---

![[/Lecture_20_(2).pdf|Lecture_20_(2).pdf]]

📌

**SUMMARY  
**