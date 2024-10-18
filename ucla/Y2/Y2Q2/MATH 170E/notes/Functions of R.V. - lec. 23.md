---
course: MATH 170E
area: ucla
created: 2023-03-15T20:22
updated: 2023-03-20T16:53
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

- e.g. Discrete Bernoulli
    
    ![[/Untitled 44.png|Untitled 44.png]]
    
- e.g. Cont. exponential
    
    ![[/Untitled 1 32.png|Untitled 1 32.png]]
    

# Big Ideas

---

## Functions of a random variable

### Discrete @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y=u(X)$﻿

$p_Y(y)=P(Y=y)=P(u(X)=y)=P(X\in u^{-1}(\{y\}))=\sum_{x\in u^{-1}(y)}p_X(x)\\$

  

### Continuous @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y=u(X)$﻿

$F_Y(y)=P(Y\le y)=P(u(X)\le y)=P(X\in u^{-1}\big((-\infin,y)\big)=\int_{u^{-1}\big((-\infin,y)\big)} f_X(x)\space dx$

- in general, the function $u(X)$﻿ is not well defined (we cannot say anything) until assumptions are made

### Smooth Proposition

- let $S$﻿ s.t. $f_{X\notin S}(x)=0$﻿ for a cont. r.v. $X$﻿
- let $u(X)$﻿ be smooth s.t. $u’(x)>0 \lor u’(x) <0$﻿ for all $x\in S$﻿

$f_{Y=u(X)}(y)=\bigg|\frac{d}{dy}u^{-1}(y)\bigg|\cdot f_X(u^{-1}(y))$

  

## Functions of several random variables

### Discrete

- joint PMF

$p_{X_1,...,X_n}(x_1,...,x_n)=P(X_1=x_1,...,X_n=x_n)$

- marginal PMF

$p_{X_j}(x_j)=P(X_j=x_j)=\sum_{x_1\in S_1}\cdots\sum_{x_n\in S_n} p_{X_1,...,X_n}(x_1,...,x_n)$

- independent

$p_{X_1,...,X_n}(x_1,...,x_n)=p_{X_1}(x_1)\cdots p_{X_n}(x_n)\quad \forall x_1,...,x_n$

- independent and identically distributed (i.i.d.) - if each marginal PMF is equivalent
- Expected value

$E[u(X_1,...,X_n)]=\sum_{(x_1,...,x_n)\in S} u(x_1,...,x_n)p_{X_1,...,X_n}(x_1,...,x_n)$

$E[g(X_j)]=\sum_{x_j\in S_j}g(x_j)p_{X_j}(x_j)$

### Continuous

- joint PDF

$P((X_1,...,X_n)\in A)=\int_A f_{X_1,...,X_n}(x_1,...,x_n)\space dx_1...dx_n$

- marginal PMF (int over not j)

$f_{X_j}(x_j)=\int_{\R^{n-1}}f_{X_1,...,X_n}(x_1,...,x_n)\space dx_1...dx_{j-1}dx_{j+1}...dx_n$

- independence

$f_{X_1,...,X_n}(x_1,...,x_n)=f_{X_1}(x_1)\cdots f_{X_n}(x_n)$

- independent and identically distributed (i.i.d.) - if each marginal PMF is equivalent
- Expected value

$E[u(X_1,...,X_n)]=\int_{\R^n} u(x_1,...,x_n)f_{X_1,...,X_n}(x_1,...,x_n)\space dx_1\cdots dx_n$

$E[g(X_j)]=\int_{\R}g(x_j)f_{X_j}(x_j)\space dx_j$

### Linear combinations & Transformations

$Y=a_1X_1+...+a_nX_n\\\implies\\$

![[/Untitled 2 29.png|Untitled 2 29.png]]

# Resources

---

![[/Lecture_23_filled.pdf|Lecture_23_filled.pdf]]

📌

**SUMMARY  
**