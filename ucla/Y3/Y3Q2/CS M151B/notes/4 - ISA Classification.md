---
area: ucla
quarter: Y3Q1
created: 2024-01-22 21:47
updated: Monday 22nd January 2024 21:47:09
course: CS 161
📕 courses:
---
## ISA classification
### CISC
- small reg file
- many instructions
- complex instruction -> multiple ops taking multiple cycles
- complex addressing - imm, reg, memory
- complex data types - string, complex
- variable length instrs - compact representations
- Design motivations
	- high transistor cost -> small reg file
	- expensive mem -> reduced prog size
	- simplify assembly -> complex instrs
### RISC
- few instrs
- optimized instrs to reduce CPI
- uniform instr format
- duplicate gen regs
- simple addr mode
- fewer dtypes
- fixed len instrs - simple decoding
- Design motivation
	- simple = fast
	- cheaper and larger memory
	- cheaper transistors
	- better compiler
### Limitations of switching
- intels large legacy
- need to translate CISC to RISC
- domain specific ASICS e.g. Google TPU, needs CISC like MatMul
### VLIW (Very long instr word) ISA
- encode many ops into single long instr word
- execute each op on diff exec unit in parallel
- e.g. IA64
- static instr scheduling -> compiler responsible for dependency mitigation and parallel checking
- relies on wide 64-bit data bus instead of multiple fetches
#### Design Motivation
- Hardware simplification
	- Move the complexity of instruction scheduling to the compiler
	- No need to worry about data dependency
- High Parallelism
	- Enable multiple operations to execute in parallel
	- Exploit Instruction-level parallelism (ILP)
#### Limitations
- Compiler complexity
	- Expensive if hardware changes
- Portability
	- Too much coupling with hardware
	- Process changes renders binary incompatible
- Static Scheduling
	- Limits runtime adaptation
	- e.g. cache miss, branch prediction, etc…
- Code Size
	- Instructions are typical large, increase memory bandwidth

### Vector ISA
- single instruction multiple data (SIMD)
- parallel fetch data
	- ![[Pasted image 20240122221428.png]]
- e.g. ARM Neon, Intel AVX
#### Limitations
- mem bandwidth
	- increased mem reqs for data fetch
- control flow limitations
	- divergent conditional values hard to deal with when branching
- programmability
	- vectorization not always possible
	- data/memory alignment - fragmentation


