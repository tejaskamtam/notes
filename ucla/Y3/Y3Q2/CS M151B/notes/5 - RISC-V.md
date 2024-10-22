---
area: ucla
quarter: Y3Q1
created: 2024-01-23 16:36
updated: Tuesday 23rd January 2024 16:36:20
course: CS M151B
📕 courses:
parent: CS M151B

title: 5 - RISC-V

layout: note

---
## RISC-V ISA Background
- open source, free to use - will do 32-bit int
- focus on efficiency, extensibility, accessibility
- 4th gen prev was widely used in ARM, 3rd gen used in embedded
- diff versions can be extended to have the following
	- ![[Pasted image 20240123141007.png]]
- open extensions
	- ![[Pasted image 20240123141056.png]]
	- ![[Pasted image 20240123141111.png]]
## Instructions Background
- base 32-bit words, 7-bit opcode
- C (compressed instr) extension allows half-word instrs
- variable length supported by extensions, use LSB to identify length
	- ![[Pasted image 20240123141700.png]]
- instruction formats depend on operation type, shown below
	- ![[Pasted image 20240123141354.png]]
- Base Instruction Set (full listed in chapter 9)
	- ![[Pasted image 20240123141758.png]]
- Instruction opcodes represent the name for a et of sub intructions, the 32-bit instruction can contain a `funct` (func_type) defining what type of subinstruction of the opcode
	- e.g., OPCODE = `BRANCH`, funct3 = `BEQ/BNE,BGE,BLT`
### Integer extension
- motivation to incr num bits of bin num while preserving value -> for arithmetic of varying data width
- zero-extension to append 0s (in binary looks liek prepend, shiftr)
- sign-extension to apply sign extension
### Immediate variants
- S and B are 12 bit, U and J are 20 bit
- ![[Pasted image 20240123142052.png]]
## Int Reg - Immediate Instructions
![[Pasted image 20240123142143.png]]
![[Pasted image 20240123142237.png]]
![[Pasted image 20240123142248.png]]
## Register - Register Ops
![[Pasted image 20240123142339.png]]
## Control Flow (Branch/Jump) Ops
- jumps from PC (calling address) + offset (+ or -), the dest saves PC+4 (the next instruction) ![[Pasted image 20240123142432.png]]
- offset applied to base and jumps there, dest stores PC+4 from calling addr ![[Pasted image 20240123142439.png]]
- ![[Pasted image 20240123142446.png]]

## Load and Store Ops
### Loading (to registers)
- load ops are heavy on memory alignment, you can load `BYTE,HALF,WORD,DOUBLE,U_BYTE,U_HALF,etc.` ![[Pasted image 20240123164611.png]]
- the MSB above for the funct, gives how to sign extend half or byte size words when using `LB,LH`
#### Loading Immediates
- we can load into the upper 20 bits or lower 20 bits uing `LUI` ![[Pasted image 20240123170950.png]]
### Storing (to memory)
- all memory/address ops including load/store deal with words and shift/extract/extend to get the half-word or byte, but this may overwrite a full word even if you are storing a single byte
![[Pasted image 20240123171132.png]]
## Control and Status Ops
- there are ops for unsigned immediate (I postfix) and signed ![[Pasted image 20240123173835.png]]
	- ![[Pasted image 20240123173945.png]]
- There exists a CSR flag table ![[Pasted image 20240123174051.png]]
### Privilege Levels
- privilege levels dictate the software access level to enable access control (what the app can do) and security (running app in iso) ![[Pasted image 20240123174349.png]]
#### User Level (U) CSR
- lowest privilege can be accessed by user mode
- instructions safe to expose to apps
- e.g., performance counters
#### Hypervisor (H) CSR
- optional level in new RISC-V
- for virtualization (VMs)
- between M and S modes
#### Supervisor (S) CSR
- system level for OS
- can control resources but lower level that machine
#### Machine (M) CSR
- most privileged, machine-level
- controls low level stuff like interrupts, exception handling, and physical memory access
- used at boot
- usually shared
#### Switching/Usage
- CPU starts at machine level
- S/W can use CSR `mstatus` to lower privilege level
- `mret,sret,uret` used to return to privilege levels
- CPU excepts if wrong privilege envoked
#### Common CSR: Counters
- ![[Pasted image 20240125161618.png]]
- the counts are stored as 64-bit values, h modifier an be used to access higher 32 bits
- but overflow in one 32 bit value can lead to issues in 2-part reading lower then upper, lower could overflow in the time it takes to read upper, thus solution, check twice
	- loop is the address of the cycle count, we choose which to use based on overflow and loop until not overflowed ![[Pasted image 20240125162513.png]]



## RISC-V ABI
- `ra` is the return address that the program jumps to at the end of the function call, e.g. if `main` calls `foo`, `ra` stores the address of `main`
- `r0==a0` is the function return value storage
- r0 == a0 below ![[Pasted image 20240125163047.png]]
#### Stack Pointer
- Stack moves from high address down (i.e. we decrement to increase stack space)
	- stack moves down, heap moves up (dynamic data)![[Pasted image 20240125170758.png]]
	- ![[Pasted image 20240125170824.png]]
- the CPU reads the predetermined stack base address from the keyword: `STACK_BASE_ADDR`
#### Global pointer
- starts at the middle of the predetermined (at compile time) static frame space bc the prog knows the amount of static data required
- the gp can then increment or decrease bc it begins in the middle of the static (global) space
- the linker exports the pointer location address as the keyword `__global_pointer`
#### Thread pointer
- the TLS (thread local storage) tracks thread local variables
- so we need a thread pointer to point to the values in the thread local storage (allocated on the heap) - there is only 1 TLS for the program and each thread allocates within the TLS based on where the `tp` points to
- the linker/compiler knows how much TLS space to allocate at compile time so we just allocate a static TLS frame and use the `tp` to identify the storage location
	- e.g. ![[Pasted image 20240125172745.png]]
- ON MULTITHREADED APP - register file is NOT shared
	- each thread has its own physical register 


