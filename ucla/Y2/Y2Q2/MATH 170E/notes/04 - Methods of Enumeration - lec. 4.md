---
course: MATH 170E
area: ucla
created: 2023-01-18T11:58
updated: 2023-02-01T11:18
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

- multiplication principle
    
    - given $r$﻿ independent experiments with $n$﻿ outcomes each, the number of possible outcomes is given by
    
    $\prod_{i=1}^r n_r$
    

# Big Ideas

---

## Counting

- consider the multiplication principle
- sometimes we are interested in taking $r$﻿ distinct samples from $n$﻿ objects
- we can find ordered or unordered samples with or without replacement

### Ordered With Replacement

$\prod_1^rn=n^r$

### Ordered Without Replacement (Permutation)

$P(n,r)=\frac{n!}{(n-r)!}$

### Unordered Without Replacement (Combination)

$C(n,r)=\binom n r=\frac{n!}{(n-r)!r!}$

### Unordered With Replacement

$C(n+r-1,r)=\binom{n+r-1}{r}$

- $n=$﻿ number of categories
- $r=$﻿ number of elements

### Sequence of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$t$﻿ types (Anagrams)

- $n$﻿ elements where there are $n_t$﻿ elements of type $t$﻿

$\binom{n}{n_1,...,n_R}=\frac{n!}{\prod_{k=1}^r n_k!}=\frac{n!}{n_1!...n_r!}$

  

## Binomial Theorem

$(x+y)^n=\sum_{r=0}^n \binom n r x^ry^{n-r}$

### Pascal’s Triangle

![[/Untitled 16.png|Untitled 16.png]]

- for $1\le k\le n$﻿

$\binom {n+1}k=\binom n{k-1} + \binom nk$

# Resources

---

![[/Lecture_4_annotated.pdf|Lecture_4_annotated.pdf]]

  

📌

**SUMMARY  
**