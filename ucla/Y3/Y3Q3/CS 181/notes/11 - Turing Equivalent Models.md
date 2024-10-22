---
area: ucla
quarter: Y3Q1
created: 2024-05-22 14:11
updated: Wednesday 22nd May 2024 14:11:20
course: CS 181
parent: CS 181

title: 11 - Turing Equivalent Models

layout: note

---
## Church-Turing Thesis
- any real world computational model can be modeled by a TM (turing machine)
- i.e., if a language $L$ is recognized by any computational device, then $L$ is a turing-recognizable language
## Bidirectional Tape
- traditional tapes extend infinitely to the right
- bidirectional extends infinitely in both direction
- the Church-Turing thesis applies for bidirectional tapes
	- Proof: consider folding the LHS to the RHS so now the tape is unidirectional but 2 rows of cells
	- now the same transition function specifies direction but dependding on whether ur on the top or bottom of the tape u move in opposite directions on the tape
## Multiple Tapes
- transition function for $k$ tapes with unique heads: $$\delta:Q\times \Gamma^k\to Q\times\Gamma^k\times\{L,R\}^k$$
- still Church-Turing thesis holds
	- ue ome indicator, e.g. circle, to identify heads in tape as a new symbol in alpha
	- then go through the tape to memorize the k heads positions
	- shift these indicators to the left end of the tape (we make a new tape or smthn to make it unidirectional)
## Nondeterministic Turing Machines (NTMs)
- still single tape but with transition func: $$\delta:Q\times\Gamma\to\mathcal P\big( Q\times\Gamma\times\{L,R\}\big)$$
- input w is accepted if some computation on w accepts
- Church-Turing Thesis holds for NTMs
	- Pf. fork a new TM for every possible state taken at a transition, frontier parallel search
## Automata with Stacks
- automata with 2 stacks is equivalent to a turing machine
- 
