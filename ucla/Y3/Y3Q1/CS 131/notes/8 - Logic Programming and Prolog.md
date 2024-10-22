---
area: ucla
quarter: Y3Q1
created: 2023-12-06 12:09
updated: Wednesday 6th December 2023 12:09:33
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
parent: CS 131

title: 8 - Logic Programming and Prolog

layout: note

---
## Logic Programming
- structure
	- ![[Pasted image 20231206121005.png]]
- declarative queries on facts and rules
	- ![[Pasted image 20231206121031.png]]
- Prolog is the most popular logic lang, offshoots are very similar

## Prolog
- when given a query, prolog finds a chain of connections bw query, facts and rules
	- ![[Pasted image 20231206121208.png]]
	- 
### Facts
- declarative statement about the world
- the relationship/fact is a `functor` (red), the operands are the objects the functor operates on and are called `atoms` (purple)
	- we can specify order of facts/rules ![[Pasted image 20231206121423.png]]
- functors and atoms must be all lower case and are static assertions not function calls
- facts can be nested deeply
	- ![[Pasted image 20231206121548.png]]

### Rules
- lets us define a new fact in terms of other existing facts or rules
- rules have a `head` (green) and `body` (red)
	- ![[Pasted image 20231206121749.png]]
- a comma separating a rule's body represents a logical `AND` (union)
- we can define more complex rules using known facts with logical ands and `variables` (blue, capitalized) which are used as placeholders for atoms
	- ![[Pasted image 20231206122045.png]]
- recursive rules using pattern matching
	- ![[Pasted image 20231206122235.png]]
	- beware infinite looping
- closed world assumption (CWA) - prolog evaluates true queries iff they are true, else false (not unknown)
#### Negation
- CWA - ![[Pasted image 20231206123432.png]]
### Queries
- either T/F queries or fill in the blanks queries, the query atom is represented by a variable (capital)
	- ![[Pasted image 20231206123803.png]]
- resolution is the process of evaluating a query
### Resolution
- occurs top down with each fact and rule
	- ![[Pasted image 20231207012738.png]]
- when prolog finds a matching it makes an association of the variable in the query to the matched fact/rule and continues until no more true matchings and backtracks
	- ![[Pasted image 20231206124039.png]]
	- ![[Pasted image 20231206124110.png]]
- E.g., true/false query
	- ![[Pasted image 20231206131813.png]]
- E.g., true query for multiple values
	- ![[Pasted image 20231206131934.png]]
### Unification
- the step of resolution that matches a single goal and a single fact/rule
	- ![[Pasted image 20231206132202.png]] 
- thus resolution performs many unifications
#### Matching facts/rules to goals
- matching a rule/fact to a goal works using a tree
	- ![[Pasted image 20231206132528.png]]
- the rules of matching are the following:
	- the numebr of children is called the functor's `arity`![[Pasted image 20231206132633.png]]

### Lists
- prolog lists can contain numbers, atoms, or other lists
- processing using both pattern matching and unification to process lists -> done with facts and rules
- sps a rule of vars: `is_same(X,X)`
	- querying `is_same(lit,lit) -> true`
	- querying `is_same(ucla,usc) -> false`
- list pattern matching `[X|XS]` is same as haskell's `(x:xs)`
	- e.g., `is_head(X,[X|XS])` true if X matches X as the first item in the list
	- so `is_head(lit,[lit,dank,snack]) -> true`
- list pattern `[X,Y|XS]` is equiv to `(x:y:xs)`
	- e.g. `is_sec(Y,[X,Y|XS])` true if Y is second item
#### Recursive rules in list pattern matching
- checking elem of list ![[Pasted image 20231207120933.png]]
- modifying lists, e.g. deleting from a list can be used in many ways
	- ![[Pasted image 20231207121404.png]]
	- how it works: ![[Pasted image 20231207121649.png]]
		- ![[Pasted image 20231207121701.png]]
		- 
- built in facts/rules on lists
	- ![[Pasted image 20231207121920.png]]
#### List pattern matching is syntactic sugar
- ![[Pasted image 20231207122504.png]]