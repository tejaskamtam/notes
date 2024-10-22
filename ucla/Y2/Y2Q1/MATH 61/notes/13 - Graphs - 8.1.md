---
course: MATH 61
area: ucla
created: 2022-10-30T15:57
updated: 2022-11-08T22:30
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 13 - Graphs - 8.1

layout: note

---
# Notes

---

## Definitions

---

- vertices
    - a point at which edges meet
- edge
    - a line/path between vertices
- digraph
    - a directed graph
- path
    - the edges/vertices to cross to get from some point A to some point B on a graph

## Big Ideas

---

### Graphs

- A graph $G$﻿ is a set of vertices $V(G)$﻿ and edges $E(G)\sube\{(u,v)|u,v\in V\}$﻿
- $(u,v)=e\in E(G)$﻿ is an unordered pair $\therefore (u,v)=(v,u)$﻿
- e.g. digraph
    
    ![[/Untitled 52.png|Untitled 52.png]]
    

### Directed graph (digraph)

- A directed graph G is a set of vertices $V(G)$﻿ and edges $E(G)\sube \{(u,v)|u,v\in V\}\sube V\times X$﻿
- Where $(u,v)=e\in E(G)$﻿ is an ordered pair

### Edges

- an edge $e\in E(G)$﻿ is incident to vertices $v,w$﻿ if $e=(v,w)$﻿
- $\implies v,w$﻿ are adjacent vertices
- e.g. adjacent edges
    
    ![[/Untitled 1 39.png|Untitled 1 39.png]]
    

### Multiple edges

- multiple edges associated to the pair of vertices $\{v,w\}\in V$﻿ are called parallel edges
- an edge $(v,v)$﻿ s.t. $v\in V$﻿ is called a loop
- If vertex $v$﻿ is not adjacent to any other vertex in $V(G)$﻿, then $v$﻿ is isolated

### Simple graph

- if $G$﻿ has no parallel edges or loops, $G$﻿ is a simple graph

### Weighted graph

- a graph with numbers associated to edges is a weighted graph
- if edge $e\in E$﻿ has label $k$﻿, then the weight of edge $e$﻿ is $k$﻿
- for a path $P$﻿ in a weighted graph, the length of $P$﻿ is the sum of the weights of the edges in the path

### Complete Graph

- the complete graph on $n$﻿ vertices (denoted $K_n$﻿) is the simple graph s.t. $|V(K_n)|=n$﻿ and an edge between each pair of vertices
- Hamiltonian when $n\ge 3$﻿
- e.g. $K_4$﻿
    
    ![[/Untitled 2 36.png|Untitled 2 36.png]]
    

### Bipartite graph

- graph $G=(V,E)$﻿ is bipartite if there exists sets of vertices $V_1, V_2 \sube V$﻿ (possibly empty) where $V_1\cap V_2=\phi$﻿ (mutually exclusive) and $V_1\cup V_2 = V$﻿ (partition)
- and each edge $e\in E$﻿ exists s.t. $e=(v_1,v_2)$﻿ for $v_1\in V_1,\space v_2\in V_2$﻿
- e.g. bipartite graph
    
    ![[/Untitled 3 30.png|Untitled 3 30.png]]
    

### Complete bipartite graph

- the complete bipartite graph $G$﻿ on $m$﻿ and $n$﻿ vertices (denoted $K_{m,n}$﻿) is the simple graph where vertex sets $V_1,V_2$﻿ partition $V(G)$﻿ where $|V_1|=m,\space |V_2|=n$﻿
- and $E(K_{m,n})=\{(v_1,v_2)\space|\space v_1\in V_1,\space v_2\in V_2\}$﻿
- Hamiltonian when $m=n\ge2$﻿
- e.g. $K_{3,2}$﻿
    
    ![[/Untitled 4 28.png|Untitled 4 28.png]]
    

### Degree Sum Formula

- if graph $G$﻿ has $m$﻿ edges and vertices $V=\{v_1,..,v_n\}$﻿
- $\sum_{i=1}^n \delta(v_i)=2m$﻿

  

# Lecture

---

![[/61_-_Week_5_notes_--_7.2_8.1_8.2_8.3 2.pdf|61_-_Week_5_notes_--_7.2_8.1_8.2_8.3 2.pdf]]

  

📌

**SUMMARY  
**