---
area: ucla
quarter: Y3Q1
created: 2023-10-19 08:03
updated: Thursday 19th October 2023 08:03:19
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 7 - Topological Sort (3.6)

layout: note

---
## Topo Sort
- operates on a DAG to sort by topology, all vertices s.t. if there is an (x,y) edge, x must come before y in the sorted list
- components can be placed anywhere in the sorted list, but must still follow the topological property
- there can be an exponential number of topo sorts
	- ![[Pasted image 20231019081612.png]]
- starts with a source - a vertex with no incoming edges (in-degree)
	- out-degree - the # edges going out of a node
	- sink - nodes with in-degree > 0
	- there is at least 1 source in a DAG
### Simple Algo - Topo Sort
- given a list of sources - pick one
- add it to the list, and delete it from the DAG
	- deletion includes deleting its outgoing edges
	- deleting edges guarantee it's still a DAG
	- the nodes remaining are sources of each of their new DAGs - add them to the list of sources
- add the next source and repeat - the order of sources does not matter
- ![[Pasted image 20231019083526.png]]

### Full Algo - Determine sources + sort
- initialize the graph nodes with in-degree = 0
- we go through nodes, check any incoming edges, and increment its in-degree
- computing all in degrees is computing all edges for each node $O(n^2)$
- BUT, incrementing in-degree is const. time so: $$O(e)$$
- now we can find all sources in the graph based on their associated in-degree: $$O(n)$$
- ---
- now choose from the sources list, pick one, and delete it from the source list (because the only time we check its outgoing edges is when we delete it: deleting its edges (decrementing children's in-degree) is const. time per edge)
- decrement its children's in-degree, add new sources to the source list -> const. per edge thus for all edges at each iter: $$O(e)$$
- therefore, the runtime of total algo is linear: $$O(e+n)$$

