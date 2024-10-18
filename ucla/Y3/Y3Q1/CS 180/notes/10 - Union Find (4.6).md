---
area: ucla
quarter: Y3Q1
created: 2023-10-31 08:08
updated: Tuesday 31st October 2023 08:08:36
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
## Union Find
- given a bunch of $N$ elements uniquely partitioned into $K$ sets
- union - combines sets
	- 2 ways to do
		- point root of one set to leaf of another -> union is $O(1)$ and find is $O(n)$
		- or, set all nodes of one set to point directly to the root in 1 level and do the same foor the other set, then find is $O(1)$ but union is $O(n)$
	- but we can try to optimize by making a tree with **height = log n**
	- so we have $K$ separate trees that takes find $O(\log N)$
	- union will set root of shorter (level wise) to point to the root of the taller set/tree
- find - checks if some specified elements are in a set
	- once combined, if the 2 specified values have the same root, then yes we can find, else no
- for each separate tree in the forest made of separate sets: $$h_i=O(\log n_i)$$
- such that after a union (point shorter tree root to the root of taller tree so height is roughly the same): $$h_{i\cup j}=O\big(\log(n_i+n_j)\big)\approx O(\log n_i)\quad \because\quad n_i\gt n_j$$
- BUT, if $h_i=h_j$ then point one of the roots to the other root: $$h_{i\cup j}=O\big(\log n_i+1\big)\approx O(\log n_i)\quad\because\quad n_i \ge n_j$$
- find complexity is equivalent to the height of the tree (either after or before union) is **log of the largest set**
- visual
	- ![[Pasted image 20231031084528.png]]
