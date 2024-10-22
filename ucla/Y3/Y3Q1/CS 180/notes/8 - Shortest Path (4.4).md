---
area: ucla
quarter: Y3Q1
created: 2023-10-24 08:05
updated: Tuesday 24th October 2023 08:05:18
course: 
📕 courses:
parent: CS 180

title: 8 - Shortest Path (4.4)

layout: note

---
![[Dijkstra Algorithm Animation.gif]]

## Articulation Points
- a connector - a vertex whose removal will make the graph disconnected
- should be found in linear time
## Shortest Path
- [[5 - Graph Traversal (3.2, 3.3)#BFS - level order|BFS]]  gives the shortest path on unweighted graphs by finding the minimum height/length of a path
### Dijkstra - Greedy
![[Pasted image 20231024082959.png]]
- with greedy, we assume no negative edges, no negative cycles
- we use the greedy paradigm: instead of looking directly from $s$ to $b$, look locally: what's the shortest path from any neighbors of $s$ to $s$ and pick that vertex - so we pick $c$
	- ![[Pasted image 20231024083011.png]]
- next, we go depth-first, checking the neighbors of the previous minimum neighbor: we can keep track of these through stages: processed, intermediary (neighbors), unprocessed
	- ![[Pasted image 20231024085428.png]]
- from these neighbors of neighbors, we take the shortest path neighbor
- we continue to do this, updating each node's stored weight (to its cumulative weight) and selecting its minimum one; unprocessed nodes are given infinity or a designation like \* for unprocessed
- we continue until all nodes are processed and assigned their minimum cumulative weight
### Visualization: https://www.cs.usfca.edu/~galles/visualization/Dijkstra.html
### Proof
- at each step for each node we choose the minimal cumulative path cost, so there is no possibility for our path not to be the shortest path
### Time Complexity
- Naive: $O(n^2)$ bc for each processing of each node, we have to update at worst $n-1$ nodes
- thus, for dense graphs $$T(n,e)=O(n^2)$$
- Instead, for each node we process, we account for each neighbor to the edges, then storing/extracting the minimum of the intermediary nodes for each edge we charge the cost of run time to: we can store in a heap for which pushing is $\log n$ thus, for sparse graphs
- I.e., for each traversal, we look at each edge at most once  $O(e)$ but finding the minimum intermediate node for each edge operation is $O(\log n)$ using `heappop` so overall is $$T(n,e)=O(e\log n)$$
- we pick depending on whether or not the graph is very dense$$e\le \frac{n^2}{\log n}$$

## Ex. Midterm Question
- assume a graph with positive and negative edges
- take the most negative edge, and add its absolute value to every edge
- then apply Dijkstra's, is this shortest path the same as before adding the absolute value
- the answer is No because it is mixing weights and values; Dijkstra does not work on negative edged graphs
- adding the most negative edge for multiple paths that have slightly negative values ddoes not just add to the length, but multiplies the length by adding the most negative value to each edge e.g. most neg is -3, so add +3 to each edge, if you have a ton of neg edges, you add 3 per ege whih is multiplicative and confuses the shortest path
- 