---
area: ucla
quarter: Y3Q1
created: 2023-10-25 14:39
updated: Wednesday 25th October 2023 14:39:13
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
parent: CS 131

title: 4 - Datapalooza

layout: note

---
## Variable vs. Value
![[Pasted image 20231025144421.png]]
### What's in a variable
![[Pasted image 20231025144441.png]]
### What's in a value
![[Pasted image 20231025144542.png]]

## Types
- categorizes data, defines the size, encoding, operations, and casts i.e. how it's handled
- it is not necessary that all variables in a typed language (like Python, C, etc.) have types
	- in fact, no variables in Python have types
	- OTOH in Haskell, even though variables are dynamically typed, bc they are immutable, when they are bound, they are given fixed types
- i.e. a var is a type if it is perpetually bound to a type of value
### Primitives
![[Pasted image 20231025151041.png]]
- enum - an enumrated type with a set of possible values
- ![[Pasted image 20231025151150.png]]
### Composites
![[Pasted image 20231025151224.png]]
- unions - can hold one of a few defined types
	- ![[Pasted image 20231025151321.png]]
### Other Types
- generic types - templated or type parameters
	- ![[Pasted image 20231025151432.png]]
- function types - functions stored as vars
- boxed types (mutable primitive) - an obj whose only value is a primitive
	- ![[Pasted image 20231025151522.png]]
- user-defined types: the value the class defines (not the class itself), the value the struct defines, the value the enum defines
	- interface - list function that should be implemented (but not actual implementation) defines a new type
	- ![[Pasted image 20231025151815.png]]
### Value Types vs Reference Types
- ![[Pasted image 20231025152125.png]]
	- ![[Pasted image 20231025152152.png]]
	- ![[Pasted image 20231025152203.png]]

## Type Checking
### Strong vs Weak
- comparison
	- ![[Pasted image 20231025153023.png]]
#### Strong
- guarantees operations invoked on **appropriate** types (doesn't have to be the same types)
- guarantees no undefined behavior due to **type-related** issues: type and memory safe
	- ![[Pasted image 20231030151215.png]]
- strong type checking
	- ![[Pasted image 20231030151322.png]]
- ensures memory-safeness because it needs to check the type of the undefined pointer or array out of bounds to validate operations
	- C/C++ are not strongly typed - they have undefined behavior for dangling pointers and out-of-bounds access
- Casting - uses checked casting to ensure casting to different values is ensured
	- ![[Pasted image 20231030152212.png]]
- pros vs cons
	- ![[Pasted image 20231030152723.png]]

#### Weak
- may cause undefined behavior due to type-related operations
	- ![[Pasted image 20231030153040.png]]
- weak languages allow unchecked casts -> possible undefined behavior
	- ![[Pasted image 20231030153313.png]]
- 
### Static vs Dynamic
- static, dynamic, also gradual and hybrid typing, covered later
	![[Pasted image 20231025153131.png]]
#### Static
- even if the type is inferred, the value has a determined static non-mutable type, so it will check that all the params match the types specified
	- ![[Pasted image 20231025153758.png]]
- for static typing, the var must have a fixed immutable type
	- ![[Pasted image 20231025154144.png]]
	- constraint satisfaction
		- ![[Pasted image 20231025154408.png]]
- Examples
	- ![[Pasted image 20231025154748.png]]
- Because static typing may need to infer, it is **conservative** and may prevent technically correct code from running if there is ambiguity in the types
	- ![[Pasted image 20231025155004.png]]
	- in the above, bite/scratch will only call for dog or scratch, but the fact that mammal has no bite/scratch will say it is not the correct type (at compile type)
- pros and cons
	- ![[Pasted image 20231030143311.png]]
#### Dynamic
- types are associated with a **value**, not a variable; a variable is just a named binding
- uses secret type tags that are associated when a value is defined
- safety of operations is checked at run-time
- static may use dynamic during **down-casting**
	- down casting - casting a superclass to a subclass (e.g. person -> student)
- pros and cons
	- ![[Pasted image 20231030144348.png]]
	- 
- must support ducktyping
	- ![[Pasted image 20231030144547.png]]
	- iff it quacks, then it s a duck (not tat only ducks can quack, so all functions can use all functions and is only checked at run time)
- supporting operations
	- iterable
		- ![[Pasted image 20231030144744.png]]
	- printable
		- ![[Pasted image 20231030144956.png]]
	- equality
		- ![[Pasted image 20231030145014.png]]
#### Gradual Typing
- some variables may be given explicit types while others are untyped
- type checking occurs partly before execution and partly during runtime
- gradual vs static vs dynamic
	- ![[Pasted image 20231030145336.png]]
- ![[Pasted image 20231030145416.png]]
### Language Examples
![[Pasted image 20231025153158.png]]

### Type Conversion and Casts
- casting vs conversion
	- conversion creates a new object with the converted value
	- casting just treats the value as the new type without creating a new object
	- ![[Pasted image 20231101140841.png]]
- implicit vs explicit cast/conversion
	- whether you need to explicitly write an expression to cast to a new class
	- ![[Pasted image 20231101141323.png]]
	-  upcast vs downcast
		- upcast casts to the superclass e.g., Nerd -> Person
		- upcasts may be implicit
		- downcast is super to subclass e.g. Animal -> Mammal
		- downcasts must be explicit
	- explicit casting tells the compiler to allow a compiler error to become a runtime check
		- e.g., if we didn't expollicitly cast the student to professor, do_your_thing would run a give_a_lec which would be undefined error since studnets cant give lectures
		- but explicit casting will check to throw an error if its not possible instead of proceeding
		- ![[Pasted image 20231101142132.png]]
#### Conversions
- coercions and promotions
	- coercions and promotions are **implicit conversions** ONLY -> allows for operations even if types are not the same
		- ![[Pasted image 20231101142531.png]]
	- type promotions are conversions from a narrow type like `int` to `float` which s a wider type bc it can hold more possible values
- widening vs narrowing conversions
	- conversions can be narrowing or widening - narrowing or widening the range of possible values
		- ints are narrower than doubles
	- widening conversions are "value-preserving" since the values are guaranteed to be representable in the new conversion
	- narrowing is from wider to narrower OR if the range of values does not perfectly overlap e.g. float -> int AND int->float are narrowing conversions and they not perfectly value-preserving in general 
#### Casts
- widening vs narrowing casts
	- upcasts are widening conversions and downcasts are narrowing
	- because upcasts are guaranteed to work, they are always implicitly cast
	- downcasts are always explicit since they are not always safe

## Scoping
- a variable is in scope if it can be explicitly referenced in that region of code
- a var may be alive but still out of scope
- scoping is associated with the name of the variable, so scoping checks for values bound to specific names
- the variable name that is currently in scope is actively bound to its name; anything else is inactively bound
- the list of actively bound variables is collectively the lexical environment
	- ![[Pasted image 20231101150903.png]]
### Lifetimes
- variable lifetimes
	- ![[Pasted image 20231101151414.png]]
- value lifetimes
	- ![[Pasted image 20231101151457.png]]
	  
	- 
- static lifetimes - variable/value exists till end of calling function, not just the function enclosing block
	- ![[Pasted image 20231101153218.png]]
### Lexical Scoping
- the usual scoping structure: sequentially nested
- ![[Pasted image 20231101151650.png]]
	- ![[Pasted image 20231101151738.png]]
- Python LEGB
	- ![[Pasted image 20231101151817.png]]
- ![[Pasted image 20231101152102.png]]
- ![[Pasted image 20231101152113.png]]
### Dynamic Scoping
- check-in current blocks, then in the enclosing block
- then searches the calling function and recursively backward until the main
- then the global scope
- If it is not found anywhere after checking the calling function, then no such variable
- FOR PROJ2: consider passing available variables as parameters to the function
## Memory Safety
- memory safety refers to whether or not the language allows for behavior that may cause undefined behavior
	- ![[Pasted image 20231101153731.png]]
- Examples of memory-unsafe operations/langs
	- ![[Pasted image 20231101153857.png]]
- Memory leaks are not necessarily memory-unsafe ONLY if it allows undefined behavior
	- languages may run out of memory or not have garbage collection that leaves memory leaks -> but is still memory safe from an operations viewpoint
- Example of memory-safe langs/ops
	- ![[Pasted image 20231101154025.png]]
- Memory management methods
	- ![[Pasted image 20231101154212.png]]
## Garbage Collection
- automated reclamation of heap allocated memory with no binding/reference
	- ![[Pasted image 20231101154322.png]]
- a good rule is to garbage collect after each removal of reference (dangling)
	- ![[Pasted image 20231101154950.png]]
- approaches
	- ![[Pasted image 20231101155000.png]]
### Unpredictability of GC
- impossible to predict when and if a given object will be freed
- determined by "memory pressure" -> sps you create files on disk -> no pressure on RAM -> no GC -> disk fills up before GC
### Mark and Sweep Method
- two phases: Mark & Sweep
	- ![[Pasted image 20231112232053.png]]
#### Mark Phase
- goal: to discover all active objects
- consider an object in-use if 1 of 2 criteria:
	- ![[Pasted image 20231112232248.png]]
- ![[Pasted image 20231112232309.png]]
#### Sweep Phase
- traverse all memory blocks in the heap
- check in-use flag -> purge & reset in use flags after we pass an active object
- purging/coalescing free space -> memory fragmentation -> no consecutive space to allocate new objects
- ![[Pasted image 20231112232532.png]]

### Mark and Compact Method
- to mitigate memory fragmentation of mark and sweep
- mark phase is performed normally -> BUT no sweep
- collect all marked objects and move/compact to new contiguous block of memory
- then readjust pointers
- original block of allocated memory is now freed and can be used like normal
- cycle back and forth the locations of compacted data to ensure free space -> when we can no longer it means we are out of memory

### Reference Counting Method
- every obj has a hidden count to track num references to it
- when ref count reaches 0, obj is deleted -> all objects transitively referenced by deleted obj must also be deleted e.g., properties of class obj
- to make this more efficient -> add ref_count = 0 objects to a list of pending to be destroyed -> destroy regularly over time
- can lead to memory fragmentation

### Object End of Life
- objs may hold resources which need to be cleared
- ![[Pasted image 20231112234516.png]]
#### Destructors
- only in manual memory managed langs - C/C++
- deterministic rules for running
- programmer can determine when to release critical resources, close connections, delete files
- ![[Pasted image 20231112234703.png]]

#### Finalizers
- in GC langs, used to release unmanaged resources like connections, files when memory is reclaimed
- finalizer is not deterministic and may not even run
- last line of defense, may not even be used -> programmer should manually free unmanaged resources
- ![[Pasted image 20231112234839.png]]

#### Disposal Methods
- a func the programmer manually calls to free non memory resources
- used in GC langs bc finalizers are unpredictable
- guarantees release of unmanaged resources -> just dont forget to run
- ![[Pasted image 20231112235027.png]]

## Mutability
- immutability is a property of a var/val/obj to make it read only
- instead of modifying we reconstruct a new obj
- immutability from lang features not hardware level walls
- can eliminate bugs, speed up GC, etc.
### Immutability
- 4 approaches
- ![[Pasted image 20231112235530.png]]

## Variable Binding Semantics
- binding semantics - ways langs associate var names with actual storage in RAM
- some langs directly associate, other use references with pointers
- ![[Pasted image 20231112235748.png]]
### Value Semantics
- each name directly bound to the storage of the var
- var's storage on the stack
- ![[Pasted image 20231112235917.png]]
### Reference Semantics
- assign an alias name to an existing var and r/w through alias
- alias is directly bound to var's storage
- hides its use of pointers
- ![[Pasted image 20231113000031.png]]
### Object Reference Semantics
- var name is bound to pointer value that points to object value
- pointers are explicit and can be changed themselves -> assignment changes what the var points to not the value itself
- some langs like Java use diff semantics for primitives and object reference for user defined
- ![[Pasted image 20231113000214.png]]
- ![[Pasted image 20231113000245.png]]
#### Equality
- Object identity - do 2 object references refer to the same object at the same address: ids
- Object equality - do 2 obj refs refer to objs with equiv values (Even if at diff places in RAM)
- ![[Pasted image 20231113000449.png]]

#### Explicit pointer syntax
- usage of `*` and `&` can be used to manually change pointer and pointed values
- pointers are explicitly defined object references
- ![[Pasted image 20231113000649.png]]

### Name Semantics
- bind var names to an expr graph -> eval graph -> final value of var
- expr graph is lazily evaluated when needed
- ![[Pasted image 20231113000815.png]]
- ![[Pasted image 20231113000949.png]]
#### Need Semantics
- very similar to name semantics, but lang memoizes (caches) result of expr evaluation to elim unnecessary computations
- ![[Pasted image 20231113001141.png]]