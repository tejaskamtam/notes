---
area: ucla
quarter: Y4Q1
created: 2024-10-07 18:37
updated: Monday 7th October 2024 18:37:23
course: CS 130
---
## Unified Modeling Language (UML)
[[03-software_analysis.pdf#page=17&annotation=annot_p16_1|03-software_analysis, page 17]]
- older, more popular framework for designing diagrams
- allows for multiple analysis methods
	- ![[Pasted image 20241007184152.png]]
### Use Case Diagram
- describes system as aa black box, used to model the customer interaction
- identifies possible service use cases, actors/interfacers, external system interactions
- e.g. ![[Pasted image 20241007184443.png]]
- relationships between actors/interactions ![[Pasted image 20241007184528.png]]
### Activity Diagram
- models control flow and data flow in a use case of the subject system
![[Pasted image 20241007185757.png]]

### Class Diagram
 - describes white boc implementation of a system in terms of types: classes, interfaces, primitives
 - a type defined by attributes and features/operations
 - multiple abstraction levels
 - ![[Pasted image 20241009181640.png]]
 - abstract class - cannot be instantiated in italic
 - integers on associations depict the possible count of the associated class within the higher up
	 - there may also be "flags" that identify properties of the association
NOTE: my descriptions of compositions uses terms source (arrow or empty end) and destination (diamond end); this conflicts with my description of association having source ()
 - associations are **directional** - no arrows = bidirectionl, arrows represent that the source has a property of the dest. of the association arrow, but the dest. class has no property of the source class
 - composition - association with a black diamond end (signifies special deletion semantics) = class by the diamond (destination) is an owner of the source, e.g. account is composed of 1 shopping cart
	 - important for deletions - items that are composed in another class will be deleted when the destination (black diamond class) is deleted
	 - deletion is transitive and cascades down **composition** connections but not association connections, deletion only cascades FROM diamond TO empty i.e., source only deleted if dest deleted in composition
- attribute/operation scoping
	- + : public; - : private; # : protected
- Attribute modifiers/syntax
	- ![[Pasted image 20241009183744.png]]
- Operation modifiers/syntax
	- ![[Pasted image 20241009183800.png]]
NOTE: from below i refer to diamond end as source and arrow end as destination
- inheritance = source "is-a" dest;
- association/composition = source "has-a"
### Sequence Diagram
- describes interactions in/between a system
- shown as exchange of messages; messages ordered in time (flowing downward)
- ![[Pasted image 20241009191024.png]]
- ![[Pasted image 20241009191037.png]]
- ![[Pasted image 20241009191539.png]]
- ![[Pasted image 20241009191548.png]]
- ![[Pasted image 20241009191601.png]]
### State Machine Diagram
- decribes states and transitions within a system or class
- ![[Pasted image 20241009192936.png]]
- a state can be simple or composite
- pseudo-states: entry exit - black dots, exit is circled
- ![[Pasted image 20241009193105.png]]
- ![[Pasted image 20241009193419.png]]
- e.g., activity4 -> activity2 -> activity6 -> activity7 -> activity9 ![[Pasted image 20241009193939.png]]