---
course: CS M146
area: ucla
created: 2023-05-23T22:26
updated: 2023-06-13T17:06
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

# Lecture

## Dimensionality Reduction

- the goal is to maintain the most information while reducing feature dimensions
    
    ![[/Untitled 19.png|Untitled 19.png]]
    
- maximizee variance in each principal direction (dimension)

### Principal Component Analysis (PCA)

- considers an encoding/decoding for reduction

![[/Untitled 1 10.png|Untitled 1 10.png]]

$\min_{U,W}\sum_i^n\|\bm x^{(i)}-\bm{\tilde x}^{(i)}\|_2^2=\|X-XW^TU^T\|_F^2$

### Lemmas - SImplify the optimization

- Lemma 1 - orthogonality allows us to simplify the optimization problem

![[/Untitled 2 9.png|Untitled 2 9.png]]

- Lemma 2 - PCA sol. is found from the empirical covariance matrix $A$﻿

![[/Untitled 3 6.png|Untitled 3 6.png]]

### PCA Solution Steps

- psuedocode

![[/Untitled 4 5.png|Untitled 4 5.png]]

![[/Untitled 5 4.png|Untitled 5 4.png]]

### Explained Variance

- measures relative importance of each eigenvector

![[/Untitled 6 4.png|Untitled 6 4.png]]

### Principal Component Directions

- orthogonal projection of data onto lower dimensional space to maximize variance or minimizing distance between data points and projections

![[/Untitled 7 4.png|Untitled 7 4.png]]

![[/Untitled 8 4.png|Untitled 8 4.png]]

- longest PCA axis shows direction of data reduction, secondary is shown orthogonal to the direction
    
    ![[/Untitled 9 3.png|Untitled 9 3.png]]
    

## Image Compression - PCA

### Example: Butterfly in 144D

![[/Untitled 10 2.png|Untitled 10 2.png]]

### Example Process

![[/Untitled 11 2.png|Untitled 11 2.png]]

![[/Untitled 12 2.png|Untitled 12 2.png]]

![[/Untitled 13 2.png|Untitled 13 2.png]]

  

# Discussion

# Resources

---

![[/13_-_Dimensionality_Reduction.pdf|13_-_Dimensionality_Reduction.pdf]]

  

📌

**SUMMARY  
**