---
course: CS M146
area: ucla
created: 2023-04-17T14:14
updated: 2023-04-26T00:43
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

- linear classifiers - (background) reprsent the dcision boundary by hyperplane
    
    ![[/Untitled 61.png|Untitled 61.png]]
    
- L2 norm is always positive
- 0/1 Loss function is the ideal and the metric used for product. peerformance
    
    ![[/Untitled 1 47.png|Untitled 1 47.png]]
    
- $\bm x^T\bm x$﻿ is the squared L2 norm i.e. $\|\bm x\|_2^2$﻿
- “surrogate” $\approx$﻿ approximation

# Lecture

## (Binary) Classification

### Given and Goal

- given a training dataset of $n$﻿ lablled training instances
- features $X=\{\bm x^{(1)},…,\bm x^{(n)}\}$﻿ s.t. $\bm x^{(i)}\in\R^d$﻿
- and corresponding discrete labels $\bm y=\{\bm y^{(1)},…,\bm y^{(n)}\}$﻿$\bm y\{\bm y^{(1)},…,\bm y^{(n)}\}$﻿
- e.g. binary classification is given as $\bm y=\{-1,1\}$﻿
- goal: hypo func $h:\R^d\to y$﻿ s.t. $h(\bm x)=y$﻿

### Hyperplanes

- linear models represent hypo funcs as hyperplanes
    - $b+\sum_j^d \theta_jx_j=0$﻿
- we can split any hyprplane into a number of sub-spaces (binary classification is 2 half-spaces) defined by a normal vector $\bm \theta\in\R^d$﻿
    
    ![[/Untitled 2 42.png|Untitled 2 42.png]]
    
- we can add a bias to reprsnt the orthogonal function in $d+1$﻿ domain s.t. hyperplane passes through the origin

## Perceptron

- classifier with labels $+1,-1$﻿
    
    - half-spaces are given as
    
    ![[/Untitled 3 36.png|Untitled 3 36.png]]
    

### hypothesis function

![[/Untitled 4 34.png|Untitled 4 34.png]]

### weight updates - gradient update rule

|   |   |   |
|---|---|---|
|h(x)|y|error|
|-1|-1|0|
|-1|1|-2|
|1|1|0|
|1|-1|2|

![[/Untitled 5 28.png|Untitled 5 28.png]]

- error-driven learning - make an update only if we make a mistake
- so we can represent (assume $\alpha=1$﻿) as

$\bm\theta\leftarrow\bm\theta+y^{(i)}\bm x^{(i)}\quad y\in\{-1,1\}$

- i.e. rotate the hyperplane s.t. $x^{(j)}$﻿ is included in the half-space
    
    ![[/Untitled 6 27.png|Untitled 6 27.png]]
    
    ![[/Untitled 7 25.png|Untitled 7 25.png]]
    

### loss function

$J(\bm\theta)=\frac1n\sum_i^n\max\big(0,-y^{(i)}\bm\theta^T\bm x^{(i)}\big)$

![[/Untitled 8 23.png|Untitled 8 23.png]]

### perceptron algorithm (pseudo-code)

![[/Untitled 9 19.png|Untitled 9 19.png]]

![[/Untitled 10 17.png|Untitled 10 17.png]]

![[/Untitled 11 15.png|Untitled 11 15.png]]

## Convergence & Optimization

### Linear Separability

- a datast for which there existss some hyperplane that puts all positive instances on one half-space and all others on the other

![[/Untitled 12 15.png|Untitled 12 15.png]]

### Convergence thm.

- if there exists a set of perceptron parameters s.t. data is linearly separable i.e. perceptron algo will converge

### Cycling thm.

- training data is not lin. sep. then aalgo will repeat the same set of parameters i.e. infinite loop

### Improving the perceptron &. NNs

- perceptron produces many orth. vectors to th hyperplane i.e. weights during training
- standard perceptron uses the final weight vector at test time → not good if there was some during training which worked for most instances
- solution → use combinations of multiple perceptrons i.e. NNs

# Discussion

  

# Resources

---

![[/3_-_Perceptrons.pdf|3_-_Perceptrons.pdf]]

📌

**SUMMARY  
**