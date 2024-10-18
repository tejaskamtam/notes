---
course: CS M51A
area: ucla
created: 2023-01-19T14:23
updated: 2023-01-31T14:10
📕 courses:
  - "[[CS M51A- Digital Logic]]"
tags: cs
---
# Definitions

---

# Big Ideas

---

## 2 Level Networks@import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\text{AND-OR}\iff \text{NAND-NAND}\implies\text{SOP}\\\text{OR-AND}\iff \text{NOR-NOR }\implies\text{POS}$﻿

- L1: Inputs and (optional) NOT gates - Literals (un/complemented variables)
- L2: AND gates - Products
- L3: OR gates - Sums
- Multi-output networks: an OR gate for each output

![[/Untitled 79.png|Untitled 79.png]]

### Characteristics of Minimal 2 Level Networks

- Inputs: uncomplemented and/or complemented
- Fan-in - unlimited or finite
- Single-output
- Minimal: minimum # of gates w/ minimum iinputs

  

### Equivalence ≠ Equal Cost

- a network in SOP and POS
    
    ![[/Untitled 1 59.png|Untitled 1 59.png]]
    
- the switching functions

![[/Untitled 2 52.png|Untitled 2 52.png]]

## Karnaugh Maps

- a way to graphically represent switching functions

### Characteristics of Karnaugh Maps

- 2-dim array of cells
- $n$﻿ variables $\rightarrow 2^n$﻿ cells
- cell $i\longleftrightarrow$﻿ assignment $i$﻿
- adjacency condition
    - any set of $2^r$﻿ adjacent rows/columns → assignments differ by $r$﻿ variables
- groups of 1,2,4,8,… adjacent “high” values can be “pooled” to find the minterms
- similarly, form groups of “low” values to find maxterms
- NO WAY TO EXPLAIN THIS → WATCH FIRST LINKED VIDEO

### One-Set, Zero-Set, DC-Set

- given aa switching function as a high-low set:

![[/Untitled 3 45.png|Untitled 3 45.png]]

### SOP and POS from K-Maps

- SOP: watch first linked video
- POS: watch second linked video

### Essential and Prime Implicants (SOP) (3rd video)

- Implicant: product term (maxterm) for which the SF=1
- e.g. implicants
    
    ![[/Untitled 4 43.png|Untitled 4 43.png]]
    
- Prime Implicants (PIs): largest possible group of “high” values in the K-map explained by a maxterm
- e.g. prime implicants
    
    ![[/Untitled 5 35.png|Untitled 5 35.png]]
    
- Essential Prime Implicants (EPIs): the minimal PIs required to describe the K-map i.e. a PI for which ALL its implicants that cannot be grouped in any other possible way
- e.g. EPIs
    
    ![[/Untitled 6 34.png|Untitled 6 34.png]]
    

  

### Essential and Prime Implicates (POS)

- similar to implicants but the OPPOSITE
- Implicate: sum term (minterm) for which SF=0
- Prime Implicate: implicate not covered by another implicate
- Essential prime implicate: similar as EPI but for 0s

# Resources

---

![[/ch5.pdf|ch5.pdf]]

[https://youtu.be/RO5alU6PpSU](https://youtu.be/RO5alU6PpSU)

[https://youtu.be/iBSMoDLhxB4](https://youtu.be/iBSMoDLhxB4)

[https://youtu.be/fmAwCosFSRs](https://youtu.be/fmAwCosFSRs)

📌

**SUMMARY  
**