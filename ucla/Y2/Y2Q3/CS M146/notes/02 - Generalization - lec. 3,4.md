---
course: CS M146
area: ucla
created: 2023-04-10T14:02
updated: 2023-07-10T21:20
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 02 - Generalization - lec. 3,4

layout: note

---
# Supplemental

- dimensionality - line or hyperplane, dependent on dimensionality of features
- linear or extended linear - dependent on feature transformations (polynomial, root, etc.)

# Lecture

- the term linear is generally. reserved for function linear w.r.t. the weights, so we can input non linear transformations of the inputs/features into linear regression

## Linear Basis

### Linear Basis Function Models

$h_{\vec\theta}(\vec x)=\vec\theta^T\phi(\vec x)=\sum_{j=0}^k\theta_j\phi_j(\vec x)$

- $\phi(\vec x):\R^d\to\R^k$﻿ is a k-dimensional basis w/ params $\vec\theta\in\R^k$﻿
- $\phi_0(\vec x)=1$﻿ usually so first param is till bias
- $k$﻿ can b different from feature dimension $d+1$﻿, e.g. polynomial reg: $d=1,k=4$﻿
    
    ![[/Untitled 45.png|Untitled 45.png]]
    

## Linear Regression: lin. feature transforms

![[/Untitled 1 33.png|Untitled 1 33.png]]

## Extended Linear Regression: non-lin. feature transforms

![[/Untitled 2 30.png|Untitled 2 30.png]]

## Generalization

- more complex is not always better - overfitting (on training data)
    
    ![[/Untitled 3 24.png|Untitled 3 24.png]]
    

### generalization - ability of ML model to make good predictions on unseen (test) data

- the LSE loss we looked at so far is ON TRAINING DATA - empirical risk minimization (ERM)
- does ERM generalize on unseen $x$﻿
- theoretically
    - depends on hypothesis class, data size, learning algo → learning theory
- empirically
    - can assess via validation data
- algorithmically
    - can strengthen via regularization
- underfitting - hypothesis is not very expressive/complex for data
- overfitting - hypo is too complex for data
- hypothesis complexity - hard to define, polynomial degree for regression
    - an $n$﻿-degree polynomial can reach 0 loss on size $n$﻿ dataset easily

### Option 1: Cross Validation (validation split)

- train, validation, test - split
    
    ![[/Untitled 4 23.png|Untitled 4 23.png]]
    
- if test is similar to validation (similar distribution) - generalization is achieved

### @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$k$﻿-fold Cross Validation

- partition dataset of $n$﻿ instances into $k$﻿ disjoint folds (subsets)
- choose fold $i\in[1,k]$﻿ as the validation
- train on $k-1$﻿ remaining folds and cross validate and eval accuracy on $i$﻿
- compute average over $k$﻿ folds or chose best model on a certain $k$﻿ fold
- “leave-one-out”: $k=n$﻿
- visual
    
    ![[/Untitled 5 20.png|Untitled 5 20.png]]
    
    ![[/Untitled 6 20.png|Untitled 6 20.png]]
    
    ![[/Untitled 7 19.png|Untitled 7 19.png]]
    

### Option 2: Regularization

- eliminating features, getting more data - regularize dataset
- loss regularization - method to prevent overfitting by controlling complexity of the learned hypothesis
- penalize large weights (absolute) during optimization → loss

### Ridge Regression: @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\ell_2$﻿-regularized

![[/Untitled 8 17.png|Untitled 8 17.png]]

- $\lambda\ge 0$﻿ is the regularization hyperparameter → appends squared L2 norm of weights onto loss → when minimizing, we know try to minimize regularization too

$\sum^d_{j=1}\theta_j^2=\|\bm\theta_{1:d}\|_2^2=\|\bm\theta_{1:d}-\vec0\|_2^2$

- pulls weights towards the origin (minimizes)

![[/Untitled 9 14.png|Untitled 9 14.png]]

- vectorized

![[/Untitled 10 12.png|Untitled 10 12.png]]

## Hyperparameters

- additional unknowns (other than weights) for improving learning - $\lambda$﻿, $\alpha$﻿
- model hyperparameters - influence representation
    
    - hypothesis class $\mathcal H$﻿
    - basis function $\phi$﻿
    
    ![[/Untitled 11 10.png|Untitled 11 10.png]]
    
- algorithmic hyperparameters - influence traning
    
    - learning rate $\alpha$﻿
    - regularization coefficient $\lambda$﻿
    - batch size $B$﻿
    
    ![[/Untitled 12 10.png|Untitled 12 10.png]]
    
- **model selection**: best hyperparams are ones that help generalize → eval based on valudation loss

# Discussion

## Linear Basis Function Models

$\phi(\bm x):\R^d\to\R^k\quad \bm \theta\in\R^k$

$h_{\bm\theta}(\bm x)=\bm\theta^T\phi(\bm x)=\sum_j^k\theta_j\phi_j(\bm x)$

- examples: polynomial and gaussian
    
    ![[/Untitled 13 10.png|Untitled 13 10.png]]
    

## Regularized Linear (Ridge) Regression

![[/Untitled 14 7.png|Untitled 14 7.png]]

- Closed form
    
    ![[/Untitled 15 6.png|Untitled 15 6.png]]
    

  

# Resources

---

![[/Generalization.pdf|Generalization.pdf]]

![[/Discussion_2_-_Slides.pdf|Discussion_2_-_Slides.pdf]]

📌

**SUMMARY  
**