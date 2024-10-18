---
course: CS M146
area: ucla
created: 2023-04-24T13:58
updated: 2023-04-26T15:42
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

# Lecture

## Decision Tree

- each internal node → test one feature $\bm x_j^{(i)}$﻿
- each branch/edge → selects one value for $\bm x_j^{(i)}$﻿
- each leaf node → predicts $y^{(i)}$﻿
- if features are continuous → internal nodes can test against a threshold

### I/O

![[/Untitled 46.png|Untitled 46.png]]

### Decision Boundary

![[/Untitled 1 34.png|Untitled 1 34.png]]

### Example from Introspection

![[/Untitled 2 31.png|Untitled 2 31.png]]

### Optimizing for the Best Decision Tree

- Occam’s razor: simplest, consistent answer is the best
- i.e. smallest tree that correctly calssifies all training examples
- but, finding provably smalles tree iss NP-hard → instead construct one that is pretty small

### Iterative Dichotimiser (ID3) Algorithm

![[/Untitled 3 25.png|Untitled 3 25.png]]

  

### Choosing Best Attribute

- choosing which attribute to split given a set of examples → to choose root and internal nodes
- naive possibilities
    - random
    - least-values - choose feature w smallest number of possibl values
    - highest accuracy - choose feaature w largest accuracy
- ID3 uses Max-Gain → one that has the largest expected information gain
    
    ![[/Untitled 4 24.png|Untitled 4 24.png]]
    

### Entropy

- measure the impurity in a group
    
    ![[/Untitled 5 21.png|Untitled 5 21.png]]
    

![[/Untitled 6 21.png|Untitled 6 21.png]]

- entropy of a fair coin
    
    ![[/Untitled 7 20.png|Untitled 7 20.png]]
    
- the higher the entropy → higher the uncertainty
- multi-class entropy
    
    ![[/Untitled 8 18.png|Untitled 8 18.png]]
    

### Conditional Entropy

![[/Untitled 9 15.png|Untitled 9 15.png]]

### Information Gain

![[/Untitled 10 13.png|Untitled 10 13.png]]

![[/Untitled 11 11.png|Untitled 11 11.png]]

### Choosing Attributes

- compute inormation gain for each attribute, pick whichever is higher
    
    ![[/Untitled 12 11.png|Untitled 12 11.png]]
    
- for the next attribute, look at only the branches which have entropy and sleect the one with the best information gain

## Full ID3 Algo

![[/Untitled 13 11.png|Untitled 13 11.png]]

### Pruning Sub-trees

- pre-pruning → while building
    
    ![[/Untitled 14 8.png|Untitled 14 8.png]]
    
    - early stopping → for future classifications choose the class of the majority of the samples
        
        ![[/Untitled 15 7.png|Untitled 15 7.png]]
        
- post-pruning → after building
    - reduced error pruning
        
        ![[/Untitled 16 5.png|Untitled 16 5.png]]
        
- tree-depth is a hyperparameter

# Discussion

  

# Resources

---

![[/7_-_Decision_Trees.pdf|7_-_Decision_Trees.pdf]]

📌

**SUMMARY  
**