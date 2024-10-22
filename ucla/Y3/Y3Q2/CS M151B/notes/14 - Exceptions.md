---
area: ucla
quarter: Y3Q1
created: 2024-02-29 16:17
updated: Thursday 29th February 2024 16:17:33
course: CS M151B
📕 courses:
parent: CS M151B

title: 14 - Exceptions

layout: note

---
## Types of Errors
### Interrupts
- asynchronous
- due to external reasons (user input)
- usually does not affect too much, we can just stall
- can be automatically handled by handler and just stall
### Exceptions
- synchronous
- due to internal reason (code)
- needs to be handled
- types:
	- arithmetic - overflow, undderflow, dividee by zero
	- faults - page fault, invalid opcode
	- traps - breakpoint
	- error - parity
- needs to be handled -> resume or abort after
### Precise Exceptions
- when ecxepted:
- all prev instrs executed
- all future instrs unmodified
- faulting instr may or may not have been executed
## Handling Errors
- OOO processors - if fault happens on speculative branch, it should never bee seen/committed bc we can just jump back to taken branch
- 