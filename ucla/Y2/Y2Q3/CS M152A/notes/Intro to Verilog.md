---
course: CS M152A
area: ucla
created: 2023-04-03T12:24
updated: 2023-04-04T20:14
📕 courses:
  - "[[CS M152A- Verilog HDL]]"
---
# Definitions

---

# Big Ideas

---

## Verilog Overview

- hardware design language (HDL)
- used to compile on FPGA boards
- module based design (combinational and sequential logic)
- i.e. we write in boolean algebra
    - e.g. O = ~(A&B || C) → O = NOT( A AND B OR C)
- work with wires not variables
    - previous example O is a wire
- cant remove virtual modules (in verilog) because they represent hardware (physical modules on FPGA board)

## Data Types

- Wires
    - I/O signals for modules
    - cant set wires to values i.e. not a variable
    - states: 1, 0, X (undefined/don’t cares)
- Registers
    - hardware component - has memory “keeper”
    - stores values (a sequence of flip flops)
- Parameters (constants)

## Programming Tips

- always block - runs on loop (parallel)
    
    ```
    always @* //can only set registers
    		c = a + b; //adder
    ```
    
- assign block - wires
    
    Cannot be placed inside always blocks
    
    ```
    assign c = a + b; //only for wires
    ```
    
- initial - runs once
    
    To set initial values to registers
    
- NEVER use variables (NO for/while loops)

## Module Interface (I/O) - read wires, write regs

- write modules
    - input must be wires
    - output is wire or reg
- calling modules
    - inputs are wires or reg
    - output is wire

# Resources

---

![[/verilog_tutorial.pdf|verilog_tutorial.pdf]]

  

📌

**SUMMARY  
**