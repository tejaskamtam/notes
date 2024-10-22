---
course: CS M146
area: ucla
created: 2023-05-24T14:19
updated: 2023-05-31T14:07
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 12 - Neural Networks - lec. 17

layout: note

---
# Supplemental

- Logistic regresion - binary classification
    
    ![[/Screenshot_2023-05-24_at_2.29.03_PM.png|Screenshot_2023-05-24_at_2.29.03_PM.png]]
    

  

# Lecture

## Real-World Complexity

- real world is highly complex and high dimensionality in terms of features
- hypothesis class then should logically be over more feature dimensions

### Strat 1: Kernels

- project inputs to higher dim. basis
- hypothesi is linear in $\bm \theta$﻿
- can kernalize any linear model

### Strat 2: NNs

## What is a NN?

### Biological Neural Networks

![[/Screenshot_2023-05-24_at_2.24.40_PM.png|Screenshot_2023-05-24_at_2.24.40_PM.png]]

  

### Artifical NN

- ANN is a representation of a hypothesis class w/ 3 attributes:
- Neurons - artificial neurons (nodes) that process and transsmit info
- Layers - neurons are organized into layers including an input, hidden, and an output layer(s)
- Connections - neurons ar connected through _weighted_ connections that transmit signals

## Multiclass Classification

![[/Screenshot_2023-05-24_at_2.39.14_PM.png|Screenshot_2023-05-24_at_2.39.14_PM.png]]

### Logistic Regression - Multi-class

![[/Screenshot_2023-05-24_at_2.39.32_PM.png|Screenshot_2023-05-24_at_2.39.32_PM.png]]

## 1-HL NN

- each densley conncted or fully connected nn is an MLP (multi-layer perceptron)

### Logistic to NN

![[/Screenshot_2023-05-31_at_2.02.51_PM.png|Screenshot_2023-05-31_at_2.02.51_PM.png]]

  

### Activation Functions

![[/Screenshot_2023-05-31_at_2.04.02_PM.png|Screenshot_2023-05-31_at_2.04.02_PM.png]]

  

## DNNs

### Multi-layer nets

![[/Screenshot_2023-05-31_at_2.05.00_PM.png|Screenshot_2023-05-31_at_2.05.00_PM.png]]

  

### Simple code

![[/Screenshot_2023-05-31_at_2.05.28_PM.png|Screenshot_2023-05-31_at_2.05.28_PM.png]]

  

### WHY?

- universal approx thm. a nn w/ 1 HL can approx any multivariate function with arbitrary precision
- i.e. NNs can represent any function
- DOES NOT tll weather we can learn the func w/ SGD nor how much data we need to learn
- e.g. kNN is a univ. approximator

# Discussion

  

# Resources

---

![[/14_-_Neural_Networks_Part1.pdf|14_-_Neural_Networks_Part1.pdf]]

📌

**SUMMARY  
**