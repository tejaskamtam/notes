---
area: ucla
quarter: Y3Q1
created: 2024-01-16 16:11
updated: Tuesday 16th January 2024 16:11:14
course: CS M151B
📕 courses:
parent: CS M151B

title: 3 - Addressing

layout: note

---
## Addressing/Indexing
### Register File
- fairly small, array of ids mapped to addresses of data
- made of fast SRAM tech
### Main Memory File
- made of slower DRAM tech
- array of ids mapped to addresses
- connected via system bus
### Address Space
- the system address bus can connect any peripherals including DRAM memory sticks
- so the same address space shares addresses for peripherals AND memory addresses
- the PU only observes address names/ids it doesn't recognize whether this belongs to the peripheral address space or not -> this is burdened on the programmer
## ISA
- memory alignment, available instructions, opcodes, addressing modes, endianness (big endian little endian)
### Addressing Modes
- immediate addressing
	- operand is directly embedding values, e.g., `add r0 #5`
	- here `#5` is a direct value
	- fast to decode but cannot change operand at runtime and range limited
- register addressing
	- operands are registers: `add r0 r1`
	- limited by register file size: `r0,r1,rdx,...`
	- fast to decode and fast access from registers bc of SRAM tech
	- register dependency tracking cost -> deciding order
- direct addressing
	- operand is a memory address which can be accessed
	- e.g., `LD r0 0xFF` 
	- fast to decode and large available range
	- memory latency due to DRAM
	- cannot easily change +/- the address on the fly
- indirect addressing
	- operand accessing the value stored in the register
	- e.g., `add r0 (r1)` here the CPU gets the value at `r0` and adds it to the value pointed to by the address in the storage of the `r1`
	- flexible dynamic addresses and range
	- but slower access and complex execution
	- this is kind of syntactic sugar by combining 2 operations: load and add
- displacement addressing
	- `add r0 #5(r1)` i.e. the value at `r1` + 5 is now the address loaded to the ALU
	- flexibility as above and fewer instructions
	- but limited offset range and computation overhead
	- e.g. when using struct based:
	```
	struct Student:
		int uid;
		int age;
	
	a = new Student(305000999,19);
	a.age; -> @ a+4 bytes (32-bit machine)
	```
- indexed addressiing
	- `add r0 r1(r2)`
	- dynamic offset of dynamic addressing
	- e.g. dynamic accessing in a for loop
	```
	students = new Student for _ in range(10)
	for i in range(10):
		students[i].age; -> @ r1+r2 
		(where r1 is 0 offset and r2 is i*8 bytes + 4 bytes)
	```
- relative addressing
	- mostly branch instructions where operand is a memory address relative to PC
	- `JMP +4` jumps to memory at PC+4
	- flexible branching but limited range due to instruction size limit
- stack addressing
	- assuming memory on the stack
	- `push r0` or `pop r0`
	- pushes value of r0 to top of stack and pop takes value at top into r0
	- the hardware is responsible for incrementing addresses
	- limited call stack and branching but easy memory management

### Encoding large immediate/direct addressing
- variable length instructions and use multiple instructions
- dynamic address calculation
- e.g. `mov r2 (r1)0xFFA0` ->
- `mov r3 A0` and `mov r4 FF`
- `shiftL r4 (r4)0x8`
- `add r4 r3`
### Memory Alignment
- memory is a contiguous array so constrain access to some multiple
- e.g. in a 32 bit machine, generally the size of the data or 4 byte alignment
	- ![[Pasted image 20240117213558.png]]
### Endianness
- big endian - the big end of a data e.g., in 0xFFA0, FF is the big end is stored in the smallesst bytes of memory e.g. in 0x00AA, FF is stored in 0xAA and FF in 0x00
- little endian is the opposite - allows the ALU to read as is, most machines use this
### Control status registers
- special storage flags
- e.g. divide by zero flag, FPU config flags (rounding mode), FPU status flags (overflow)