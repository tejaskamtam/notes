---
course: CS M146
area: ucla
created: 2023-05-01T13:59
updated: 2023-05-03T15:37
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

- Linear Model regularization review
    
    ![[/Untitled 78.png|Untitled 78.png]]
    

# Lecture

## Feature Maps (Basis Functions)

- any function $\phi:X\to\hat{X}$﻿
    
    ![[/Untitled 1 58.png|Untitled 1 58.png]]
    
- e.g. for features $\bm x\in\R^2$﻿, we have a feature map $\phi:\R^2\to\R^6$﻿

$\phi(\bm x)=\phi([x_1,x_2])=[1,x_1,x_2,x_1^2,x_2^2,x_1,x_2]$

- with this, we can still use a linear hypothesis class: $h_{\bm\theta}(\bm x)=\bm \theta^T\phi(\bm x^{(i)})$﻿

### Gradient descent w/ feature maps

![[/Untitled 2 51.png|Untitled 2 51.png]]

- each update requires computing the hypothesis → high dimensions feature maps require more computation
- very expressive feature map (high dimension) tend to overfit → need regularization
    
    ![[/Untitled 3 44.png|Untitled 3 44.png]]
    

### Regularization w/ feature maps

- Linear Model regularization review
    
    ![[/Untitled 78.png|Untitled 78.png]]
    
- for linear models with possible feature maps, we can express them as

![[/Untitled 4 42.png|Untitled 4 42.png]]

## Representor Theorem

- used to efficiently train and evaluate expresive feature mapd
- theorem (special case): for any $\lambda>0$﻿, there exists some ral-valued coefficients $\beta_i\in\R$﻿ (scalars) such that the minimizer of the regularized loss function is:
- i.e. the optimal gradient for the regularized loss is

$\widehat{\bm\theta}=\sum_{i=1}^n\beta_i\phi(\bm x^{(i)})$

$\beta_i=-\frac1{2\lambda n}L'\bigg(\bm\theta^T\phi(\bm x^{(i)}),y^{(i)}\bigg)$

- proof
    
    ![[/Untitled 5 34.png|Untitled 5 34.png]]
    

## Reparametrized Risk

- representor theorem allows us to reparametrize the $\ell_2$﻿ regularized loss:

$J(\bm\theta)\frac1n\sum_{i=1}^nL\bigg(\bm\theta^T\phi(\bm x^{(i)}),y^{(i)}\bigg)+\lambda\|\bm\theta\|_2^2$

- thus, by representor theorem, we can use the minimized gradient into the loss function above to obtaain a reparametriz objective (loss) function w.r.t. $\bm\beta$﻿
    
    ![[/Untitled 6 33.png|Untitled 6 33.png]]
    
    ![[/Untitled 7 31.png|Untitled 7 31.png]]
    

![[/Untitled 8 28.png|Untitled 8 28.png]]

- the kernel function can be precomputed for all training instances during training → we only optimize over $\bm\beta$﻿ insteaad of computing th hypothesis (dot product) for each iteration

## Kernel Trick

![[/Untitled 9 23.png|Untitled 9 23.png]]

- thus, we can (in some situations) compute the kernel dot product faster than the fature map itself

### Kernelized Linear Model

- apply kernel trick: only compute kernel function instad of feature map → kernelized linear models
- thus, given a kernel function on a set of training intances of cardinallity $m$﻿, we can dfine a kernell matrix $K\in\R^{m\times m}$﻿

$K_{ij}=k(\bm x^{(i)},\bm x^{(j)})$

![[/Untitled 10 21.png|Untitled 10 21.png]]

### Kernalized Ridge Regression

![[/Untitled 11 19.png|Untitled 11 19.png]]

## Valid Kernels

- given a feature map, a kernel function defined as the dot product of the feature map with itself → defines a notion of similrity between the two vectors (data points)
- e.g. $K_{ij}=k(\bm x^{(i)},\bm x^{(j)})$﻿ shows similarity between $\bm x^{(i)}$﻿ and $\bm x^{(j)}$﻿
- other form of similarity include: euclidean distance, cosine similarity, any similar kernel function
- but any arbitrary kernel function does NOT imply a feature map

### Is a Kernel Valid?

![[/Untitled 12 19.png|Untitled 12 19.png]]

### Mercer’s Theorem

![[/Untitled 13 18.png|Untitled 13 18.png]]

- e.g. $k(\bm u,\bm v)=(\bm u^T\bm v)^2$﻿
    
    ![[/Untitled 14 14.png|Untitled 14 14.png]]
    

### Kernel Composition Rules

- algebraic operation on known valid kernels → result in valid kernels

![[/Untitled 15 12.png|Untitled 15 12.png]]

### Example: Gaussian Kernel (RBF)

$k(\bm x^{(i)}, \bm x^{(j)})=\exp\bigg(-\frac{\|\bm x^{(i)}-\bm x^{(j)}\|_2^2}{2\sigma^2}\bigg)$

- has. val 1 when $\bm x^{(i)}=\bm x^{(j)}$﻿
- value falls off to 0 w/ increasing distance
- note: needs feature scaling before using RBF
- $\sigma$﻿ is the bandwidth hyperparameter → determines how much L2 norm affects the kernel

# Discussion

# Resources

---

![[/8_-_Kernels.pdf|8_-_Kernels.pdf]]

📌

**SUMMARY  
**