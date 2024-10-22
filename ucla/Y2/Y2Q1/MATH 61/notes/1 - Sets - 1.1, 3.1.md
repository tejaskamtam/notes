---
course: MATH 61
area: ucla
created: 2022-09-23T11:05
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 1 - Sets - 1.1, 3.1

layout: note

---
# Recall

1. Sets are a collection of unique elements
    1. cardinality is the quantity of a set
2. We can operate on sets using
    1. unions/intersections
    2. differences/complements
    3. collections/partitions
    4. products
3. We can describe set correlations as
    1. injective, surjective, bijective
4. Functions we use
    1. mapping/transformations, modulus, floor/ceiling, composition

  

# Notes

Core Definitions - 1.1

- sets
    - collection of objects called elements (elts) or members
    - if few element
        - $A=\{1,2,3\}$﻿
    - many elements
        - $B=\{1,2,3,...\}$﻿
    - conditional
        - $C=\{2,4,6,8,...\}=\{x\in\mathbb{Z}\space\vert\space\text{x is an even integer}\}$﻿
- symbols
    - $\mathbb{Z}=\{x | x\space\text{is an integer}\}$﻿
    - $\mathbb{Q}=\{x | x\space\text{is a rational number}\}$﻿
    - $\mathbb{R}=\{x | x\space\text{is a real number}\}$﻿
- infinite/finite
    - if x has infinite elements, x is infinite else finite
- cardinality
    - the number of unique elements in x written $\vert x\vert$﻿
- empty set
    - if x contains no elements, denote empty set as $\phi$﻿
- equal sets
    - if each set contains the same elements
    - prove equality by showing “$\text{if}\space x\in X\space\text{then}\space x\in Y\space\text{and}\space\text{if}\space y\in Y\space\text{then}\space y\in X$﻿
    - prove inequality by showing $\text{some}\space x\in X \space\text{where}\space x\notin Y$﻿
- subset
    - if each element of X is also an element of Y, X is a subset of Y, denoted $X\subseteq Y$﻿else $X \nsubseteq Y$﻿
- proper subset
    - if $X\subseteq Y$﻿ and $X \neq Y$﻿ then $X\subset Y$﻿
- power set
    - the set of all subsets of X denoted $P(X)$﻿
    - if $X=\{1,2\}$﻿ then $P(X)=\{\phi,\{1\},\{2\},\{1,2\}\}$﻿
- universal set
    - the usual larger set in which all sets are contained denoted $U$﻿

Set Operations - 1.1

- union
    - $X\cup Y = \{z\space\vert\space z\in X\space\text{or}\space z\in Y\}$﻿
- intersection
    - $X \cap Y = \{z\space\vert\space z\in X\space\text{and}\space z\in Y\}$﻿
    - if $X\cap Y=\phi$﻿ then X and Y are disjoint
- difference
    - $X-Y=\{z\space\vert\space z\in X\space\text{and}\space z\notin Y\}$﻿
- complement
    - $\bar X=\{x\in U\space\vert\space x\notin X\} = U-X$﻿
- collection
    - set of sets denoted denoted
    - $\cup_i A_i = \{x\in A_i \space\text{for some}\space i\}$﻿
    - $\cap_j A_j = \{x\in A_j \space\text{for each}\space j\}$﻿
- partition
    - a collection $S=\{A_i\}$﻿ is a partition of set X if for each $x\in X$﻿ there is some $i$﻿ for which $x\in A_i$﻿ and each $A_i, A_j$﻿ are disjoint
- cartesian product
    - $X\times Y=\{(x,y)|x\in X,y\in Y\}$﻿

Functions - 3.1

- function
    - assignment of an element of Y (codomain) to each of X (domain)
    - $f:X\to Y$﻿ and $f(x)$﻿
    - the range is $\{y\in Y | y=f(x)\space\text{for some} x\in X\}$﻿
- modulus
    - x mod y is the remainder from dividing x by y
- floor
    - round down to nearest integer denoted $\lfloor x\rfloor$﻿
- ceiling
    - round up to nearest integer denoted $\lceil x\rceil$﻿
- injective (one-to-one)
    - $f:X\to Y$﻿ is injective if:
    - for each $x_1,x_2\in X$﻿ if $f(x_1)=f(x_2)$﻿ then $x_1 = x_2$﻿
- surjective (onto)
    - $f:X\to Y$﻿ is surjective if:
    - for each $y\in Y$﻿ there exists some $x\in X$﻿where $f(x)=y$﻿
- bijective (invertible)
    - $f:X\to Y$﻿ is bijective if:
    - $f$﻿ is injective and surjective, then:
    - $f^{-1}$﻿ is the inverse of $f:X\to Y$﻿ where if $f(x)=y$﻿ then $f^{-1}(y)=x$﻿ denoted $f^{-1}:Y\to X$﻿
- composition
    - for $f:X\to Y, g:Y\to Z$﻿:
    - $g\circ f=g(f)$﻿ such that $g\circ f(x)=g(f(x))=g(y)=z$﻿

# Lecture

![[/61_-_Week_0_notes_--_1.1_3.1.pdf|61_-_Week_0_notes_--_1.1_3.1.pdf]]

  

📌

**SUMMARY  
**In Math 61, we explore sets - a mathematical object used to store elements; elements can be of any type including other sets which are called subsets  
We explore manipulating sets using set operations and functions to describe or transform sets