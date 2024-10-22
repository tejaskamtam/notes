---
course: CS M146
area: ucla
created: 2023-05-03T13:57
updated: 2023-06-13T22:34
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 08 - SVM - lec. 11, 12, 13

layout: note

---
# Supplemental

### Perceptron Review

![[/Untitled 55.png|Untitled 55.png]]

### Constrained Optimization

$\min_x x^2\quad\text{s.t.}\quad x\ge b$

![[/Untitled 1 42.png|Untitled 1 42.png]]

  

# Lecture

## Linear Separators

### Perceptron Review

![[/Untitled 55.png|Untitled 55.png]]

### Choosing a separator

![[/Untitled 2 38.png|Untitled 2 38.png]]

![[/Untitled 3 32.png|Untitled 3 32.png]]

- the last separator is robust to nooise in the dataset

### Margin of a Linear Separator

- given a binary classifier with (1,-1) labels and a linear separator decision boundary
- the margin of aapoint $\bm x^{(i)}$﻿ w.r.t. the hyperplane (linear separator) is the perpendicular distance between the point and the hyperplane

$\gamma^{(i)}=\text{length}(AB)$

![[/Untitled 4 30.png|Untitled 4 30.png]]

### Computing Margin

### proof

- assuming $\bm \theta$﻿ defines the hyperplane that perfectly separates the data with no bias
- we assume the point wee are tryiing to calculate margin for $\bm x^{(i)}$﻿ has a positive label $y^{(i)}=1$﻿ thus the hypothesis >0
- $\bm \theta/\|\bm\theta\|_2$﻿ is the unit normal vector to the plane
- thus the point $B$﻿ lies on the hyperplane

$B=\bm x^{(i)}-\gamma^{(i)}\frac{\bm\theta}{\|\bm \theta\|_2}$

- this means because the point B lies on the hyperplane, its corresponding feature vector’s hypothesis = 0 so

$\gamma^{(i)}=\frac{\bm\theta^T\bm x^{(i)}}{\|\bm\theta\|_2}$

![[/Untitled 5 24.png|Untitled 5 24.png]]

$\gamma^{(i)}=y^{(i)}\frac{\bm\theta^T\bm x^{(i)}}{\|\bm\theta_{1:d}\|_2}$

![[/Untitled 6 23.png|Untitled 6 23.png]]

### Maximizing Margin Classification

![[/Untitled 7 22.png|Untitled 7 22.png]]

![[/Untitled 8 20.png|Untitled 8 20.png]]

issueis. that max margin in NON-CONVEX → hard to optiimize

## Support Vector Machines

- the maachines made from datapoints that lie on the boundary (support vectors) of the max-margin

### Hard Margin SVMs

- we canuse the pereptron loss to constrain the minimization

![[/Untitled 9 17.png|Untitled 9 17.png]]

![[/Untitled 10 15.png|Untitled 10 15.png]]

### Classic SVMs (max-margin classification)

![[/Untitled 11 13.png|Untitled 11 13.png]]

![[/Untitled 12 13.png|Untitled 12 13.png]]

### Soft Margin SVMs

- used. for non (linearly) seperable data
    
    ![[/Untitled 13 13.png|Untitled 13 13.png]]
    

![[/Untitled 14 10.png|Untitled 14 10.png]]

### Slack Constraints

![[/Untitled 15 9.png|Untitled 15 9.png]]

### Defining Support Vectors

- in non seperable cases

![[/Untitled 16 7.png|Untitled 16 7.png]]

### Hinge Loss (Unconstrained Optimization)

![[/Untitled 17 6.png|Untitled 17 6.png]]

![[/Untitled 18 4.png|Untitled 18 4.png]]

  

# Discussion

  

# Resources

---

![[/10_-_SVM.pdf|10_-_SVM.pdf]]

  

📌

**SUMMARY  
**