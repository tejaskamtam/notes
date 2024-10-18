---
area: ucla
quarter: Y3Q1
created: 2023-11-28 08:11
updated: Tuesday 28th November 2023 08:11:36
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
## Flow Network
- a weighted directed graph with possible cycles
- Weights represent capacity
- There exists defined start (source) and end (sink) nodes.
- Flow is sent across edges to nodes; flow is bounded by the capacity limits of edges.
- capacities are integers and >= 1
- conservation of flow: flow in must == flow out (degree does not matter, only amounts)
### Examples
![[Pasted image 20231128082255.png]]
![[Pasted image 20231128082307.png]]
### Problem
- Find the maximum flow possible given the network.
## Theorems
### Network Cuts
- a partition of the network is the division of start and end nodes into different partitions
- ![[Pasted image 20231128083759.png]]
### Net Flow Lemma
- the net flow of a partition of the network is the sum of all outgoing flow and subtract incoming flow to the partition (cut)
- ![[Pasted image 20231128083714.png]]

### Weak Duality Theorem
- the max flow is capped by the minCut value
- ![[Pasted image 20231128091735.png]]
- ![[Pasted image 20231128091913.png]]

### Max-Flow Min-Cut Theorem
![[Pasted image 20231128092521.png]]
![[Pasted image 20231128092530.png]]
## Algorithms
### Ford-Fulkerson (Greedy)
- find a path from s to t
- add flow = bottleneck edge in the path
- assign flow and create residuals for the path with a capacity equal to the flow across its complement edge
	- if the residual already exists, e.g. we are on our 2nd iteration of the algo, then update the reverse edge existing in the graph instead of adding a new residual
- subtract flow from the capacities of the taken edges
- find another path in this new augmented graph and repeat, this time considering all edges in the augmented graph (including residuals)
- if we use a residual, subtract the flow from its capacity
- ![[Pasted image 20231128085957.png]]
- ![[Pasted image 20231128090009.png]]

## Time Complexity
- finding a path is $O(V+E)$
- for some maxflow $f$ we might have to find $f$ different flow paths if the minimum capacity is $1$
- thus it is $O(|f|(V+E))$
- ![[Pasted image 20231128094041.png]]

## Proof
- same as max-flow theorem proof
- when the algo terminates, no more paths s->t
	- algo terminates bc we say that for the graph if cap of some edge is 0, we remove it from the graph, if this edge separates the graph s->t, then there are no more paths
	- If the cap is greater than 0, everytime we take the path we would decrease the capacity by at least 1
	- inductively, we will saturate all edges that allow for more free paths in the graph
- we want to show the flow is equivalent to the capacity of some cut
	- a cut is a partition of the graph, with one partition having the source and the other having the sink
	- the capacity of the cut is the sum of all outgoing capacities from the cut (not within only out of)
	- all flow from s->t must be less than the capacity of the cut
	- thus, the maxflow is bounded by the minimum cut capacity in the graph
	- it is not possible for the maxflow to be larger than the capacty of any cut by the above statement
	- it is also not possible for any cut to be less than the maxflow
		- bc the maxflow must have saturated paths s.t. there is no more paths s->t
		- and our maxflow does not take any paths t->s bc if it did, its residual would be s->t which we would have saturated, thus its apacity goes to 0 whch by our algorithm means its complementary edge goes to 0 thus its as if that edge t->s never existed
		- so our capacty is just the sum of all outgoing edges s->t and the flow = capacity of the edge (bc we saturate)
		- so it is not possible for the cut capacity to be less than the maxflow
	- therefore, maxflow must = capacity of a cut, this cut is the mincut
### Max-Flow Min-Cut Theorem
![[Pasted image 20231128092521.png]]
Week duality corollary:
for some flow $f$ and cut $(A,B)$
if $v(f) = cap(A,B)$ then $f$ is the maxflow and the cut is the min cut
![[Pasted image 20231128092530.png]]