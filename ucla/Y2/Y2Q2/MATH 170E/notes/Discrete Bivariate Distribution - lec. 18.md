---
course: MATH 170E
area: ucla
created: 2023-02-23T17:54
updated: 2023-03-08T15:25
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
parent: MATH 170E

title: Discrete Bivariate Distribution - lec. 18

layout: note

---
# Definitions

---

# Big Ideas

---

- let $X,Y$﻿ be d.r.v. taking from $S_X,S_Y\sub \R$﻿ and $S=S_X\times S_Y=\{(x,y)\in\R^2:x\in S_X,y\in S_y\}$﻿
- e.g. 2 rand. nums from a set
    
    ![[/Untitled 37.png|Untitled 37.png]]
    

### Joint PMF:

$p_{X,Y}:S\to[0,1]\\$

- Proposition
    
    ![[/Untitled 1 26.png|Untitled 1 26.png]]
    

$\mathbb P((X,Y)\in A)=\sum_{(x,y)\in A\cap S}p_{X,Y}(x,y)$

- Normalization Condition

$1=\sum_{(x,y)\in S\sube \R^2}p_{X,Y}(x,y)$

### Marginal PMF of X,Y

$p_X,p_Y:S_X,S_Y\to[0,1] \quad\text{(respectively)}$

$p_X(x)=P(X=x)=\sum_{y\in S_y}p_{X,Y}(x,y_j)\\\space\\$

- Proposition

$\sum_{x\in S_X}p_X(x)=1\\\space\\$

### Independence

- r.vs $X,Y$﻿ are independent $\iff \{X=x\},\space \{Y=y\}$﻿ are independent $\forall (x,y)\in S$﻿

$p_{X,Y}(x,y)=p_X(x)p_Y(y)\quad \forall(x,y)\in S$

### Means

$\mathbb E[XY]=\sum_{(x,y)\in S}xy\cdot p_{XY}(x,y)$

$\mathbb E[X]=\sum_{x\in S_X}x\cdot p_X(x)\quad\quad \mathbb E[Y]=\sum_{y\in S_Y}y\cdot p_Y(y)$

General Solution:

$g:S\to\R\\$

- Transformations: $a,b\in\R\quad g,h:S\to\R$﻿

$\mathbb E[a\cdot g(X,Y)+b\cdot h(X,Y)]=a\mathbb E[g(X,Y)]+b\mathbb E[h(X,Y)]$

- Comparison: $g\le h\quad \forall(x,y)\in S$﻿

$\mathbb E[g(X,Y)]\le\mathbb E[h(X,Y)]$

- Proposition: $g,h:S_X,S_Y\to \R$﻿

$\mathbb E[g(X)h(Y)]=\mathbb E[g(X)]\mathbb E[h(Y)]$

### Cauchy-Schwarz Inequality

$|\mathbb E[XY]|\le\sqrt{\mathbb E[X^2]\mathbb E[Y^2]}$

$\left|\mathbb E[(X-\mathbb E[X])(Y-\mathbb E[Y])]\right| \le \sqrt{\mathbb E[(X-\mathbb E[X])^2]\mathbb E[(Y-\mathbb E[Y])^2]}\le \sqrt{\text{var($X$)var($Y$)}}$

# Resources

---

![[/Lecture_18_filled.pdf|Lecture_18_filled.pdf]]

📌

**SUMMARY  
**