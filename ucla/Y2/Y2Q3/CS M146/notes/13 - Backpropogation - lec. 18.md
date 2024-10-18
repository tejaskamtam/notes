---
course: CS M146
area: ucla
created: 2023-05-31T13:59
updated: 2023-06-05T14:12
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

- the purpose of backprop - to calculat gradients for weights and perform gradient descent
- uptream gradient = local gradient * downstream gradient
- gradient of max function = 0 if max=0 or 1 if max=x

# Lecture

## Forward and Backward Pass

![[/Screenshot_2023-05-31_at_2.10.17_PM.png|Screenshot_2023-05-31_at_2.10.17_PM.png]]

  

## Architecture (DAG)

![[/Screenshot_2023-05-31_at_2.11.00_PM.png|Screenshot_2023-05-31_at_2.11.00_PM.png]]

![[/Screenshot_2023-05-31_at_2.26.54_PM.png|Screenshot_2023-05-31_at_2.26.54_PM.png]]

## Backprop (DAG) - Scalar

### Simple DAG

![[/Screenshot_2023-05-31_at_2.35.49_PM.png|Screenshot_2023-05-31_at_2.35.49_PM.png]]

### Common Gate Reduction

![[/Screenshot_2023-05-31_at_3.03.11_PM.png|Screenshot_2023-05-31_at_3.03.11_PM.png]]

![[/Screenshot_2023-05-31_at_3.04.05_PM.png|Screenshot_2023-05-31_at_3.04.05_PM.png]]

### Torch Autograd

![[/Screenshot_2023-05-31_at_3.04.25_PM.png|Screenshot_2023-05-31_at_3.04.25_PM.png]]

![[/Screenshot_2023-05-31_at_2.33.49_PM.png|Screenshot_2023-05-31_at_2.33.49_PM.png]]

  

## Backprop (Tensors) - Vector

### Vector (Matrix) Derivatives

![[/Screenshot_2023-05-31_at_3.20.13_PM.png|Screenshot_2023-05-31_at_3.20.13_PM.png]]

### Jacobian Backprop - implicit

- must be computed implicitly (diagonally) as constructing jacobians for large data causes memory explosion

![[/Screenshot_2023-05-31_at_3.30.40_PM.png|Screenshot_2023-05-31_at_3.30.40_PM.png]]

### Matrix Multiplication - implicit Jacobian

![[/Screenshot_2023-05-31_at_3.49.32_PM.png|Screenshot_2023-05-31_at_3.49.32_PM.png]]

![[/Screenshot_2023-05-31_at_3.50.08_PM.png|Screenshot_2023-05-31_at_3.50.08_PM.png]]

### Another viewpoint

- matrix mult is associative so w can do chain rule

![[/Screenshot_2023-05-31_at_3.50.30_PM.png|Screenshot_2023-05-31_at_3.50.30_PM.png]]

# Discussion

  

# Resources

---

![[/15_-_Neural_Networks_-_Backprop.pdf|15_-_Neural_Networks_-_Backprop.pdf]]

📌

**SUMMARY  
**