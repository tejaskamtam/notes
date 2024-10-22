---
area: ucla
quarter: Y3Q1
created: 2024-04-29 14:11
updated: Monday 29th April 2024 14:11:31
course: CS 181
parent: CS 181

title: 6 - Context-Free Grammar

layout: note

---
## Basic Notions
- The alphabet (also called terminals) can be defined as a set $\Sigma$
- Variables are nonterminal symbols defined by the set $V$
- Transitions (known as substitution rules) are defined as mappings that are not necessarily unique or bijective.
	- by convention, the first variable of the list of substitution rules is the start "state"
- e.g. CFG
	- $\Sigma=\{a,b\}$
	- $V=\{S,A,B\}$
	- Substitution Rules:
		- $S\to A$
		- $S\to B$
		- $A\to aAb$
		- $A\to\varepsilon$
		- $B\to bBa$
		- $B\to \varepsilon$
- a derivation is a list of substitutions made from the rule set to result in a string on terminals, substitutions can only be made for nonterminals
- e.g. a derivation
	- $S\to A\to aAb\to aaAbb\to aaaAbbb\to aaabbb$
	- where we used rules in order:
	- $\#1\to\#3\to\#3\to\#3\to\#4$
- the language of a grammar is the set of all strings that can be derived
- OR
	- $S\to A|B$
- e.g., shorthand of the previous CFG
	- $S\to A|B$
	- $A\to aAb|\varepsilon$
	- $B\to bBa|\varepsilon$
- e.g., the lang for the previous CFG
	- $L=\{a^nb^n:n\ge0\}\cup\{b^na^n:n\ge0\}$
- CFG - a tuple $(V,\Sigma, R,S)$
	- $V$ is a nonempty set of vars (nonterminals)
	- $\Sigma$ is the set of terminals s.t. $V\cap \Sigma=\emptyset$
	- $R$ is the set of substitution rules
	- $S\in V$ is the start variable
## CFG -> RegEx Examples
![[IMG_5372 Large.png]]

## Language -> CFG Examples
![[IMG_5373 Large.png]]

## Prog. Lang. PL24
- identifiers: $(a\cup...\cup z)(a\cup...\cup z\cup0\cup...\cup9)^*$
- numbers: positive integers
- statement types: assignment or conditional
- prog: single statement
$$\Sigma=\{a,b,...,z,0,...,9,\gt,\lt,=,\sqcup,\mathbb P\}$$
- pos digit: $D'\to 1|...|9$
- any digit: $D\to D'|0$
- any num: $N\to ND|D'$
- letter: $L\to a|b|...|z$
- identifier: $I\to IL\space |\space ID\space|\space L$
- quantity: $Q\to I|N$
- whitespace: $W\to\sqcup\space|\space\mathbb P\space|\space WW$
- optional whitespace: $W'\to \varepsilon|W$
- test: $T\to QW'=W'Q\space|\space QW'\gt W'Q\space |\space QW'\lt W'Q$
- assignment: $A\to IW'=W'Q$
- conditional: $C\to if\space W\space T\space W\space then\space W\space S\space |\space if\space W\space T\space W\space then\space W\space S\space W\space else\space W\space S$
- start: $S\to A|C$


## Parse Trees
- a tree that shows the actions taken to get a string from a set of derivations, the string is found as the in order traversal of the leaves of the parse tree ![[Pasted image 20240510211119.png]]
- this can lead to ambiguity due to many possible parse trees that can lead to the same string e.g., above for empty string
- a grammar is **ambiguous** if some string in the grammar has 2 or more parse trees, otherwise its unambiguous
### Disambiguation
- divide into case consideration of strings to disambiguate grammars ![[Pasted image 20240510211451.png]]
- parse trees are unique if all nodes and branches in the trees are the same to the dot
### Determining Ambiguity
- consider the following problem ![[Pasted image 20240513000345.png]]
- we can represent the equivalence in number of symbols as a function, so considering all possible graphs for the grammar shows us whether we converge or diverge by the end of the string
- so we know a substring follows the grammar if the end of the substring does not dip below the horizontal line (y-coord) of the start symbol of the substr
- thus for all possible variations of the mappings of the rules, if we can show the strings are properly formatted by the end of the string, it must be unambiguous: ![[Pasted image 20240513000832.png]]
- e.g., identifying the sections of the graph can give us an unambiguous grammar, consider: ![[Pasted image 20240513001143.png]]
- e.g., carrying over unambiguous grammars to new problems: ![[Pasted image 20240513001614.png]]