---
area: ucla
quarter: Y3Q1
created: 2023-11-03 12:14
updated: Friday 3rd November 2023 12:14:11
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 11 - Divide and Conquer

layout: note

---
## Merge Sort
### Algorithm
- break up the list into 2 parts: $\frac n2$
- recursively do this until you get $n$ lists of 1 element
- combine 2 at a time until you call back to the original list
- $$O(n\log n)$$
- If there are an odd number of elements, we have 1 extra value remaining -> one extra merge, i.e. $\log n +1$ merges where each merges i $O(n)$ therefore, the total is still $O(n\log n)$:
- ![[Pasted image 20231103130521.png]]
### Time Complexity Proof
![[Pasted image 20231103130556.png]]

## Line Intersection Problem


## Closest Pair of Points
### Problem
- Given a cartesian plane of points, find the L2 closest pair of points

### Trivial Solution
- $O(n^2)$ for each point, check dist with every other point

### Divide and Conquer Solution
#### Divide
- Sort by x-coord, divide by median w/ a vertical line through it
- Recursively deal with each half similarly.
#### Conquer
- At the smallest step, minimum dist is the only available point.
- dist_left, dist_right:  $\delta_l,\delta_r$ 
- At steps in between, we compare any newly added/included points and check if it is smaller than the distance in that half $\delta$
#### Merge
- take $\delta = \min\big(\delta_l,\delta_r\big)$
- for checking pairs of points across the division across the median
- ![[Pasted image 20231114082214.png]]
- then in this rectangle, there is at most some finite number of points
- ![[Pasted image 20231114082823.png]]
- so, checking this for point P is $O(6)$
- so checking it for each point in the margin close to the division is $b\cdot O(n/b)$ where $b$ is the partition, which is at worse $O(n)$
- Finally check against the median or put the median on either left or right

### Time complexity
- sorting is $O(n\log n)$
- Division is recursively $O(\log n)$
- Comparing across the median (merge) is $O(n)$
- Total is $O(n\log n)$


