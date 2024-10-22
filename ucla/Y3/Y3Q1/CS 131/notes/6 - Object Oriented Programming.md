---
area: ucla
quarter: Y3Q1
created: 2023-11-20 22:44
updated: Monday 20th November 2023 22:44:01
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
parent: CS 131

title: 6 - Object Oriented Programming

layout: note

---
## OOP Overview
- ![[Pasted image 20231212201223.png]]
### History
- `Record` was the first idea of the object-oriented paradigm
- The `Simula` lang implemented classes and objects with data and funcs, instantiation into objects, dot notation, inheritance, virtual operations, polymorphism/dynamic dispatch
- `Smalltalk` implemented a variation for more imperative langs where everything is an object like python
- `Java` had a crazy popularity and rose to prominence where it introduced bytecode compoilation and created specific JVM (interpreters) for each device it woudl run on instead of C/C++'s bare metal implementations
## Classes, Objects, Interfaces, Encapsulation
### Classes
- Interfaces (public methods), fields (member variables), private methods/fields, method implementations
- e.g. swift and Golang class implementation
	- ![[Pasted image 20231212201831.png]]
	- ![[Pasted image 20231212201905.png]]
### Objects
- a distinct value often from a class blueprint that contains its own copy of fields and methods
	- ![[Pasted image 20231212202003.png]]
- notr all langs have classes, e.g. JS only has objects in a record/struct like format
	- ![[Pasted image 20231212202048.png]]
- in some langs you can even dynamically add methods/fields to classes/objects
	- ![[Pasted image 20231212202228.png]]

### Encapsulation and Access Modifiers
#### Encapsulation
- ![[Pasted image 20231212202755.png]]
- ![[Pasted image 20231212202812.png]]
#### Access Modifiers
- determine the visibility of methods and fields to external code (including from inherited classes)
	- ![[Pasted image 20231212203008.png]]
- e.g., access in C++ and python
	- ![[Pasted image 20231212203032.png]]
	- ![[Pasted image 20231212203223.png]]
- best practices:
	- hide all member fields, consts, and helpers to private
	- hide all implementation from other classes
	- create general getter and setters for better use with inherited classes
	- completely initialize objects in the initializer
### This and Self
- a special parameter (sometimes explicitly required in the formal parameters of member functions e.g., python) that points to the object the function is operating on
- this becomes much more important when inheritance is introduced
- an example with C++ and Python
	- ![[Pasted image 20231212204911.png]]
- the keywords are also syntactic sugar because the object is actually passing the object reference as another parameter to the class' function call and is usually only used to distinguish bw member fields and formal params
	- ![[Pasted image 20231212205124.png]]
### Properties, Accessors (Getters), Mutators (Setters)
- to access/mutate private member variables, we can create public getters/setters to do so
- some langs also have defined methods to create getters/setters
	- ![[Pasted image 20231212205419.png]]
## Inheritance
- approaches: ![[Pasted image 20231212231111.png]]
### Interface Inheritance
- an interface is a collection of unimplemented method declarations
	- ![[Pasted image 20231212231154.png]]
- classes can inherit from a interface and be used in the same external function because they implement the same interface
	- ![[Pasted image 20231212231407.png]]
- interfaces are considered reference classes, and objects can implement multiple interfaces but must be sure to write an implementation for each
	- ![[Pasted image 20231212231514.png]]
- used in Java to create iterators for user made classes
	- ![[Pasted image 20231212231703.png]]
### Subclass Inheritance
- subclass inherits interfaces and superclass implementations and may override superclass implementations and implement any abstract methods from the base/superclass
- e.g., in C++ derived (subclass) implements base (superclass) abstract methods, carres over public and protected method implementations, and can override base class' `virtual` methods (either with override keyword or not - bc of dynamic dispatch and override keyword is unnecessary only for readability)
	- ![[Pasted image 20231212234610.png]]
#### Fragility
- fragile base class - when a superclass method implementation is changed, it may cause logic errors when used on objects of the subclass e.g., changing the `insert_all` of the `Container` superclass changes how it works on an inherited `Set` object
	- ![[Pasted image 20231212235344.png]]
#### Delegation
- when a derived class embeds the superclass as an object and can use it to call the superclass methods directly e.g. super() in python
	- ![[Pasted image 20231213003326.png]]
### Implementation Inheritance
- the derived class inherits the actual method implementations privately but does not allow external code to call the superclass' public interface (methods) only the derived class' methods
	- ![[Pasted image 20231213225931.png]]
- bad practice, instead use delegation
### Prototypal Inheritance
- an object inherits and overrides fields and methods from another object, treated as a prototype
	- ![[Pasted image 20231213231958.png]]
- ![[Pasted image 20231213232057.png]]

## Aspects of Inheritance
- ![[Pasted image 20231213232203.png]]
### Construction, Destruction, & Finalizers
#### Construction
- every derived class is created as a new object which calls the derived class' constructor
- the constructor initializes the base object by calling the base classes' constructors AND initializes the derived class' own methods/fields
	- ![[Pasted image 20231213232408.png]]
- some langs allow the base class constructor call can be implicit e.g., in Java, no explicit `super()` required call if the base class constructor takes no parameters
#### Destruction - Destructors and Finalizers
- from derived up to base, the destructor runs its destructor and implicitly calls its base class/superclass' destructors all the way up
	- ![[Pasted image 20231213234853.png]]
- some langs require explicitly calling the base class' finalizer within the derived class' finalizer while others do it implicitly (e.g., C++)
	- recall finalizers are not guaranteed to run

### Overriding
- base class can control which methods may be overridden, the derived class must ensure base methods are properly overridden, and overriding methods can access an overridden method from the base class
	- ![[Pasted image 20231214000041.png]]
#### Base class controlling method overriding
- you must designate which methods may not be overridden and in some langs als owhich may be overridden
- e.g., in C/C++ the `virtual` keyword designates the method to be allowed to be overridden
	- ![[Pasted image 20231214000227.png]]
	- C/C++ override keyword is optional but good for readability, by default non-virtual methods should not be overridden
- e.g., in Java you can use the `final` keyword designated methods that must not be overridden, something similar in Python
	- ![[Pasted image 20231214000714.png]]

#### Derived class ensuring proper overriding
- some langs may require a keyword like `override` to designate the method in the derived class is overriding a method from the base class
	- ![[Pasted image 20231214001019.png]]
- this is especially important so we don't accidentally create new overloaded functions but isntead actually override the base methods to require new parameters
	- ![[Pasted image 20231214001005.png]]

#### Calling overridden base methods from the derived class
- Either: using a keyword (`super, base`) or using the base class name itself (`Person`)
	- ![[Pasted image 20231214001235.png]]
### Multiple Inheritance
- some langs allow multiple subclass inheritance but this can cause issues later on
- the diamond pattern inheritance is not deterministic in which methods are inherited when they have the same signature across multiple base classes
	- ![[Pasted image 20231214003824.png]]
- other langs only support multiple interface inheritance
	- ![[Pasted image 20231214003924.png]]
## Subtype Polymorphism
- being able to use a function that accepts a superclass object and can operate just fine on any subclass of the superclass e.g. a func on Shape obj should work fine on Circle obj
	- ![[Pasted image 20231214004251.png]]
- this works because the subtype support the same public interface as the supertype
### Liskov Substitution Principle
- we expect methods of the subclass to behave the same (have the same semantics) as the supertype
	- ![[Pasted image 20231214004622.png]]
- this allows subtype polymorphism to work properly and behave properly
- e.g. Swift and Java subtype polymorphism
	- ![[Pasted image 20231214004715.png]]
- this however is not required but still works in dynamically typed langs bc of duck typing
	- ![[Pasted image 20231214004831.png]]
## Dynamic Dispatch
- how a lang determines which dot method to call: the base or derived method, etc.
- in statically typed langs, each method has data on the class of object it is and points to that class' implementation of the method
	- ![[Pasted image 20231214005302.png]]
- this data that is stored for a class is the `vtable` that points to which implementation to use for its available methods
	- ![[Pasted image 20231214005417.png]]
- for non-virtual (non-overridden) methods, there is no ambiguity so it "statically dispatches" to the non-virtual base class implementation
	- ![[Pasted image 20231214005543.png]]
- in dynamically typed langs, class' methods and fields can be dynamically added or removed so each object stores a vtable instead
	- ![[Pasted image 20231214005716.png]]
	- 
- even with subtype polymorphic pointers/vars, we still store the correct vtable
	- ![[Pasted image 20231214005821.png]]