---
area: ucla
quarter: Y3Q1
created: 2024-05-13 00:22
updated: Monday 13th May 2024 00:22:36
course: CS 181
parent: CS 181

title: 7 - Pushdown Automata

layout: note

---
## Basic Notions
- PDA, like NFA but with a stack feature, init empty
- Thm: a lang has a CFG iff. it has a PDA
- thus, Def: a lang is **context free** if it has a CFG or equiv a PDA
- every reg lang is context free
- an NFA is thus a PDA that never uses the stack
- transitions: ![[Pasted image 20240513002631.png]]
- basic example for nonreg langs: 
	- ![[Pasted image 20240513002936.png]]
	- ![[Pasted image 20240513003040.png]]
- Definition of PDA ![[Pasted image 20240513003226.png]]
	- script P is superset
## Constructing PDAs
- Palindromes: ![[Pasted image 20240513003747.png]]
- twice as many as as bs: ![[Pasted image 20240513004239.png]]
- halves are same size but first is not the same as second half (we care abt the number of symbols and check for a difference in the halves): ![[Pasted image 20240513004852.png]]

## CFG to PDA
- Theorem: every lang that has a CFG can be recognized by a PDA
- Pf: CFG can be expressed as ![[Pasted image 20240513010836.png]]
- e.g., ![[Pasted image 20240513011128.png]]
## Converting PDA to CFG
- Thm: if L is recognized by a PDA, then L has a CFG
- Pf: TBA in discussion
- 