---
area: ucla
quarter: Y3Q1
created: 2024-03-11 02:55
updated: Monday 11th March 2024 02:55:07
course: CS 162
📕 courses:
parent: CS 162

title: 14 - Syntactic Parsing

layout: note

---
## Syntactic Parsing
- syntax is the characteristics of words and interdependent relations that help w interpretation
- we parse as a tree from sentence (bottom) up ![[Pasted image 20240311030030.png]]
- nonterminal rules: a rule that decomposes to other rules: 
	- ![[Pasted image 20240311025945.png]]
- terminal rules: rules that decompose to a word/token:
	- ![[Pasted image 20240311030008.png]]
- natural language has lots of overloading/ambiguity and grammar isn't known in advance
- evaluation also requires true parsed outputs
### Evaluation
- decompose true to labeled constituents (only given rules, POS tags not considered - but usually labeled regardless)
- calculate balanced precision and recall (f-measure)
- green is predicted, orange is true (predicted as a tuple of the nonterminal and (continuous) span of the nonterminal rule): ![[Pasted image 20240311030545.png]]
#### F1, Precision, Recall - PROCESS
![[Pasted image 20240311030735.png]]
![[Pasted image 20240311030833.png]]
### Parsing
#### Grammar Rules
- the set of nonterminal and terminal rules given by natural language
- also the span of each token
![[Pasted image 20240311031025.png]]
#### Process
![[Pasted image 20240311031412.png]]
the next pass, we look over all constituents of all previous passes and check if any start with the end of any current constituent![[Pasted image 20240311031543.png]]
- complete/optimal but inefficient
### Optimization
- tabulate in a chart of the sentence span
- original algo: ![[Pasted image 20240311031937.png]]
- iterative deepening of width, build with width-1, then width-2, (done by iterating over diagonals, remember constituent spans must be continuous) etc. ![[Pasted image 20240311032029.png]]
	- width-1 is diagonal
	- width-2: ![[Pasted image 20240311032217.png]]
	- width-4: ![[Pasted image 20240311032230.png]]
- to find a width-N constituent given all lower N constituents, we consider the possible N length spans and check which follow a grammar rule: ![[Pasted image 20240311032415.png]]

## CKY Algo (Recognizer)
- an algo to check if a sentence is parseable i.e., if a parse tree exists for the sentence
![[Pasted image 20240311032532.png]]
- given the grammar rules, the tabular representation of spans, and the sentence, we determine constituents of length N as diagonals of the table: ![[Pasted image 20240311032721.png]]
- Psuedocode: ![[Pasted image 20240311032750.png]]
### Analysis of Algo
- $O(n^3)$ but tree grows exponentially with sentence/context window length
- reasonably efficient (poly)
- requires Chomsky Normal Form (nonterminal and terminal rules of 1 level order only, i.e., what we have above)
- this CKY can check grammar
- but also generate entire forest with all ambiguity
- we can analyze ambiguity by counting trees in forest generated
## CKY Parser (Probabilistic)
- to mitigate ambiguity (due to same POS) like so: ![[Pasted image 20240311034257.png]]
- many possible parses but some much more probable than others
- assign a weight to each rule, select **lowest weight** (NOTE we use neg. log-prob so lowest is highest prob) s.t. tree's weight is total weight of all its rules
### Process
- initialize w/ width-1 along diagonal, grammar rules with weights (We want lowest), and sentence with spans: ![[Pasted image 20240311034603.png]]
- then run IDS and when ambiguity occurs, select lowest weight rule that works for that N-length constituent
- the weight of each constituent is the sub-constituent weights plus the rule weight (red from blue and purple):![[Pasted image 20240311034819.png]]
- then, from root, follow backpointers of lowest weight: 
	- ![[Pasted image 20240311035026.png]]
	- ![[Pasted image 20240311035033.png]]
- cull the inferior constituents that we dont need in each span: ![[Pasted image 20240311035117.png]]
### Variations
- keep track of total probs of all possible parses of a sentence (Inside algo)
- track all possible parses and their probs
### Training
- count and divide
- featurized training
### Penn Treebank
- databse of grammar rules that we use as terminal and nonterminal rules for our parsers
- eval f1 score on trees
- train using span splits
### Count and Divide CKY Probs
- the true probability of the tree given the sentence, we use the probability chain rule: $$\frac{c(\text{entire left subtree})}{c(\text{right subtree})}$$
	- ![[Pasted image 20240321125443.png]]
- but to estimate, we make the independence assumption that subtrees are independent of other subtrees given their immediate parent and apply backoff $$\frac{c(\text{partial left subtree})}{c(\text{right subtree})}$$![[Pasted image 20240321130223.png]]
	- ![[Pasted image 20240321125813.png]]

## Dependency Parsing
- constituent view of syntax (CKY) does not consider discontinuous information or POS tags
- constituent view als oloses lexically grounded selection preference, we instead may need to create many rules (propagating heads) depending on how the sentence should be interpreted
	- ![[Pasted image 20240321131533.png]]
- this can introduce too much information downstream making probs low and hard to learn
- instead we can remove lexical tags and redundant term to derive dependency tree in-line ![[Pasted image 20240321131745.png]]
### Dependency View of Syntax
- no explicit phrase structure
- features how words relate to each other instead of syntactic phrase only
- + closer alignment bw analysis of structure of diff langs
- + natural modeling of discontinuous words
- + lexically grounded relationships
- - loss of expressivity (cant go back to constituency tree from dependency)
- - requires definition of head
- may be good to assign labeled edges in dependency tree ![[Pasted image 20240321132600.png]]
- similar to PTB, other treebanks made for depenndency trees: Prague, Universal
- issue is determining head to start with, so we split into functional and content heads and usually start with content heads as root
### Projectivity
- a dependency tree is projective if every subtree occupies contiguous span and does not cross other subtrees ![[Pasted image 20240321134653.png]]
- non-projective is not as common in english lang ![[Pasted image 20240321134707.png]]
### Parsing Approaches
- constituency and project
	- build CKY parser then project down to dependency
	- but does not handle non-projective situations
- graph based
	- Chiu-Liu Edmonds
	- find MST of the possible graphs of the sentence
	- quadratic time
- transition based
	- lienar time
	- approx solution
	- doesnt handle non-projective tho
### Shift Reduce Parsing
- keep a stack of words and work at the top of the stack
- have 3 ops
	- Shift - add a word to stack
	- Reduce-left - link top 2 stack elements, direction left, and pop both -> link both -> push the HEAD on top
	- Reduce-right - same as above but right direction
#### Inference
- e.g., given the ground truth tree (we know we want to root at book) ![[Pasted image 20240321135521.png]]
- we end up with this parsing procedure ![[Pasted image 20240321135946.png]]
- we only reduce-right (RR) AFTER all subtrees of the possible child word have been linked (i.e. all RL for the word have been done) ![[Pasted image 20240321140135.png]]
#### Training
- Input is sentence -> output is decision of OP (S,RR,RL), using a deterministic algo ![[Pasted image 20240321153630.png]]
- Thus, we train probs $P(\text{action}|\text{state})$ using featurized learning (the stack, the buffer, the extracted links <- and the most immediate versions of these (adjacent neighbors), choosing bw word or POS tag) ![[Pasted image 20240321154153.png]]
#### Beam Decoding to prevent bad Greedy
- choose top k (Accumulating cost) at each step ![[Pasted image 20240321154810.png]]