---
area: ucla
quarter: Y3Q1
created: 2024-04-05 14:20
updated: Friday 5th April 2024 14:20:01
course: CS 181
parent: CS 181

title: 3 - Closure

layout: note

---
## Basic Notions
- Regular Language - a language for which there exists a DFA/NFA that recognizes it
- Regular languages remain regular under regular operations, the definition is bidirectional.
## Regular Operations
### Fundamental Ops
- Complement $L=\overline L_1$
	- $F_1\to\overline F_1$ for DFAs
	- We need to inspect state transitions for NFAs to ensure the complement is regular.
-  Union $L=L_1\cup L_2$
	- Combine using $\varepsilon$ transitions
	- Combine $M_1$ and $M_2$ s.t. their union model $M'$ is defined by the cartesian products of $M_1$ and $M_2$ definitions
		- $Q'=Q_1\times Q_2$
		- $\delta'((q,r),a)=\bigg(\delta_1(q,a),\delta_2(r,a)\bigg)$
		- $F'=\bigg\{(q,r)\space|\space q\in F_1\lor r\in F_2\bigg\}=(F_1\times Q_2)\cup(Q_1\times F_2)$
- Intersection $L=L_1\cap L_2$
	- DeMorgan's => $\overline L=\overline L_1\cup\overline L_2$
	- We showed complement is regular, and the union is regular; thus, the intersection is regular bc the complement is regular
		- $Q'=Q_1\times Q_2$
		- $\delta'((q,r),a)=\bigg(\delta_1(q,a),\delta_2(r,a)\bigg)$
		- $F'=\bigg\{(q,r)\space|\space q\in F_1\land r\in F_2\bigg\}=F_1\times F_2$
- Concatenation $L=\{l_1;l_2\space|\space l1_\in L_1,l_2\in L_2\}$
### Functional Ops
- Add $L=\{x\sigma y\space|\space \sigma\in\Sigma,xy\in L\}$
	- sps DFA $D$ accepts $xy$
	- make 2 copies: $D_1,D_2$, and for some state $q$ that transitions on $\sigma$
	- Now, make the state $q$ in $D_1$ have a transition on $\sigma$ to the same state $q$ in $D_2$
	- but adjust $D_1$ so that all states are rejecting and do NOT include a start transition in $D_2$
- Skip $L=\{xy\space|\space x\sigma y\in L,\sigma\in\Sigma\}$
	- Similar to add, sps $D_1,D_2$ are the same DFA but 2 copies that both accept $xy$
	- $D_1$ has the start transition but is all rejecting and $D_2$ has no start transition
	- now, from some state $q\in D_1$ draw $\varepsilon-$transitions for each symbol in the alphabet to the same state $q\in D_2$ but unique copies for each symbol
	- i.e., $q\in D_1$ will have 2 $\varepsilon-$transitions for the binary alphabet to 2 copies of $q\in D_2$   
![[IMG_5312 1.jpg]]
### Corollaries
> If $L_1,L_2,...,L_n$ are regular, then the language described by any regular operations on any number of them is also regular 
> e.g. $L=L_1\cup L_2\cup L_3\cup... \cup L_n$
> e.g.$L=L_1\cap L_2\cap...\cap L_n$ 

> Every finite language is regular
> Pf:
- sps. $L$ is finite then, $\bigcup_{w\in L} \{w\}$ is regular by the corollary above WLOG
