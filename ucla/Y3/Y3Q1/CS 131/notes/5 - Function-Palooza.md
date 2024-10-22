---
area: ucla
quarter: Y3Q1
created: 2023-11-13 00:14
updated: Monday 13th November 2023 00:14:15
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
parent: CS 131

title: 5 - Function-Palooza

layout: note

---
## Parameter Passing
- terminology of params/args when defined vs. called
	- ![[Pasted image 20231113144842.png]]
	- 
- 3 main types of parameter passing semantics - akin to value binding semantics
- ![[Pasted image 20231113151243.png]]
### Pass by Value (Copy)
- the passed value i evaluated to get a value (complete deepcopy) that it uses
- nothing about the original args is changed
- ![[Pasted image 20231113150314.png]]

### Pass by Reference (Address)
- secretly passes the address of the args
- thus ANY changes to the passed params WILL reflect on the original args
- ![[Pasted image 20231113150513.png]]
### Pass by Object Reference (Pointers)
- all passed args are passed with pointers
- thus modifying the formal parameter (using its mutator) -> modifies the pointed-to object
- BUT, reassignment just reassigns the pointer not the passed arg, UNLESS we dereference the pointer
	- ![[Pasted image 20231113151135.png]]
- ![[Pasted image 20231113150832.png]]

### Pass by Need (Name)
- lazy evaluation, same as name binding semantics
- used in haskell, for ex.
- saves a blank value that refers to the expression that will be evaluated when necessary
### Aliasing
- when two params refer to the same object in references/objet references
- ![[Pasted image 20231113151355.png]]

### Determine Parameter Passing Semantics
![[Pasted image 20231113151625.png]]
### Positional, Named, Default, Optional Parameters
- default params must be declared as formal parameters after all positional to prevent aliasing
- you can pass args positionally or named
- ![[Pasted image 20231113151814.png]]
#### Variadics: Args and Kwargs
- optional params, you can pass as many as you want
	- ![[Pasted image 20231113151959.png]]
	- ![[Pasted image 20231113152013.png]]
- `*args` = any number of unnamed args
- `**kwargs` = any number of keyword (named) args

## Returning Results and Handling Errors
- ![[Pasted image 20231113140229.png]]
- ![[Pasted image 20231113140258.png]]
### Error Objects
- Recoverable errors and results
- lang-specific objects to explicitly return an error
- error classes are usually provided by the lang
- ![[Pasted image 20231113140555.png]]
- some langs return values along with an error
	- ![[Pasted image 20231113140645.png]]

### Result and Optional Objects
- Recoverable errors and results
- only difference is what is returned in an error
- result object - returns full error details with an error object
- optional object - returns some arbitrary comment on a failure
- ![[Pasted image 20231113140801.png]]
#### Result Objects
- creates return objects for each case: success, failure
- use pattern matching to get the right value
- ![[Pasted image 20231113141054.png]]
#### Optional Objects
- ![[Pasted image 20231113141350.png]]

### Assertions: Pre/Post Conditions and Invariants
- Used for Bugs and Unrecoverable errors
- we use an assertion to assert/verify the following
- ![[Pasted image 20231113141617.png]]
#### Assertions: Pre/Post Conditions
- assertions will immediately terminate the program if the assertion is not met
	- ![[Pasted image 20231113141652.png]]
- pre/post conditions are sometimes set explicitly, e.g., Eiffel lang
	- ![[Pasted image 20231113141752.png]]
	- 
#### Assertions: Invariants
- used in the body of the function to ensure conditions during execution are met
- ![[Pasted image 20231113142025.png]]

#### When to use assertions?
- impossible to use for every op
- use at a functional level like the previous stack example
- use when something may go very wrong: undefined behavior, unintended consequences
### Exception Handling
- Bugs, Unrecoverable errors, and Recoverable errors
- other error handling is used directly in the code -> makes flow hard to read
- exception handling separates error handling from the body of func
- uses a catcher and thrower
- if at any time an op in the try block causes an error -> immediately catch the error and deal with it
- the thrower will take the return -> and throw if there is a failure
- ![[Pasted image 20231113142738.png]]
#### Exception Handling Flow
- ![[Pasted image 20231113142956.png]]
- exceptions can catch through nested function calls
	- this can cause issues since local vars are out of scope if a block ends -> memory leaks
		- must use smart pointers in C/C++
		- or must define whether or not a lang throws an error like Java
	- ![[Pasted image 20231113143432.png]]
	- ![[Pasted image 20231113143449.png]]
- can be used to catch specific errors
	- ![[Pasted image 20231113143605.png]]
- if there is no compatible catch when an error is thrown -> prog terminates
- this is equivalent to a "panic."
- to handle issues with open connections, etc. sometimes, langs have a `finally` block that always runs regardless of a catch
	- finally will always run so returns in the try block can be overwritten
		- ![[Pasted image 20231113144059.png]]
	- ![[Pasted image 20231113143909.png]]
#### What is an exception
- an object with one or more fields to describe an exceptional situation
- but you can subclass exceptions to make your own
- ![[Pasted image 20231113143309.png]]

#### Guidelines: Exception Guarantees
- ![[Pasted image 20231113144650.png]]
### Panics
- Bugs and Unrecoverable errors
- aborts execution due to an exceptional situation
- basically an exception which is never caught -> returns description and stack trace
### Error Handling Best Practices
- ![[Pasted image 20231113152802.png]]

## First class functions
- first-class functions - can be passed as params and returned, vars can be assigned to funcs, funcs can be stored in data structures, can be compared and expressed anonymously
- second class funcs - funcs caan be paassed as args but not assigned to vars or returned
- third class funcs - can be called, thats it
- Examples
	- C++ - first class w/ function pointers
		- ![[Pasted image 20231115141433.png]]
	- Go - first class except equality
		- ![[Pasted image 20231115141454.png]]
	- Python - fully first class
		- ![[Pasted image 20231115141519.png]]
### Lambdas
- C++ - captured free variables are left unchanged outside lambdas
- C++ - must define free vars, or make them capture all or none
	- ![[Pasted image 20231115141726.png]]
- Lambdas can be unpure - cause external effects, e.g. event handlers
	- ![[Pasted image 20231115142139.png]]
- Examples
	- ![[Pasted image 20231115142639.png]]

## Polymorphism
![[Pasted image 20231115144057.png]]
### Subtype Polymorphism
- What we are used to
### Ad-Hoc Polymorphism
- only for statically typed langs to differentiate
- dynamically typed langs cannot know what to call bc types are determined at run time
	- instead check types within the single function bc of duck typing
- ![[Pasted image 20231115144232.png]]

### Parametric Polymorphism
- define single parametrized version that can operate on multiple types that are decided at usage/implementation
- C++ - one of the few langs that uses templated types to implement parametrization, most others use generic types
- Examples and usage
	- ![[Pasted image 20231115144521.png]]
	- ![[Pasted image 20231115144402.png]]
#### Templates
- the compiler creates new concrete functions for each templated type used
	- ![[Pasted image 20231115144651.png]]
- the compiler will check compatibility during compile time when recreating a type-specific function for each templated class
	- ![[Pasted image 20231115145052.png]]
#### Macros
- used in C before templates in C++
- ![[Pasted image 20231115150226.png]]
#### Generics (Unbounded)
- looks very similar to templates, BUT the code inside generics must be type agnostics
- thus all operations must be applicable to all classes/types
- thus no calling `.sleep()` or something like that
- BUT type checking is still done at parametrization (usage)
- ![[Pasted image 20231115150621.png]]
- ![[Pasted image 20231115150634.png]]
#### Bounded Generics (Generic with types constrained)
- we can bind a generic to operate on specific types:
	- ![[Pasted image 20231115151244.png]]
- And we can create bounded classes
	- ![[Pasted image 20231115151403.png]]
- and use parametrized polymorphic functions on these bounded classes
	- ![[Pasted image 20231115151432.png]]
	- 
- generics allow use to have type safety and ensure we use the generic type instead of using some other super high-level supertype object that would allow any types to be used
#### Specialization
- Ad-hoc polymorphism by creating a type-specific function for a templated function to make the function more optimal for a specific type
- ![[Pasted image 20231115154858.png]]
- the dedicated version (top) is used instead of generic/templated (bottom) WHEN `bool` is passed in