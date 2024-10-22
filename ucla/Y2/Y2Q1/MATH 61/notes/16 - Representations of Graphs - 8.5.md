---
course: MATH 61
area: ucla
created: 2022-11-06T21:54
updated: 2022-11-06T22:09
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 16 - Representations of Graphs - 8.5

layout: note

---
# Definitions

---

- simple graph
    - a graph with no parallel edges or loops
- incident edge
    - an edge that connects to a vertex = the incident edge to the vertex

# Big Ideas

---

## Adjacency Matrix

- an $n\times n$﻿ matrix $A$﻿ where $|V(G)|=n$﻿ with rows and columns labeled by ordered vertices of graph $G$﻿
- the entry at $i,j$﻿ records the number of edges between the ith and jth vertices
- a loop is counted as 2 edges
- e.g. adjacency matrix
    
    ![[/Untitled 38.png|Untitled 38.png]]
    

### Symmetry

- adjacency is a symmetric condition $\implies$﻿the adjacency matrix is symmetric

### Powers of $A$﻿

- if $A$﻿ is the adjacency matrix of a simple graph
- the $ij$﻿th entry of $A^n=$﻿ the number of paths from vertex $i$﻿ to vertex $j$﻿ of length $n$﻿ for $n\in\mathbb{Z}_{>0}$﻿
- e.g. paths due to powers of $A$﻿
    
    ![[/Untitled 1 27.png|Untitled 1 27.png]]
    

## Incidence Matrix

- a matrix with rows labeled by $v\in V(G)$﻿ and columns labeled by $e\in E(G)$﻿
- store a 1 in $A_{ve}$﻿ is edge $e$﻿ is incident to $v$﻿, else → 0
- e.g. incident matrix
    
    ![[/Untitled 2 25.png|Untitled 2 25.png]]
    

# Resources

---

![[/61_-_Week_6_notes_--_8.4_8.5_8.6 3.pdf|61_-_Week_6_notes_--_8.4_8.5_8.6 3.pdf]]

📌

**SUMMARY  
**