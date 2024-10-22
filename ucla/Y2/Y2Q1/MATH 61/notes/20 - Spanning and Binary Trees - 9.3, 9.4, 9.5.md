---
course: MATH 61
area: ucla
created: 2022-11-28T18:38
updated: 2022-11-29T19:56
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 20 - Spanning and Binary Trees - 9.3, 9.4, 9.5

layout: note

---
# Definitions

---

- internal vertices
    - vertices that are not “leaf nodes”
- leaf nodes / terminal vertices
    - “dead end” vertices in a tree

# Big Ideas

---

## Spanning Trees

### Spanning Trees

- subgraph $T$﻿ of $G$﻿ s.t. $T$﻿ is a tree where $V(T)=V(G)$﻿
- e.g. spanning trees
    
    ![[/Untitled 25.png|Untitled 25.png]]
    

### Breadth First Search (BFS)

![[/Untitled 1 16.png|Untitled 1 16.png]]

- e.g. visual
    
    ![[/Untitled 2 15.png|Untitled 2 15.png]]
    

### Depth First Search (DFS)

![[/Untitled 3 12.png|Untitled 3 12.png]]

- e.g. visual
    
    ![[/Untitled 4 11.png|Untitled 4 11.png]]
    

## Minimal Spanning Trees (MST)

- the spanning tree of weighted graph $G$﻿ whose sum of weights is the lowest

### Prim’s Algorithm

![[/Untitled 5 9.png|Untitled 5 9.png]]

- e.g. visual
    
    ![[/Untitled 6 9.png|Untitled 6 9.png]]
    

## Binary Tree

### Binary Tree

- a rooted tree where each vertex has $n\in \{0,1,2\}$﻿ children
- the children are labeled as “right” or “left”
- e.g. visual
    
    ![[/Untitled 7 9.png|Untitled 7 9.png]]
    

### Full Binary Tree

- a binary tree with each vertex having $n\in\{0,2\}$﻿ children

### Thm. Full Binary Tree

- if full binary tree $T$﻿ has $i$﻿ internal vertices
- $\implies i+1$﻿ terminal vertices (leaf nodes)
- $\implies |V(T)| = 2i+1$﻿

# Resources

---

![[/61_-_Week_9_notes_--_9.3_9.4_9.5.pdf|61_-_Week_9_notes_--_9.3_9.4_9.5.pdf]]

📌

**SUMMARY  
**