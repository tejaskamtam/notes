[[Reading 6]]

### Outline

- What is memory management about?
- Memory management strategies
    - Fixed partition strategies
    - Dynamic partitions
    - Buffer pools
    - Garbage collection

## Memory management

Process needs RAM to store code and data.

All processes share RAM and memory management handles how they are using RAM.

### Memory management goals

1. Transparency
    1. Process sees only its address space
    2. Process is unaware memory is being shared
2. Efficiency
    1. High effective memory utilization
    2. Low run-time cost for allocation/relocation
3. Protection and isolation
    1. Private data will not be corrupted
    2. Private data cannot be seen by other processes

### Physical memory allocation

![[/Screen_Shot_2022-04-22_at_7.11.39_AM.png|Screen_Shot_2022-04-22_at_7.11.39_AM.png]]

Physical memory is divided between OS kernel, process private data, and shared code segments.

### Physical & virtual address

A RAM cell has a particular physical address

- Essentially a location on a memory chip

Years ago, that address was used by processes to memory memory locations

Now processes use virtual addresses

- Which is NOT a location on a memory chip
- And usually isn’t the same as the actual physical address

More flexibility in memory management, but requires virtual to physical translation.

If we have a virtual widget, we don’t actually have a real widget, but we want it to behave as if it were real

### Problems of memory management

- Most processes can’t perfectly predict how much memory they will use.
- The processes expect to find their existing data when they need it where they left it.
- The entire amount of data required by all processes may exceed amount of available physical memory
- Switching between processes must be fast
    - Can’t afford much delay for copying data
- The cost of memory management itself must not be too high

# Memory management strategies

- Fixed partition allocations
- Dynamic partitions
- Relocation

## Fixed partition allocation

Pre-allocate partitions for n processes.

- One or more per process
- Reserving space for largest possible process

Partitions come in one or a few set sizes.

Very easy to implement.

- Common in old batch processing systems
- Allocation/deallocation very cheap and easy

Well suited to well-known job mix.

### Memory protection

Need to enforce partition boundaries.

- To prevent one process from accessing another’s memory

Could use hardware for this purpose.

- Special registers that contain the partition boundaries
- Only accept addresses within the register values

![[/Screen_Shot_2022-04-22_at_7.25.41_AM.png|Screen_Shot_2022-04-22_at_7.25.41_AM.png]]

Basic scheme doesn’t use virtual addresses.

### Problems

- Presumes the process knows much memory it will use ahead of time
- Limits # of processes supported to the total of their memory requirements
    - Not great for sharing memory
- **Fragmentation** causes inefficient memory use

### Fragmentation

A problem that cause inefficiency in all memory management systems.

- Fixed partitions suffer it especially badly

With too much fragmentation,

- OS can’t provide memory for as many processes as you theoretically could
- There is memory waste in each partition that the memory doesn’t use

![[/Screen_Shot_2022-04-22_at_7.30.09_AM.png|Screen_Shot_2022-04-22_at_7.30.09_AM.png]]

If a new process asks for a 3MB partition, OS can’t provide it.

Average size for **internal fragmentation** (wasted memory space within a fixed partition) is actually 50% for each process.

### Pros & Cons

Pros

- Very simple

Cons

- Inflexible
- Subject to lots of internal fragmentation
- Not used in many modern systems
    - But a possible option for embedded systems where we know exactly how many memory each process need

# Dynamic partition allocation

Unlike fixed partitions, dynamic partitions counter internal fragmentations

- Variable sized, usually almost any size requested
- Each partition has contiguous memory addresses
- Processes have access permissions for the partitions
- Potentially shared between processes

Each process could have multiple partitions.

- With different sizes and characteristics

### Problems

- Not relocatable
    - Once a process has a partition, you can’t easily move its contents elsewhere since it’s still physical
- Not easily expandable
- Can’t support applications with larger address spaces than physical memory
- Still subject to fragmentation

### Relocation problem

Partitions are tied to particular address range, at least during an execution.

Can’t just move the contents of a partition to another set of addresses

- All the pointers in the contents will be wrong
- And generally you don’t know which memory locations contain pointers

### Expansion problem

Partitions are allocated on request, and may ask for new ones later.

But hard to expand because there may not be space nearby

### Solution to Expansion

So start with one large heap of memory and maintain a **free list:** Systems data structure to keep track of pieces of unallocated memory

When a process requests more memory:

- Find a large enough chunk of memory
- Carve off a piece of the requested size
- Put the remainder back on the free list

When a process frees memory, put freed memory back on the free list.

### Managing the free list

Fixed sized blocks are easy to track.

- A bit map indicating which blocks are free

Variable chunks require more information:

- A _linked list_ of descriptors, one per chunk
- Each descriptor lists the size of the chunk and whether it is free
- Each has a pointer to the next chunk on the list
- Descriptors often kept at the front of each chunk

![[/Untitled 85.png|Untitled 85.png]]

### Free chunk carving

1. Find a large enough free chunk
2. Reduce its length to the requested size
3. Create a new header for the residual chunk
4. Insert the new chunk into the list
5. Mark the carved piece as in use

### Variable partitions & fragmentations

Variable sized partitions not as subject to internal fragmentation

- Unless requestor asked for more than it will use, which is actually pretty common
- But at least memory manager give him no more than it requested (vs fixed partition)

Unlike fixed sized partition though, has a problem to another kind of fragmentation called **external fragmentation.**

## External fragment

Each allocation creates left-over free chunks.

- Over-time they become smaller and smaller, which become useless
- This is a second form of fragment waste besides fixed partition

![[/Screen_Shot_2022-04-22_at_10.24.43_AM.png|Screen_Shot_2022-04-22_at_10.24.43_AM.png]]

Solutions:

- Try not to create tiny fragments
- Try to recombine fragments into big chunks

## Avoid creating small fragments

Be smart about which free chunk of memory you use to satisfy a request:

- Best fit
- Worst fit
- First fit
- Next fit

But being smart costs time.

### Best fit

Search for smallest size greater than or equal to requested size

Pros

- Might find a perfect fit

Cons

- Have to search entire list every time
- Quickly creates very small fragments

### Worst fit

Search for the largest size greater than or equal to requested size.

Pros

- Tends to create very large fragments (for a while, at least)

Cons

- Still have to search entire list every time

### First fit

Take first chunk you find that is big enough

Pros

- Very short searches
- Creates random sized fragments

Cons

- The first chunks quickly fragment
- Searches become longer
- Ultimately it fragments as badly as best fit

### Next fit

![[/Screen_Shot_2022-04-22_at_10.43.50_AM.png|Screen_Shot_2022-04-22_at_10.43.50_AM.png]]

Tries to get advantages of both worst and best fit.

- Short searches (maybe shorter than first fit)
- Spreads out fragmentation (like worst fit)

Guess pointers are a general technique

- If they are right, they save a lot of time
- If they are wrong, the algorithm still works
- They can be used in a wide range of problems

This random technique can be use in many place in OS

- Don’t start at the same time, start at different place to save time and allocate resources fairly

# Solutions to external fragmentations

## Coalescing partitions

All variable sized partition allocation algorithms have external fragmentation.

We need a way to reassemble fragments

- Check neighbors whenever a chunk is freed
- Recombine free neighbors whenever possible
- Free list can be designed to make this easier
    - e.g. where are the neighbors of this chunk?

### Fragmentation & Coalescing

Opposing processes that operate in parallel

- What fraction of space is typically allocated?
    - Coalescing works better with more free space
- How fast is allocated memory turned over?
    - Chunks held for long time can’t be coalesced
- How variable are requested chunk sizes?
    - High variability increases fragmentation rate
- How long will the program execute?
    - Fragmentation gets worse with time

### Variable sized partition summary

- Eliminate internal fragmentation
    - Each chunk is custom-made for requestor
- Implementation is more expensive
    - Long searches of complex free lists
    - Carving & coalescing
- External fragmentation is inevitable
    - Coalescing can counteract the fragmentation

### Not random distributed memory request sizes

In real systems, some sizes are requested much more often than others.

![[/Screen_Shot_2022-04-22_at_7.33.20_PM.png|Screen_Shot_2022-04-22_at_7.33.20_PM.png]]

Many key services use fixed-size buffers:

- File systems (for disk I/O)
- Network protocols (for packets assembly)
- Standard request descriptors

These account for much transient use

- They are continuously allocated and freed

OS might want to handle them differently

## Buffer pools

If there are popular sizes

- Reserve special pools of fixed size buffers
- Satisfy matching requests from those pools

Improve efficiency

- Much simpler than variable partition allocation
    - Eliminates searching, carving, coalescing
- Reduces (or eliminates) external fragmentation

But we must know how much to reserve

- Too little: the buffer pool becomes a bottleneck
- Too much: we have a lot of unused buffer space

Only satisfy perfectly matching requests

- Otherwise, back to internal fragmentation

### How to use

Process requests a piece of memory for a special purpose.

- e.g. to send a message

System supplies one element from buffer pool.

Process uses it, completes, frees memory

- Maybe explicitly
- Maybe implicitly, based on how much buffer space is used
    - e.g. sending the message will free the buffer once the message is sent

### Dynamically sizing buffer pools

If we run low on fixed sized buffers

- Get more memory from the free list
- Carve it up into more fixed sized buffers

If our free buffer list gets too large

- Return some buffers to the free list

If the free list gets dangerously low

- Ask each major service with a buffer pool to return space

This can be tuned by few parameters:

- Low space (need more) threshold
- High space (have too much) threshold
- Nominal allocation (what we free down to)

Resulting system is highly adaptive to changing load

### Lost memory

One problem with buffer pools is memory leaks.

- The process is done with the memory but doesn’t free it

Also a problem when a process manages its own memory space.

- e.g. It allocates a big area and maintains its own free list

Long running processes with memory leaks can waste huge amounts of memory.

## Garbage collection

One solution memory leaks.

- Don’t count on processes to release memory
- Monitor how much free memory we’ve got

When we run low, start garbage collection

1. Search data space finding every object pointer
2. Note address/size of all accessible objects
3. Compute the complement (what is inaccessible)
4. Add all inaccessible memory (that processes are no long using) to the free list

### Find accessible memory

Object oriented languages often enable this

- All object references are tagged
- All object descriptors include size information

It is often possible for system resources.

- Where all possible references are known
    - e.g. we know who has which files open

However, in general case (e.g. C):

1. Find all the pointers in the allocated memory
2. Determine “how much” each points to
3. Determine what is and is not still pointed to
4. Free what isn’t pointed to

### Problems

A location in the data or stack segments might seem to contain address, but

- Are they truly pointers, or might they be other data types whose value happen to resemble addresses?
- If pointers, are they themselves still accessible?

We might be able to infer this (recursively) for pointers in dynamically allocated structures, but not statically allocated areas.

## Compaction & Relocation

Garbage collection is just another way to free memory

- Doesn’t greatly help or hurt fragmentation

Ongoing activity can starve coalescing

- Chunks reallocated before neighbors become free

We could stop accepting new allocations

- But processes need more memory would block until some is freed, slowing the system

We need a way to rearrange active memory

- Re-pack all process in one end of memory
- Create one big chunk of free space at the end of memory

### Relocation

The problem with relocation is that all addresses in the program will be wrong.

- References in the code segment
    - Calls and branches to other parts of the code
    - References to variables in the data segment
- Plus new pointers created during execution
    - That point into data and stack segments

### Problem with Relocation

It is not generally feasible to relocate a process since we could never find all address references

- e.g. Pointer to a head of linked list, the rest is elsewhere
- Like the general case of garbage collection

We must make processes location independent, which is where **virtual memory** comes in.

## Virtual memory

### Virtual address space

![[/Screen_Shot_2022-04-22_at_8.10.00_PM.png|Screen_Shot_2022-04-22_at_8.10.00_PM.png]]

### Memory segment relocation

- A natural model
    - process address space is made up of multiple segments
    - use the segment as the unit of relocation
    - long tradition, from the IBM system 360 to Intel x86 architecture
- computer has special relocation registers
    - they are called segment base registers
    - they point to the start in physical memory of each segment
    - CPU automatically adds base register to every address
- OS uses these to perform virtual address translation
    - Set base register to start of physical memory where program is loaded
    - If program is moved, reset base registers to new location
    - Program works no matter where its segments are loaded

![[/Untitled 1 62.png|Untitled 1 62.png]]

The translation: **physical address = virtual address + segment base register value**

The translation happens in hardware (to remain fast speed to access memory), which is not visible to the program.

When memory of stack segment is moved physically, the virtual address doesn’t change, just change the value of the stack segment base register.

### Types of segments

- code: sharable, non-writable, fixed size, loaded by OS at exec time
- data: process-private, read/write, size changed by system call
- stack: process-private, read/write, size automatically managed by OS

### Relocation & safety

We need protection to prevent process from reaching outside its allocated memory

Segments also need a **bound** register to specify length of a segment

- Specifies max legal offset (from start of segment)
- Can be changed by OS, e.g. to increase the size of a stack segment
- Attempt to access any address greater than this will raise a **segmentation fault** exception (trap) by OS

Although we can relocation memory, processes still requires contiguous chunks of data for segments.

- So external fragmentation is still a problem

So we need to get rid of the requirement of contiguous segments, which is handled by the modern-days **virtual memory system** (lec 6).