---
title: 07 - Code Generation
area: ucla
created: 2024-26-20
course: CS 130
parent: CS 130
layout: note
---
## Model Driven Development
- **forward engineering** - model to code gen
- **backward engineering** - code to model gen
- Model based dev/engineering ![[Pasted image 20241120173130.png]]
	- **MBE**: Model Based Engineering (to analyze systems)
	- **MDE**: Model Driven Engineering (to automate engineering activities)
	- **MDD**: Model Driven Development (to automate software development)
	- **MDA**: Model Driven Architecture (to practice MDD with the OMG-ObjectManagementGroup standards)
### Abstraction
- models are abstractions of sw before dev and can be used to automate dev
- model is abstracted using generic modeling language like UML or domain specific (DSL)
- models can be transformed to code automatically using a concrete model ![[Pasted image 20241120173426.png]]
### Pro v Con
- Pros
	- productivity - multiple uses of the same model
	- simplification - SoT is model not code -> easier to analyze
	- portability - same model can be used for diff langs/os/frameworks
	- consistency - gen code is more conistent
- Cons
	- Maintenance - must develop and maintain code generator
	- Complexity - generated code may be less optimal and more complex than MVP

## Code Generators
- code gen arch ![[Pasted image 20241120173958.png]]
- Developing a code gen
	- develop modeling language for application domain - syntax, api language, validation
	- develop code gen template using modeling language api
	- develop application model using modeling language and run through template to generate application code
### Modeling Language/Framework
- lang defined using modeling framework ![[Pasted image 20241120174227.png]]
- **abstract syntax** - defined with class diag (metamodel)
- **concrete syntax** - defined with textual/visual grammar
- e.g., Xtext is a FOSS Java framework for defining textual modeling languages
- e.g., Statemachine lang ![[Pasted image 20241120174344.png]]
### Xtext
- xtext generates a Java API corresponding to the class diagram of the grammar
- xtext also generates a validator java class for the lang - each rule is decorated with `@check` with a parameter of the las type ![[Pasted image 20241120175706.png]]
- ![[Pasted image 20241120175357.png]]
- ![[Pasted image 20241120175418.png]]
- ![[Pasted image 20241120175429.png]]
- ![[Pasted image 20241120175440.png]]
- ![[Pasted image 20241120175450.png]]
- 