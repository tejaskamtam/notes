---
area: ucla
quarter: Y3Q1
created: 2024-01-17 14:02
updated: Wednesday 17th January 2024 14:02:27
course: CS 161
📕 courses:
parent: CS 161

title: 3 - Uninformed Search

layout: note

---
## Terminology
- expanding a state - branching its actions
- generating a state - creating the successor state
- fringe/frontier - nodes generated from expanding a state but have not been expanded
- uninformed/blind - no percepts of the state
- informed/heuristic search - search with some info about the state
## Search Algorithms
### Tree Search
- ![[Pasted image 20240117141044.png]]
### Graph search
- removes redundancy from tree search
- ![[Pasted image 20240117141334.png]]
- now we must decide how to choose the leaf to remove from the frontier
## BFS
- ### Breadth-first search naive (don't test for goal on generate)
	- order of expansion and generation is the same - layer by layer
	- complete, optimal, 
	- $O(b^d)$ on generation and $O(b^{d+1})$ on expansion
		- ![[Pasted image 20240117143205.png]]
	- where b is branching factor and d is depth (optimal depth)
	- $O(b^{d+1})$ space complexity
- ### Breadth first search (smart - test on generation)
	- Complete, optimal
	- $O(b^d)$ time and space
	- space complexity is rlly bad, might crash
## DFS and DLS
- ### DFS
	- generates in different order than expansion
	- not complete - fails in infinite-depth/loop spaces, e.g. Knuth's
	- not optimal - might revisit the same state again if in a different branch
	- $O(b^m)$ time where $m$ is max depth
	- $O(bm)$ space
- ### To deal with repeated states & Backtracking Search
	- ![[Pasted image 20240117151912.png]]
	- the graph search can be bad if states are exponential, then space complexity is back to exponential - domain specific choice
- #### Backtracking Search - In place search
	- generate one successor at a time instead of all
	- this requires actions to be reversible
	- allows path of $O(m)$ instead of $O(bm)$ in dfs
	- using a set for visited nodes allow checking for cycles in $O(1)$
- ### depth-limited search
	- cap on depth $l$
	- complete if $l \ge d$
	- not optimal - if $l=m$ its just DFS which is not optimal
	- $O(b^l)$ time
	- $O(bl)$ space
	- makes sense if depth limit is known, e.g. GPS search, Romania has only 20 cities -> 19 = depth limit, diameter = 9 = depth limit
	- diameter - maximum of all possible shortest paths between 2 states
	- or iterative deepening
## Iterative Deepening - Korf (IDS)
![[Pasted image 20240117153155.png]]
- complete, optimal
- $O(bd)$ space complexity if solution exists else $O(bm)$ on finite state spacess
- $O(b^d)$ time complexity if solution exists, else $O(b^m)$
	- you don't want to cache bc you could get back to $O(b^d)$ nodes
- number of nodes to solution is $$N_{IDS}(b,d)=(d)b+(d-1)b^2+(d-2)b^3+...\approx O(b^d)$$
- ![[Pasted image 20240117153635.png]]
### Bi-directional IDS
- since we are given initial and goal states, we can run generation and expansion search ops from both states
- But trade-offs:
- Complete, optimal (if we detect as soon as we generate)
- Time and space: $O(b^{d/2})$ as frontier is explored in both directions
- difficult to implement as goal state must be discrete, distinct, and identifiable and actions must be invertible
## Uniform Cost Search (UCS) - Dijkstra
- instead of number of actions, we are concerned with the action cost
- BFS but instead of choosing FIFO, we want to use a priority list ordered by action cost, choose action with lowest action cost
- continue searching until we have to expand the goal state, then we know thus far the goal is the closest node to the source, thus we've found all possible paths, and the path we took is the optimal one
- new params and stats:
- complete and optimal for same reasons as BFS
- $C^*$ is the optimal solution cost, is $d$ at worst case
- $\varepsilon$ is the cost of the cheapest action
- we bound goal depth at $\lfloor \frac{C^*}\varepsilon+1\rfloor$
	- +1 for the expansion of the goal state
- Time and space: $$b^{1+\lfloor C^*/\varepsilon\rfloor}$$
- when action costs are equal, this simplifies to BFS metrics
## Search Algo Comparison
![[Pasted image 20240214002921.png]]
![[Pasted image 20240214002938.png]]