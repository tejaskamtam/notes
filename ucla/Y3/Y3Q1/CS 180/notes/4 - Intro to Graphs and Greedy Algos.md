---
area: ucla
quarter: Y3Q1
created: 2023-10-10 08:14
updated: Tuesday 10th October 2023 08:15:10
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 4 - Intro to Graphs and Greedy Algos

layout: note

---
# Priority Queue
- in-class priority queue implementation uses a heap
## MinHeap
- the root of all subtrees is smaller than the children (less priority)
- no guarantees about right vs left children
- can access a node and its children in $O(1)$
- can be in an array or linked list format
### Array format
- node at $i$ has children at $2i$ and $2i+1$
- children have parent at $\lfloor 2i/2\rfloor$ and $\lfloor (2i+1)/2\rfloor$

### Heapify
- when we access the min, we remove it
- then set the heap root to $\min(l,r)$
- on a balanced tree heapify  -> $$O(h)=O(\log n)\quad h:\text{height of the tree}\quad n:\text{num elements}$$
- rebalancing may cause non-heap leaves -> do a minimum of this lea and the parent and place that as the sub root
- heap sort (sorting using a heap) $$O(n\log n)$$
- insertion and deletions $$O(\log n)$$
- heapify sorting down is $$O(n)$$

# Graphs
## Structure
- made of vertices/nodes
- nodes connected by edges/links
- the graph $G$ is defined as the set of nodes and edges:$$G=(V,E)\quad\text{s.t.}\quad |V|=n,\space|E|=m$$
- edges can be directed or undirected
## Properties
- nodes are adjacent if an edge connects them (in a directed adjacency only follows the direction)
- bidirectionality requires 2 edges
- graphs are connected if all vertices are connected by edges
- disconnected subgraphs are called components
- path is deined by set of eges e.g., $((a,b),(b,c),(c,d))$
- cycle is a path that begins and ends at the same point
- simple paths/cycles visit vertices only once
## Exploration
- many ways to store; one way is an adjacency matrix
- number of edges
$$\sum_i^{n_i} i=\binom{n}{2}=\frac{n(n+1)}{2}$$
- a graph has at least $(n-1)$ edges and $O(n^2)$ ranging from sparse to dense edges s.t.
$$n-1\le m\le O(n^2)$$ 
# Greedy Algorithms
- says to pick the **locally optimal** choice at every step (don't consider global maximization)
- usually based on a parameter of the inputs: length of tasks, number of conflicts, etc.
## Scheduling problem
- tasks are given as an interval
- tasks can only be completed in sequence (no parallelization)
- pick the maximum subset of non-overlapping tasks
### Example
![[Pasted image 20231010092645.png]]
![[Pasted image 20231010092626.png]]
### Greedy Solution
- pick tasks based on the earliest end time that does not overlap
![[Drawing 2023-10-10 09.18.57.excalidraw]]

### Proof BWOC
![[Pasted image 20231010092838.png]]
### Implementation - no overlaps
- sort the list of events by earliest finish date (e.g. using heapsort) $O(n\log n)$
- pick the first event
- then, pick in order IF the event's start time is after the already picked start time
- thus, the total run time: $$O(n\log n)$$