---
course: CS M146
area: ucla
created: 2023-04-07T12:06
updated: 2023-05-01T15:32
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 01 - Linear Regression - lec. 1,2,3

layout: note

---
# Definitions

- hypothesis function
    
    $h_\theta(\vec x)\in\mathcal H$﻿
    
    A function that maps inputs to outputs using input features ($\vec x^{(i)}$﻿) and labels ($y^{(i)}$﻿) and belongs to a “hypothesis class ($\mathcal H$﻿)” (a set of similar functions) by using arbitrary weights $\vec\theta$﻿
    
    E.g. Linear regression hypothesis function:
    
    $h_\theta(\vec x)=\theta_0+\theta_1 x_1 + … + \theta_d x_d=\vec{\theta^T}\vec x$
    
- convex function
    
    - A real-valued function is convex if the line segment joining any two points lies above the function
    
    ![[/Untitled 49.png|Untitled 49.png]]
    

# Lecture

- Recall from lec. 1, an ML model takes features and labels aas inputs and returns a hypothesis function.

## Linear Regression Properties

### Hypothesis function - linear w.r.t. weights @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\theta$﻿

- Parametrized

$h_{\vec{\theta}}(\vec x)=\theta_0+\theta_1 x_1 + … + \theta_d x_d\vec x\quad\theta\in R^{d+1}$

- Vectorized ($x_0=1$﻿)

$h_{\vec{\theta}}(\vec{x})=\sum_{j=0}^d \theta_jx_j=\vec{\theta}^T\vec{x}$

- $\theta_0$﻿ is the bias parameter and $\theta_{1:d}$﻿ are the weights
- Visualized with a graph for multiple dimensions
    
    ![[/Untitled 1 37.png|Untitled 1 37.png]]
    

### Loss Function - Least Squares Loss

- Intuitively, sps. $d=1,\theta_0=0\implies x\in\R,\vec\theta=[0,\theta_1]$﻿
    
    ![[/Untitled 2 34.png|Untitled 2 34.png]]
    
      
    

$J(\vec\theta)=\frac1{2n}\sum_{i=1}^n(h_{\vec\theta}(\vec x^{(i)})-y^{(i)})^2$

## Convex Functions - Optimization

- a function is convex iff for all $t\in[0,1]$﻿ and $x_1,x_2\in X$﻿, the line through 2 point of the function lies above the function itself
    
    $f(tx_1+(1-t)x_2)\le tf(x_1)+(1-t)f(x_2)$
    
- strictly convex - the inequality is strict, no flat surface in the function
- Least squares is convex and differentiable w.r.t. $\theta$﻿ → convex functions have a unique optima (minima)

### Optimization Visual

Blue is a minima, gradient outward to red

![[/Untitled 3 28.png|Untitled 3 28.png]]

![[/Untitled 4 27.png|Untitled 4 27.png]]

![[/Untitled 5 23.png|Untitled 5 23.png]]

![[/Untitled 6 22.png|Untitled 6 22.png]]

## Loss Optimization (Gradient Decent, Normal Equation)

- Given loss function $J(\vec\theta)$﻿ we want to find $\min_{\vec\theta} J(\vec\theta)$﻿
- choose initial values of $\vec\theta$﻿ and select new until we reach a minima (chaotic - location of minima depends heavily on the values of parameters chosen)
    
    ![[/Untitled 7 21.png|Untitled 7 21.png]]
    
- convex functions have a unique minima
- normalized los function

![[/Untitled 8 19.png|Untitled 8 19.png]]

## Gradient Descent

- given an initial parameters $\vec\theta$﻿, we can recursively update theta by moving against (down) the gradient by some step size called the learning rate $\alpha$﻿:
    
    ![[/Untitled 9 16.png|Untitled 9 16.png]]
    

$\theta_j\leftarrow\theta_j-\alpha\cdot\frac{\partial}{\partial \theta_j}J(\vec\theta)\quad\text{simultaneous per $j$ }$

- PROOF: indexed partial of least squares
    
    ![[/Untitled 10 14.png|Untitled 10 14.png]]
    
- convergence - when gradient is close to 0: $||\vec\theta_{new}-\vec\theta_{old}||_2\lt \epsilon$﻿
    
    - L2 Norm $||\vec v||_2$﻿ - calculates distance (magnitude) of vector from origin
    
    $||\vec v||_2=\sqrt{\sum_i v_i^2}=\sqrt{v_1^2+v_2^2+...+v^2_{|v|}}$
    

### Scaling - SGD, GD, MBGD

- Mean squared error

$J(\vec\theta)=\frac1n\sum_{i=1}^n\ell(\vec x^{(i)},y^{(i)}, \vec\theta)$

- $\ell(\vec x^{(i)},y^{(i)}, \vec\theta)$﻿ is the **least squared error** of $h_{\vec\theta}(\vec x)$﻿ for features and labels

### Full Batch Gradient Descent (GD)

$\vec\theta\leftarrow\vec\theta-\alpha\frac1n\sum_{=1}^n\big(h_{\vec\theta}(\vec x^{(i)})-y^{(i)}\big)\vec x^{(i)}$

- computing average gradient over $n$﻿ training instances (simultaneously) is $O(n)$﻿* time (slow)
- SEE: quantum computing for finding GD for each example simultaneously
- *_is actually_ $O(n\cdot d)$﻿ but generally $n\gg d$﻿
- finding the true loss relative to the population (dataset)

### Stochastic Gradient Descent (SGD)

- computes gradient for every example, relative to the example - iterated over examples in batches → calculating per example loss

$\vec\theta\leftarrow\vec\theta-\alpha\nabla_{\vec\theta}\ell\big(\vec x^{(i)},y^{(i)},\vec\theta\big)$

$\vec\theta\leftarrow\vec\theta-\alpha\big(h_{\vec\theta}(\vec x^{(i)})-y^{(i)}\big)\vec x^{(i)}$

- GD vs SGD comparison (visual)
    
    ![[/Untitled 11 12.png|Untitled 11 12.png]]
    
- pros: memory efficient, computationally cheap, implicit regularization (see further)
- cons: high noise, does not exploit GPUs to fullest

### Mini-batch Gradient Descent (MBGD)

- sample a batch of $B$﻿ points $D_B$﻿ at random from full dataset $D$﻿ (w/o replacement)

$\vec\theta\leftarrow\vec\theta-\alpha\frac1B\sum_{(\vec x^{(i)},y^{(i)})\in D_B}\nabla_{\vec\theta}\ell(\vec x^{(i)},y^{(i)}, \vec\theta)$

- $B=1\implies \text{SGD}$﻿
- $B=n\implies \text{GD}$﻿
- comparison visual
    
    ![[/Untitled 12 12.png|Untitled 12 12.png]]
    

## Vectorization

- compact equations, faster code - see discussion

![[/Untitled 13 12.png|Untitled 13 12.png]]

![[/Untitled 14 9.png|Untitled 14 9.png]]

![[/Untitled 15 8.png|Untitled 15 8.png]]

## Normal Equation

- finding the optimal $\vec\theta$﻿ (weights/parameters) analytically s.t. $\frac\partial{\partial\vec\theta}J(\vec\theta)$﻿

![[/Untitled 16 6.png|Untitled 16 6.png]]

- Optimized Normal Equation

$\vec\theta=(X^TX)^{-1}X^T\vec y$

- if $X$﻿ is not invertible, try pseudo-inverse (np.linalg.pinv(X)), remove linearly dependent features, remove extra features s.t. $d\le n$﻿
- normalized loss function

![[/Untitled 8 19.png|Untitled 8 19.png]]

## Linear Regression Recipe

![[/Untitled 17 5.png|Untitled 17 5.png]]

Loss gradient

![[/Untitled 8 19.png|Untitled 8 19.png]]

# Discussion - Least Squares Gradient

  

# Resources

---

![[/Linear_Regression.pdf|Linear_Regression.pdf]]

![[/Discussion_1_-_Slides.pdf|Discussion_1_-_Slides.pdf]]

  

📌

**SUMMARY  
**