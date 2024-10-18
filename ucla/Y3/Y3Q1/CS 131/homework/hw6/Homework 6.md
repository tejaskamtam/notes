---
area: ucla
quarter: Y3Q1
created: 2023-11-14 12:24
updated: Tuesday 14th November 2023 12:24:45
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
---
### Tejas Kamtam
### 305749402
### CS 131 - Fall 2023

---

## Problem 1
Looks like the lang is doing some optimization to store values on the heap and allow multiple variables to point to the same object (for integers at least) in memory as we see `n1` and `n2` have the same ID. The equality here could be doing a reference comparison or a deep comparison. Now for the strings, the variables refer to different objects on the heap as each has a different ID and thus equality is checking the actual value of the object, not its ID or location in memory.
So, this is likely Object Reference variable binding semantics.

## Problem 2
### Part a
This is pass by reference since original value can be reassigned.
### Part b
This is pass by object reference or pass by value as the original values are not changed when reassigned in the function call.
### Part c
If it was pass by value, the original values would be copied, so any changes would not reflect on the original, so it prints 2.
If it was pass by object reference, a mutator on the reference is called, so the original values are changed and it prints 5.

## Problem 3
### Part a
baz
bar
1
### Part b
baz
bar
4
### Part c
baz
bar
1
### Part d
bar
4

## Problem 4
The optional object allows external code to handle the return in an immediate block calling the search function continue to operate, while the exception throw will return to the outer most try block. The suggested method of error handling in this situation is using the optional because there is only one source of error and the function never introduces any unmanaged resources or undefined behavior. So, we should allow the user to continue to run the program even if the search for the element fails. If we use an exception, we risk jumping many nested functions out to catch the exception which may introduce undefined behavior or unintended consequences, e.g., leaving a connection open, not closing a file, etc.

## Problem 5
### Part a
catch 2
I'm done!
that's what I say
Really done!

### Part b
catch 1
hurray!
I'm done!
that's what I say
Really done!

### Part d
catch 3