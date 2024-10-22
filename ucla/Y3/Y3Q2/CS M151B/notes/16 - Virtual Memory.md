---
area: ucla
quarter: Y3Q1
created: 2024-03-05 17:17
updated: Tuesday 5th March 2024 17:17:43
course: CS M151B
📕 courses:
parent: CS M151B

title: 16 - Virtual Memory

layout: note

---
## Background
- modern apps are multi-program
- each program need to think it has its own heap: 
	- ![[Pasted image 20240305172953.png]]
- naive approach - static paritioning
### Static Paritioning
![[Pasted image 20240305173017.png]]
- balance check and give each program a static address space called "logical addres"
- then have a base and bound
- we can check bound with just the logical addresses
- then to allocate on physical address space - add base + logical address ![[Pasted image 20240305173033.png]]
- issue - not all program need the same amount of memory

## Virtual Memory - Dynamic Partitioning
- allocate a page file for each program on physical memory- fixed size
- then each program's virtual (logical) address space is the full address space or more (usually more) but when allocating new memory, it has access to the page file on physical memory
- if a program needs more than its 1 page file (page fault), OS allocates a new page file where free in physical memory and assume it continuous to the program's virtual (logical) addresses
### Address Translation
- virtual address: $$\text{[ virtual page number (VPN) | page offset ]}$$
- physical address: $$\text{[ physical page number (PPN) | page offset ]}$$
- then only do address translation between VPN <-> PPN ![[Pasted image 20240305173146.png]]
- address translation is usually a lookup table in Page Table with VPN as index ![[Pasted image 20240305173216.png]]
- each program has its own page table, and the OS will deal with context switching by indexing into that program's page table using MMU (done using CSRs in RISC-V)
#### Example
![[Pasted image 20240305173445.png]]
### Page Table
PTEs have flags (tags) alongside the PPN: ![[Pasted image 20240305173358.png]]
- page tables also have a base register to indicate the starting address of the physical page table in the physical memory, so pulling a page is done in 2 steps: ![[Pasted image 20240305173712.png]]
#### Page table size calc
![[Pasted image 20240305173845.png]]

#### Hierarchical Page Table
![[Pasted image 20240305174043.png]]
- thus, given p1,p2 = 10 bits each, and offset is 12 bits: size > 4 MB ![[Pasted image 20240305174259.png]]
### Translation Lookaside Buffer (TLB)
![[Pasted image 20240305174617.png]]
- caches per process, needs to flush at context switch
- we can prevent full flushes by tracking PID with the VPN/PPN mapping per process in the cache


