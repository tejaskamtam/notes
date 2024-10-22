---
area: ucla
quarter: Y3Q1
created: 2023-10-12 08:09
updated: Thursday 12th October 2023 08:09:33
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 5 - Graph Traversal (3.2, 3.3)

layout: note

---
# BFS - level order
- given a starting vertex $a$, visit all of $a$'s adjacencies iteratively - const. time
- then one-by-one, grab $a$'s neighbor $b$ and explore all neighbors of $b$
- levels in a graph are known as layers s.t. the root $a$ is on layer 0 e.g., $L(a)=0$
- once you have no more adjacencies to the root edge, pick another unseen vertex (perhaps in a disconnected graph) and BFS on that and repeat until all vertices are visited
## Types of edges
- edges tat enable you to visit a vertex for the 1st time are known as "tree edges"
- any edges that allow you to visit a vertex again (causing a cycle) are "non-tree edges"
- e.g., (a,b) and (a,c) are tree edges
- e.g., (b,c) and (d,e) are non-tree edges
## Example
- given the following graph - do a BFS starting from $a$
	- ![[Pasted image 20231012081551.png]]
- the order of exploration is level order:
- $a$ -> $(b,c)$ -> $(d,e)$&$f$ -> $g$

## Distance
- the level of a node is how many levels it is away from the root
- the distance is the # of layers of the shortest simple path to the root
- all distance calculations assume a fixed source and to any other destination i.e. if you want to see the dist of any 2 arbitrary points, one of the must be the root
- e.g., $d(a,g)=L(g)=3$

## Time complexity - Linear in $e,n$
- visiting all the neighbors (explored and unexplored) in the worst case is $O(n-1)$
- we do this for each node so the run time is $n(n-1)$ or order $$T(n)=O(n^2)\tag{1}$$
- BUT, this is usually overkill when the graph is sparse, so we consider lookimg a the neighbors of $a$ as the degree of a as $d_a$ s.t. $O(d_a$)
- so, overall time complexity is $T(n)=\sum_{i\in V} O(d_i)$
- But, since we can consider edges as the method of traversal AND at most $n$ nodes, the run time for a connected graph is $$T(n,e)=O(e+n)\tag{2}$$
- (1) is pessimistic while (2) is more realistic but both use the same algo, just different way of counting the operations

## Implementation
- using a FIFO queue
- add all unvisited nodes in the level to the queue
- pop the queue to visit neighbors of $a$ and add all neighbors to the queue
- if a vertex is already visited, don't put it in the queue
# DFS - depth order
- pick a source $a$
- you can travel to any of its direct neighbors in const. time arbitrarily e.g., $b$
- no traverse into $b$'s unexplored neighbors arbitrarily including via non-tree edges so $c$ is included in the list of possibilities, e.g., $d$
- now look at $d$'s neighbors $(b,e)$ and select from the unexplored list i.e., $e$ and we have visited the full depth on the $b$ side
- backup to $b$, then explore the unexplored direct neighbors - there are none so we backup again to $a$ and there are no more unexplored
## Types of edges
- edges that enable you to visit a vertex for the 1st time are known as "tree edges"
- any edges that allow you to visit a vertex again (causing a cycle) are "non-tree edges"
- e.g., (a,b) and (b,d) are tree edges
- e.g., (b,e) and (a,c) are non-tree edges
![[Pasted image 20231012085729.png]]
## Example
![[Pasted image 20231012085502.png]]
## Time complexity
- pessimistic: visit each node's neghbors for $n$ nodes has $(n-1)$ neighbors so $$O(n^2)\tag{1}$$
- BUT, visiting $a,b$ is one edge, and $b,a$ is another edge, this is the maximum times we check the same edge so time complexity is 2e + any disconnected nodes so: $$T(n,e)=O(e+n)$$

## Implementation
- uses a stack FILO
- put the root in the stack, then add all of its neighbors to the stack
- then pop the stack and explore its unexplored adjacencies and append them to the stack