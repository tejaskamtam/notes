---
course: CS M146
area: ucla
created: 2023-04-19T15:11
updated: 2023-05-08T09:03
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

# Lecture

## Bias-Variance Tradeoff

### Bias vs. Variance

### Bias of an estimator

- difference bw an estimator’s expectd value and true value
- ghow far a ML model’s predictions drift from the true predictions
- high bias → underfitting

### Variance

- if we train an estimator / ML model on different training sets → how much do predictions vary
- high variance → overfitting

![[/Untitled 67.png|Untitled 67.png]]

### Error Decomposition

- For regression: the expected squared error for any hypo. can be decomposed to
- noise in training data, Bias^2, and Variance

![[/Untitled 1 51.png|Untitled 1 51.png]]

- fixing errors
    
    ![[/Untitled 2 45.png|Untitled 2 45.png]]
    

### Learning Curves

- model complexity curves
    - performance (y-axis) as a function of complexity (x-axis)
- learning curves
    - performance (y-axis) as a func. of training size (x-axis)
- magnitude of training error → bias
- gap in training to validation → variance

### Assessing Error via Learning Curves

- Identifying features of curves of validation and training
    
    ![[/Untitled 3 39.png|Untitled 3 39.png]]
    
- Ideal Learning curve
    
    ![[/Untitled 4 37.png|Untitled 4 37.png]]
    

# Discussion

# Resources

---

![[/5_-_Bias-Variance_Tradeoff.pdf|5_-_Bias-Variance_Tradeoff.pdf]]

  

📌

**SUMMARY  
**