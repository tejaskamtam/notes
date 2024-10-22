---
course: CS M146
area: ucla
created: 2023-06-07T14:11
updated: 2023-06-07T15:18
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 15 - Generative Models - lec. 20

layout: note

---
# Supplemental

# Lecture

## Generative Modeling

### Hand-Engineered - Graphics

- we can generate natural image with a computer using raw senory input
- defining shape, size, color, etc. → graphics software

### Statistical Generative Models

- given some images as data and pror knowledge (labels, characteristics, etc.)
- we want to generate new images that align to the input
- thus, there is some probability distribution uch that the training dataset denotes independent samples from the distribution
- the goal is to learn the probablity diitribution → generation is inference by selecting an image off the distribution

![[/Screenshot_2023-06-07_at_2.39.35_PM.png|Screenshot_2023-06-07_at_2.39.35_PM.png]]

  

### Autoregressive Generative Models

- we use conditionals to condition on training data
    
    ![[/Screenshot_2023-06-07_at_2.56.43_PM.png|Screenshot_2023-06-07_at_2.56.43_PM.png]]
    
- we can introduce new modality using more conditions on text, characteristics, etc.
- e.g. images
    
    ![[/Screenshot_2023-06-07_at_3.05.13_PM.png|Screenshot_2023-06-07_at_3.05.13_PM.png]]
    
      
    
- e.g. text
    
    ![[/Screenshot_2023-06-07_at_3.05.26_PM.png|Screenshot_2023-06-07_at_3.05.26_PM.png]]
    

## Representing Probability Conditionals

![[/Screenshot_2023-06-07_at_3.14.53_PM.png|Screenshot_2023-06-07_at_3.14.53_PM.png]]

![[/Screenshot_2023-06-07_at_3.15.13_PM.png|Screenshot_2023-06-07_at_3.15.13_PM.png]]

  

## DNNs to Parametrize Conditionals

### Architecture that learn conditionals

![[/Screenshot_2023-06-07_at_3.16.24_PM.png|Screenshot_2023-06-07_at_3.16.24_PM.png]]

### Learning Probability Conditionals

![[/Screenshot_2023-06-07_at_3.17.44_PM.png|Screenshot_2023-06-07_at_3.17.44_PM.png]]

![[/Screenshot_2023-06-07_at_3.18.03_PM.png|Screenshot_2023-06-07_at_3.18.03_PM.png]]

  

# Discussion

  

# Resources

---

![[/17_-_Neural_Networks_-_Generative_Models.pdf|17_-_Neural_Networks_-_Generative_Models.pdf]]

📌

**SUMMARY  
**