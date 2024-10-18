---
area: ucla
quarter: Y3Q1
created: 2024-03-07 16:14
updated: Thursday 7th March 2024 16:14:53
course: CS M151B
📕 courses:
---

## Lookup Tables
- all combinational circuits are truth table
- we make LUTs by optimizing TTs by having some number of inputs and some number of outputs (like a mux): ![[Pasted image 20240307161606.png]]
- thus sequential logic made by attaching a flip flop
- then the combinational must choose which FF to activate using a MUX e.g., regs
### Registers
![[Pasted image 20240307161820.png]]
- we use island structure: ![[Pasted image 20240307165748.png]]
### DSP blocks
- bc fpgas are slow at arithmetic, we include dediated DSPs: ![[Pasted image 20240307165843.png]]
### Memory
![[Pasted image 20240307165945.png]]

## Memory Interconnect
- because mosst boards are FPGA+arm cpu, there needs to b e a memory interconnect
### Zynq Interface 
![[Pasted image 20240307170208.png]]
### AXI Protocol
- Master-slave interconnect: 
	- ![[Pasted image 20240307170246.png]]
- done as a 4-burst handshake: ![[Pasted image 20240307170302.png]]