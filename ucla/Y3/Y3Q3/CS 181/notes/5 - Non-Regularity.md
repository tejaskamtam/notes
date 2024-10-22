---
area: ucla
quarter: Y3Q1
created: 2024-04-22 14:25
updated: Monday 22nd April 2024 14:25:57
course: CS 181
parent: CS 181

title: 5 - Non-Regularity

layout: note

---
## First Non. Reg. Lang.
- $L=\{0^n1^n\space:\space n\ge 1\}$
- Consider an automaton $M$ with $P$ states. Suppose we have a binary string $w=0^P1^P\in L$ 
- By the P.P., this string must have a loop in the automaton. 
- Suppose the loop is on 0 (although there should be a loop on both).
	- Let $x$ be the substring prior to the loop ($0...0_k$)
	- Let $y$ be the substring in the loop ($0_{k+1}...0_{p-1}$)
	- Let $z$ be the substring after the loop ($0_{p}1...1_p$)
- If $M$ accepts $xyz$, it accepts $xyyz$ BUT $xyyz\notin L$.

## Pumping Lemma
- Let $L$ be a reg. lang., then $\exists p\in\mathbb{N}$ s.t. every $w\in L$ of length $\ge p$ can be written as $w=xyz$ where
	- $x,y,z$ are strings
	- $y\neq\varepsilon$
	- $|xy|\le p$
	- $xy^iz\in L,\space\forall i\in\mathbb N$
- i.e., all sufficiently long strings in the language can be pumped
- a **pumping length** $p$ is at least the number of states in the DFA(?), thus for strings valid to the lemma, they must visit at least 1 state more than once -> a loop
### Contrapositive
- $\forall p\space:\space \exists w\in L,\space |w|\ge p$
- $\forall x,y,z$:
	- $w=xyz$
	- $y\neq\varepsilon$
	- $|xy|\le p$
	- $\exists i\space:\space xy^iz\notin L$
- then, this implies $L$ is nonregular
- this is NOT bidirectional i.e. some nonregular langs satisfy pumping langs
### Examples
- $L=\{10^n1^n\}$
	- consider the string $10^p1^p$, then there are 2 cases:
	- case 1: $y$ is the first 1 $\implies$ pumping down makes thee\ string no longer in the lang, thus lang is nonreg
	- case 2: $y$ is in the $0^p$ string, then pumping down makes the number of 0s $\neq$ number of 1s, thus $xz$ (we pumped out $y$) not in the lang $\implies L$ is nonreg 
- $L=\{1^{n^2}\}$
	- consider $w=1^{p^2}$
	- $p^2\lt |xy^2z|=|xyz|+|y|=p^2+|y|$
		- note that adding a single symbol should make the number of 1s to be $(p+1)^2=p^2+2p+1$ chars long
	- and since $|y|\le p$ we can say in the edge ("best") case $|y|=p$
	- s.t. $p^2\le |xyz|+|y|\le p^2 +p\lt p^2+2p+1=(p+1)^2$
	- thus $xy^2z\notin L\implies L$ is nonregular
- $L=\{w:w=w^R\}$
	- consider $w=0^p10^p$
	- then $y\in 0^p$ is fragile s.t. pumping up or down will make the number of 0s on the left be more or less than the number of 0s after the 1, which is not in the language, thus $L$ is nonregular 
- $L=\{ww:w\in\{0,1\}^*\}$
	- consider $w=0^p10^p1$ s.t. $y\in 0^p$ (the first part)
	- then pumping $y$ up or down will lead to the first half of the string != the second half, thus not in the lang => L is nonreg 
- $L=\{w:|w|\in \mathbb{P}\}$ ($\mathbb{P}=$primes)
	- consider $w=0^q$ s.t. $q\in\mathbb{P}:q\ge p$
	- then consider $w=xyy^qz$ s.t. $|xyy^qz|=|xyz|+q|y|=q+q|y|=q(|y|+1)$
	- thus the size of this string is a composite number which can never be a prime number, thus the string $xyy^qz\notin L\implies L$ is nonreg
- $\Sigma=\{0,1,...,9\}$; $L=\{w\in\Sigma^*:\text{ fractional part of PI starts with }w\}$
	- e.g. $L=\{\varepsilon,1,14,141,1415,14159,...\}$
	- consider $w=14159265358979...$ s.t. $|w|=p$
	- sps. $xy^iz$ is pumpable $\forall i$ , then it means that as we take $i$ to the limit $3.xy^iz\to 3.xyyyy...$ which is a rational number while $\pi$ is not
	- thus $\exists i$ s.t. $xy^iz$ is not in the language => L is nonreg
## Proving non-regularity using closure properties
- Instead of applying the contrapositive of the pumping lemma (P.L.), we can show with closure under regular operations that a language is regular or non-regular
- e.g., $L=\{0^n1^m\space:\space n\neq m\}$
	-  we can show $\{0^*1^*\}\setminus L=\{0^n1^n\space:\space n\in \mathbb Z^+\}$ is nonregular, and bc set minus is a regular operation under the closure property of set minus, $L$ must be non-regular
	- proving this using P.L. is a little more complex, consider the string $0^p1^{p+a}$ where we don't yet know the value of $a$ such that the string is in thee language but can be pumped to prove nonregularity
	- consider $w=xyy^{\frac{a}{|y|}}z$  s.t. the number of 0s should equal thee number of 1s to prove nonregularity
	- then we can say that there are $p+a$ ones and $p+\frac a{|y|}|y|$ 0s, thus for the number of ys to be integer values, we mut ensure $a$ is always diivisible by $y$ which means we should choose $a=p!$ then we get $p+p!$ ones = $p+\frac{p!}{|y|}|y|$ 0s
	- thus the number of 0s = num 1s is not in the lang, thus the lang is nonreg
## Common Pitfalls
- reg langs closed under infinite union
	- false 
- subsets of reg langs are reg
	- False: $L_{nonreg}\subseteq \Sigma^*$
- subsets of nonreg langs are nonreg
	- False: $\emptyset\subseteq\{0^n1^n\}$
- nonreg langs are closed under complement
	- True: bc if not true $\implies$ the complement off a reg lang could be non reg which is not. possible bc $L_{reg}\iff \overline{L_{reg}}$
- nonreg langs closed under intersection
	- False: consider intersection of 2 nonreg langs that resultss in the set of the empty string e.g. $\{0^n1^n\}\cap\{1^n0^n\}=\{\varepsilon\}$
- 