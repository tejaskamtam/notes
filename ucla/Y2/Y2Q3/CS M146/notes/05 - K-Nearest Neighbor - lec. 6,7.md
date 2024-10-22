---
course: CS M146
area: ucla
created: 2023-04-24T13:58
updated: 2023-04-29T23:51
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 05 - K-Nearest Neighbor - lec. 6,7

layout: note

---
# Supplemental

# Lecture

## 1-Nearest Neighbor (NN) Classification

### Data Visualization (Flower types)

![[/Screenshot_2023-04-24_at_2.23.50_PM.png|Screenshot_2023-04-24_at_2.23.50_PM.png]]

  

### 1-Nearest Neighbor

- label a data point to the class of the data point closest to it
    
    ![[/Untitled 77.png|Untitled 77.png]]
    

![[/Untitled 1 57.png|Untitled 1 57.png]]

### Calculating Distances

- L2 norm is Euclidean distance
    
    ![[/Untitled 2 50.png|Untitled 2 50.png]]
    
- L1 distance
    
    ![[/Untitled 3 43.png|Untitled 3 43.png]]
    

### Decision Boundaries

- nearly all boundaries so far have been linear
- nearest neighbor can have a non-linear decision boundary

![[/Untitled 4 41.png|Untitled 4 41.png]]

## K-Nearest Neighbor (KNN) Classification

- Get indices of the top $k$﻿ nearesst neighbors
    
    ![[/Untitled 5 33.png|Untitled 5 33.png]]
    
- do majority vote to classify data points

![[/Untitled 6 32.png|Untitled 6 32.png]]

- KNN assumes all features are equally useful for classification
- scale of measurements matters → there will be different nighbors if features are not on the same scale of magnitude → we van usescale to give some features more weight
- treat $k$﻿ as a hyperparam to optimize

### Visual

![[/Untitled 7 30.png|Untitled 7 30.png]]

### Voronoi diagrams for KNN

![[/Untitled 8 27.png|Untitled 8 27.png]]

# Discussion

  

# Resources

---

![[/6_-_k-nearest_neighbors.pdf|6_-_k-nearest_neighbors.pdf]]

📌

**SUMMARY  
**