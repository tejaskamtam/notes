---
course: CS 131
📕 courses:
  - "[[CS 131 - Programming Languages]]"
quarter: Y3Q1
area: ucla
parent: CS 131

title: 2 - Haskell

layout: note

---
# Functional Programming
- every function must take an argument
- every function must return a value
- calling a function will always output the same value given the same input
- functions are just like any data and can be stored in variables and passed as args
- functions are pure and have no side effects
- all variables are immutable and can never be modified
## Pure Functions
- also called referentially transparent function
- given an input x, the function always returns the same output y
- it computes its output exclusively on input parameters
Pros
- make it easier to reason, debug, test
- enable parallelism and compiler optimization
- help us formally analyze and prove
-  our programs
- ![[Pasted image 20231004142209.png]]
## Imperative vs Functional
![[Pasted image 20231004143125.png]]
## Parallelism
- order of execution is low importance
- imperative functions require function calls to occur in order because of external effects of non pure functions
- FP can call each function using lazy evaluation (only evaluates a line if it needs to)
![[Pasted image 20231004143329.png]]


# Haskell Utility Functions
## `init :: [a] -> [a]`
- returns all but the last value of a list
- e.g. `init [1,2,3]` returns `[1,2]`
## elem a::data b::list
- check if a::data is an element of b::list
## fromIntegral a::Int
- converts a::Int to Double
## reverse a::list
- reverses the list
## any_type or any lowercase type signature
- defines any type of data
## error a::String
- return an error

## quicksort
![[Pasted image 20231009153047.png]]
## show a::any
- show the actual value e.g. show (tail a) gives `[5]`
## map f::func l::list
- returns mapped list given a function f
## backticks on funcs
- allows u to use funs as infix e.g.
```haskell
max a b
elem a b
-- is the same as
a `max` b
a `elem` b
```
# Haskell
## General
- Haskell is one of few purely functional languages
- follows lambda calculus - a theory that each function solely outputs the function definition with no outside effects
- no vars, sequences of statements, loops
## Example Code
```haskell
square x = x*x
hypot a b = sqrt (square a + square b)

Prelude> load hypot
Prelude>hypot 1 2
```
- Prelude loads standard library, etc.
- Haskell uses REPL paradigm like Python - Read Execute Print Loop
## Indentation
- code part of an expression should be indented further than the declaration of the first line
- align the spacing for all items of a group
![[Pasted image 20231004144550.png]]

## Data types
- statically typed - all var types determined at compile time -> no changing types
- has type inference
- ints, big-ints (any number of digits), doubles, bools, chars
```haskell
googol = 10^100 :: Integer
```
- the `:: Integer` is manually typing big-int, but Haskell will figure out its type
- unary negative needs parentheses e.g. `(-1)`
- logical ops allowed `&&` `||`
### Composite data types
- tuple - collection of values, could be diff types
- lists - must be of same type
- string
## Constructing Lists
### Concatenation and Consing
![[Pasted image 20231004152606.png]]
![[Pasted image 20231004152816.png]]
- cons operator `:` only prepends ONE item to the front of a list
- `++` requires 2 existing lists and concatenates 2 lists
### Ranges
- will read patterns as subtractions e.g., `[1,3..10]` will do 3-1 then print until 10
-  infinite lists and cycles only generate when required e.g., `[42,...]`
![[Pasted image 20231004153024.png]]
### Tuples
```haskell
grade :: (String,Int)
grade = ("me",4)

> fst grade -- fst only works on tuples of 2 values
> "me"
> snd grade
> 4
```
### Lists
- can hold zero or more of same type
- implemented using linked lists i.e. O(n) to access nth item
![[Pasted image 20231004151518.png]]
![[Pasted image 20231004151538.png]]
### Strings
- a string is equivalent to a list of chars e.g. `String == [Char]`
![[Pasted image 20231004151747.png]]


### Comprehension
- used to generate arbitrarily complex lists of items with declarative syntax
-  create a new list based on one or more existing lists
```haskell
output_list = [f x | x <- input_list,(guard1 x),(guard2 x)]

square1 = [x^2 | x <- input_list]
square2 = [x^2 | x <- input_list, x>5, x<20]
```
```haskell
out = [(f x y) | x<-in1, y<-in2, (guard1 x), (guard2 y)]

all_prod = [x*y | x<-l1, y<-l2, even x, odd y, x*y < 15]
```
#### Definition
![[Pasted image 20231004154106.png]]
#### Dependent Generators
- generators that generate from the values of another generator
![[Pasted image 20231009142456.png]]


## Functions
### What's in a function
1. type signature: inputs and return value
2. function name and parameters
3. expression that defines behavior
![[Pasted image 20231009142803.png]]
### Left Associative
![[Pasted image 20231009145112.png]]
### Local Bindings
- `let` and `where` locally associate/bind variable names as "temporary" vars
- beware of global variable shadowing - need to check the behavior
#### Let
![[Pasted image 20231009150604.png]]
#### Where
![[Pasted image 20231009150550.png]]
### Nested Functions
![[Pasted image 20231009150718.png]]
- Nested Functions have visibility of all outside scope, so they can "see" the immediate outer scope variables
- this allows us to simplify the previous to:
![[Pasted image 20231009151021.png]]
## Conditionals
- every `if` requires an `else` - there are no void functions in Haskell
- else-if is implemented using nested conditionals
![[Pasted image 20231009151323.png]]

## Guards
- basically, syntactic sugar for conditionals
![[Pasted image 20231009151459.png]]

## Pattern Matching
- again syntactic sugar
- specifying specific outputs for each unique input (can leave generalized if needed)
- the patterns match IN ORDER - runs the first matched function implementation
- you can use `_` to mean "any value" or "not required"
	![[Pasted image 20231009153738.png]]
![[Pasted image 20231009153342.png]]
### Tuple Pattern Matching
![[Pasted image 20231009154233.png]]
![[Pasted image 20231009154342.png]]
### List Pattern Matching
- List patterns identified by parentheses
- elements separated by colons, last elem must be rest of the list
- the pattern is: `(first:rest)` where `first::any` and `rest::list`
- rest is always a list
- the patterns are checked in order
#### Structure
![[Pasted image 20231009154639.png]]
#### Examples
![[Pasted image 20231011141235.png]]
#### Guards vs pattern matching
![[Pasted image 20231011141536.png]]
#### Cheat Sheet
![[Pasted image 20231011141954.png]]


## Higher Order Functions
### First Class Functions
- when a function is treated like any other data/vars
- stored in vars, used as args, returns values, stored in data structure
- higher order functions' type definition must be wrapped in parentheses
### Higher Order Functions
![[Pasted image 20231011143444.png]]
### Returning Functions
- you can save returned functions to variables -> example w/ "jayathi"
- you can also overlload higher ordered returned functions passing the second parameter in the same line -> look at second example w/ "carey"
	- Because Haskell is left associative, it does the greedy choice and does `get_pickup_func carey`. Then that is now a function and passes `"carey"` as a param
![[Pasted image 20231011143900.png]]
## Fundamental Higher Order Funcs
### Mappers
- one-to-one map of a list of values to another list using a **transform function**
- Haskell has built-in `map::(a->b) -> [a] -> [b]` s.t. `map f::func l::list`
- returns a new list (not in place because all data in Haskell is immutable)
#### Example
![[Pasted image 20231011150617.png]]
#### How it works
![[Pasted image 20231011150657.png]]
### Filters
- filters out items from a list using a **predicate function**
- built-in `filter::(a->Bool) -> [a] -> [a]` s.t. `filter f::func l::list`
- takes a function that returns a boolean
#### Example
![[Pasted image 20231011151320.png]]
#### How it works
![[Pasted image 20231011151341.png]]
### Reducers
- operates on a list and collapses to a single value
- takes a function to process each element, an initial accumulator value, list to operate on
- has 2 built-in: `foldl` and `foldr`
#### Foldl
- Pseudocode
	- ![[Pasted image 20231011152055.png]]
- folds left associative - i.e. in order
- internals
	- ![[Pasted image 20231011152407.png]]
#### Foldr
- pseudocode
	- ![[Pasted image 20231011152130.png]]
- folds right associative - reverse
- internals
	- ![[Pasted image 20231011152948.png]]

# Advanced FP Topics
## Lambda functions
- a nameless function - used to make readability better
- especially used in higher-order funcs
![[Pasted image 20231011154921.png]]
### Examples
![[Pasted image 20231011154942.png]]
### Saving lambdas as functions
![[Pasted image 20231016141655.png]]
### Closures
- a function that uses a lambda that captures values
	- ![[Pasted image 20231016143050.png]]
- captured values are values that are not parameters of the lambda but are enclosed within the lambda - also called "free variables"
- in the following, `twoxPlusOne` and `fivexPlusThree` are closures that are functions that capture 2,1 or 5,3, respectively when called with a value x
- ![[Pasted image 20231016142444.png]]

## Partial Function Application
- a way to decrease the number of params of a function by 1 to create a new function that returns a function that accepts the last arg
	- ![[Pasted image 20231016144536.png]]
- ![[Pasted image 20231016144516.png]]
### Examples
![[Pasted image 20231016145219.png]]
![[Pasted image 20231016145235.png]]
## Currying
- a way to trasnform a multi-arg func into a series of funcs that take only 1 arg
	- ![[Pasted image 20231016151629.png]]
- ![[Pasted image 20231016150813.png]]
### Type Defs
![[Pasted image 20231016154403.png]]

## Algebraic Data Types
### Definition
![[Pasted image 20231016154511.png]]
### Structure
- data is used to specify ADTs all data and variants must be Capitalized
- the pipe separates variants of the data type
- you can construct data types of data types
	- a meal has variants: Breakfast, Lunch, Dinner, Fasting
	- each of these is made up of data types of ADTs
![[Pasted image 20231016154615.png]]
### Examples
- use `deriving Show` to show variable values
- ![[Pasted image 20231016154849.png]]
### Pattern Matching
![[Pasted image 20231016154929.png]]
## Data Structures
- immutability makes debugging, parallelization, and garbage collection easier
- BUT, some data structures are inefficient
### Trees
- construct using ADTs - see HW2
- searching
	- ![[Pasted image 20231018141743.png]]
- insertion - only change the path to root $$O(\log n)$$
	- ![[Pasted image 20231018141855.png]]
	- ![[Pasted image 20231018141910.png]]
	- ![[Pasted image 20231018142823.png]]
	- garbage collection deletes unlinked old nodes
### Hash Tables
- requires O(buckets) for each change because you need to reconstruct the entire hash array
- ![[Pasted image 20231018143732.png]] 

### Linked List
- same as imperative
- O(1) at the front, O(n) at the end, somewhere in between for the middle

![[Pasted image 20231018144107.png]]