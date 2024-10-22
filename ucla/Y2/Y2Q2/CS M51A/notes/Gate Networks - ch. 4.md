---
course: CS M51A
area: ucla
created: 2023-01-17T14:15
updated: 2023-01-31T14:10
📕 courses:
  - "[[CS M51A- Digital Logic]]"
tags: cs
parent: CS M51A

title: Gate Networks - ch. 4

layout: note

---
# Definitions

---

# Big Ideas

---

## Combinational Module (Gate Networks)

- created with Gate Networks
- eg. set {AND,OR} gate network
    
    ![[/Untitled 70.png|Untitled 70.png]]
    
- logic diagram (graphical representation)
    
    ![[/Untitled 1 52.png|Untitled 1 52.png]]
    
- net list (tabular representation)
    
    ![[/Untitled 2 46.png|Untitled 2 46.png]]
    
- Hardware Description Language (HDL) (program)
    
    ![[/Untitled 3 40.png|Untitled 3 40.png]]
    

### Universal Gates: {NAND, NOR}

### Universal Sets

- you can show a set of gates of a combinatorial module (gate network) is universal if it can be represented using only universal gates {NAND, NOR}
- e.g. NOT (inverter) and AND using universal gates
    
    ![[/Untitled 4 38.png|Untitled 4 38.png]]
    

### Full Set: {AND, OR, NOT}

### Complete Sets: {AND, NOT}, {OR, NOT}

### Minimal Sets: {NAND}, {NOR}

  

### Mixed-logic Notation and Complex gate structures

- e.g. showing gates as re-implemented unique gates
    
    ![[/Untitled 5 30.png|Untitled 5 30.png]]
    

![[/Untitled 6 29.png|Untitled 6 29.png]]

  

## Critical Path: Dynamic Programming - Longest Path

- gates have delay time in execution → finding the largest latency in the gate network tells us how fast the network will execute (the slowest chain)
- the latency can be written above the gate
    
    ![[/Untitled 7 27.png|Untitled 7 27.png]]
    

$t_{\text{tot}}=t_n=\max(t_1,...,t_{n-1})+d(G)$

### Calculate Critical Path with Delay Table

- note how each gate changes its values as shown in the example
    
    ![[/Untitled 8 24.png|Untitled 8 24.png]]
    
    - the gate values are determined considering if inputs are all low (usually 0) then if inputs are all high (usually 1)
    - e.g. gate A has low = 0 (bc with low inputs AND give 0) and has high = 1 (bc AND w high inputs gives 1) and o on
- use the delay table s.t. $L=\text{load factor}=\text{fan-out}$﻿ in the propagation delays
    
    ![[/Untitled 9 20.png|Untitled 9 20.png]]
    
- delay prop. Low→High if gate has (0/1) and High→Low if (1/0) otherwise (0/0) and (1/1) have t=0 delay)
- fan-in in is the number of input variables
- fan-out is the number of output variables
- load factor is a reference to the energy/cost it takes to use the gate
- size is arbitrary definition based on power consumption and delay prop.
    - size is now obsolete as transistors can be manufacture in billions to trillions per die

## Analysis of Gate Networks

### Functional Analysis

- define I/O switching expressions (typically letters with subscript)
- create a net list (tabular representation) of the binary function
- define high-level I/O variables → use codes to represent as bit-vectors
- create a high-level spec of the system

### Network characteristic

- input load factors
- fan-out factors
- delays
- e.g. logic diagram with SEs
    
    ![[/Untitled 10 18.png|Untitled 10 18.png]]
    
- e.g. binary function
    
    ![[/Untitled 11 16.png|Untitled 11 16.png]]
    

## Hierarchical approach

- decompose the network in subnetworks (modules)
- analyze subnetworks separately
- substitute into gate network function
- e.g. creating subnetworks
    
    ![[/Untitled 12 16.png|Untitled 12 16.png]]
    
- verify subnetwork satisfies binary function
    - binary function (spec)
        
        ![[/Untitled 13 15.png|Untitled 13 15.png]]
        
    - subnetwork functions
        
        ![[/Untitled 14 12.png|Untitled 14 12.png]]
        
- create high level spec (net list, table)
    
    ![[/Untitled 15 10.png|Untitled 15 10.png]]
    
- derive network function
    
    ![[/Untitled 16 8.png|Untitled 16 8.png]]
    

  

# Resources

---

![[/ch4.pdf|ch4.pdf]]

![[/cs51a_CriticalPath.pdf|cs51a_CriticalPath.pdf]]

📌

**SUMMARY  
**