---
area: ucla
quarter: Y3Q1
created: 2023-11-14 08:02
updated: Tuesday 14th November 2023 08:02:12
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
## Dynamic Programming (DP)
- used when divide and conquer crates overlapping divisions
- create many subproblems for which answers are known (or cached) and use as needed

## Weighted Interval Scheduling
### Problem
- given a set of weighted intervals, find a subset of non-overlapping intervals that maximizes the total weight of intervals
- ![[Pasted image 20231114090920.png]]
### Binary Selection
- Sort by end time
	- ![[Pasted image 20231114091021.png]]
- ![[Pasted image 20231114091032.png]]
- ![[Pasted image 20231114091056.png]]
- ![[Pasted image 20231114091221.png]]
- $OPT(p(j)) = OPT(l-1)$ iff timesteps are integers and unique
#### Case 1
- ![[Pasted image 20231114091125.png]]
#### Case 2
- ![[Pasted image 20231114091151.png]]

### Memoization (Caching)
- must cache the results to prevent redundant branches in the recursive solution using binary selection
- Now finding previous is O(1)
- ![[Pasted image 20231114092056.png]]
### Time Complexity
![[Pasted image 20231114092214.png]]

### Proof
- basically an exhaustive search of case by case consideration of interval

## Knapsack Problem
### Problem
- ![[Pasted image 20231114092626.png]]
- ![[Pasted image 20231114092752.png]]
### Dynamic Programming
- ![[Pasted image 20231114093725.png]]
- if there are multiple of each item, you an select the same value multiple times $$OPT(i,w)=\max\bigg(OPT(i-1,w),\space v_i + OPT(i,w-w_i)\bigg)$$
- ![[Pasted image 20231114093815.png]]
- The optimal value of the knapsack is in the bottom right corner of the table
- BUT, this value either came from the value directly above it, or some value in its row
- If the value is somewhere in the row (same value), include that marginal item of that row (e.g. last row adds item 5), then continue (ur going to end up going up a row)
- ![[Pasted image 20231114102409.png]]

### Time Complexity
- Polynomial in inputs but linear in implementation:
- ![[Pasted image 20231114094542.png]]

## Sequence Alignment (Longest Common Subsequence)
### Problem
- Given 2 sequences, `L,R` of size `m,n` find the largest common contiguous subsequences
- ![[Pasted image 20231116081259.png]]

### Intuition / Class Algo
- Sps we look at seqs `L,R` up to length `i,j`
- ![[Pasted image 20231116081628.png]]
- 2 Cases:
	- `L[i]==R[j] => OPT(i,j) = OPT(i-1,j-1) + 1`
		- ![[Pasted image 20231116083304.png]]
	- `L[i] != R[j] => OPT(i,j) =` 3 sub cases
		- Case 2.1:`OPT(i,j) = OPT(i-1,j)`
			- take all of R and skip the value at `i` of `L`
		- Case 2.2: `OPT(i,j) = OPT(i,j-1)`
			- take all of L and skip the value at `j` of `R`
		- Case 2.3: `OPT(i,j) = OPT(i-1,j-1)`
			- already covered by Case 1
### Pseudocode
```
func Solution(L of size m, R of size n):
	OPT is the matrix we memoize to
	for 1 <= i <= m:
		for 1<= j <= n:
			if L[i] == R[j]:
				OPT(i,j) = OPT(i-1,j-1) + 1
			else:
				OPT(i,j) = max{OPT(i-1,j), OPT(i,j-1)}
```
### Textbook Approach: Cost comparison
![[Pasted image 20231116085322.png]]
![[Pasted image 20231116085334.png]]
![[Pasted image 20231116085344.png]]
![[Pasted image 20231116085352.png]]
![[Pasted image 20231116085507.png]]

### Time Complexity
- $O(nm)$ in run time
### Space Complexity
- $O(n+m)$ in input size: polynomial
- For finding length: $O\big(2\cdot\min(n,m)\big)$ 
	- we only ever need the row above the row we are computing
	- the length is the last cell we compute in the matrix
- For finding the sequence: $O(m\cdot n)$
	- You need to traverse the whole matrix
## RNA Secondary Structure
### Problem
- ![[Pasted image 20231116085752.png]]
	- ![[Pasted image 20231116085836.png]]
- find max # of matching base pairs in the secondary structure
### Intuition / Class Algo
- Controlled exhaustive search, sps we look from `1` to `j`
- The value at `j` can match with up to `j` possible values between `1` to `j` for which we'll call a possible match `t`, e.g. if at `j` the value is `u`, we match to all possible `A` (values at `t`) before position `j`
- ![[Pasted image 20231116091457.png]]
- if there is a matching
	- $$\text{OPT}(1,j) = \max_{\forall t}\bigg(\text{OPT}(1,t-1) + \text{OPT}(t+1,j-1)+1\bigg)$$
- Generalized:$$\text{OPT}(i,j) = \max\bigg(1+\max_{\forall t}\big(\text{OPT}(i,t-1) + \text{OPT}(t+1,j-1)\big),\space \text{OPT}(i,j-1)\bigg)$$
### Implementation pseudocode
```python
func Solution(sequence S of length n):
	OPT # nxn matrix for memoization
	for k = 5,6,...,n-1: # because of sharp turns
		for i=1,2,...,n-k:
			j=i+k
			for j, find all t
			if_match = 1 + max{over all t} (OPT(i,t-1) + OPT(t+1,j-1))
			no_match = OPT(i,j-1)
			OPT(i,j) = max(if_match, no_match)
```
### Time Complexity
- $n$ possible `t`
- $n^2$ intervals from `(1,j)`
- $O(n^2\cdot n)=O(n^3)$

