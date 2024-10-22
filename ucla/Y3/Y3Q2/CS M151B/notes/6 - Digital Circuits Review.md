---
area: ucla
quarter: Y3Q1
created: 2024-01-25 17:33
updated: Thursday 25th January 2024 17:33:52
course: CS M151B
📕 courses:
parent: CS M151B

title: 6 - Digital Circuits Review

layout: note

---
## Combinational Circuits
- combination of logical gates, output based on input only
	- ![[Pasted image 20240125173508.png]]
### Muxes
- Muxes
	- ![[Pasted image 20240125173524.png]]
## Sequential Circuits
- output based on input AND clock (usually only on posedge of clk) or inputs AND 
	- ![[Pasted image 20240125173735.png]]
### D Flip-Flops
- used to implement registers and for timing resolution ![[Pasted image 20240125173835.png]]
- e.g. when combinational logic is LARGE, use register in between to mitigate
	- ![[Pasted image 20240125173948.png]]
## FSMs
- states are based on previous state and inputs
- e.g. `111` sequence detector
	- ![[Pasted image 20240125174811.png]]
### Mealy Machine
- outputs based on state AND input
	- ![[Pasted image 20240125174058.png]]
- this can help us represent many states with fewer overaall states bc we now depend on inputs as well
- However, if the input has a large delay, it may delay the output further
### Moore Machine
- output only based on state (NS)
	- ![[Pasted image 20240125174610.png]]
- allow us to not lose the signal strength or the output since output is only based on the state which is sent by the flip-lop (which sends the voltage as a fresh/stronger signal)
