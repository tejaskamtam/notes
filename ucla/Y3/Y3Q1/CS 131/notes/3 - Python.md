---
area: ucla
quarter: Y3Q1
created: 2023-10-18 14:41
updated: Wednesday 18th October 2023 14:41:35
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
parent: CS 131

title: 3 - Python

layout: note

---
## Variables
- only makes `__name__` var when `main()` present to call `__name__==__main__`
- variables have scope within functions, not within conditional blocks
- double underscore to make member functions private
- ALL data is object references, and all of it is stored in a heap - inefficient
	- data on the heap is immutable, instead, it creates a new object and references that and garbage collects the old
	- ![[Pasted image 20231018153346.png]]
- data allocation size is managed by a dictionary that determines the size 
## Classes
- class variables/objects (non self, just defined at the top of the class) are accessible by all objects of that class
	- ![[Pasted image 20231018153408.png]]
- class methods have no `self` param and cannot access class member variables
	-  ![[Pasted image 20231018154201.png]]
## Copying
- copying is by default soft copy and creates object references
	- ![[Pasted image 20231018154935.png]]
- use `copy.deepcopy` does a recursive, depth-first copy of the actual object, not just the reference
	- ![[Pasted image 20231023140753.png]]
- shallow copy (`copy.copy`) only copies the top level object (not recursive) i.e. in the example the pointers in thee array point to the same values as the other array
	- ![[Pasted image 20231023141100.png]]
	- 
## Garbage collection
- garbage collection is automatic
- destructor defined using `__del__` but not guaranteed to run and rarely used
- finalizer runs before the garbage collector to finalize anything with that object, then garbage collects i.e. destructor but is being phased out
- instead, define your own disposal method to dispose
## Inheritance
- ![[Pasted image 20231023142816.png]]

## Objects
### Object Equality
- ![[Pasted image 20231023143727.png]]
### Object IDs
- ![[Pasted image 20231023143954.png]]

### None
- acts like a `nullptr`
- ![[Pasted image 20231023145350.png]]

### Strings
- Strings are immutable, just like all other objects
- treated as a list of chars, so use list indexing to access substrings
### Lists - MIDTERM
- lists ARE mutable
- ![[Pasted image 20231023151127.png]]
- `a.append(b)` == `a+=b` != `a = a+b`
- List implementation: array of object references
	- ![[Pasted image 20231023151810.png]]

### Tuples
- immutable ordered groups
- ![[Pasted image 20231023152655.png]]
### Sets
- Stores a single unique copy
- not ordered alphabetically
- implemented using hash tables
- ![[Pasted image 20231023153049.png]]
- sets have simple, built in set operations
	- ![[Pasted image 20231023153207.png]]

## Parameter Passing
- by object reference
- ![[Pasted image 20231025140659.png]]

## Error Handling
- called exceptions
- python provides a stack traceback to track where the error came from
- use try/except block to handle exceptions
- you can except for all or per error or as some variable `e`
	- ![[Pasted image 20231025140945.png]]
```py
try:
	# some code
except Exeption as e:
	print("There was a",e)
```
## Multi-Threading
- Python starts the first thread and it gains exclusive access to the objects
- ![[Pasted image 20231025141617.png]]
- instead, Python has a GIL (Global Interpreter Lock) i.e., a mutex (lock), so each thread releases the GIL when its done with it access
- instead, multi-threading is for non-computational, e.g. I/O (Reading/writing from disk) and libraries where they are written in C/C++

## Comprehensions
![[Pasted image 20231025142739.png]]
### Lambdas
![[Pasted image 20231025142947.png]]