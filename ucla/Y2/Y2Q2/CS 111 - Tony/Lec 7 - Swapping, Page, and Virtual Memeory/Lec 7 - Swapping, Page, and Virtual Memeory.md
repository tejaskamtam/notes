[[Reading 7]]

## Swapping

What if we don’t have enough RAM?

- To handle all process’ memory needs
- Perhaps even to handle one process

Maybe we can keep some of their memory somewhere other than RAM.

Maybe on a disk, but hardwares can’t directly use code or data on a disk.

### Swapping to Disk

- an obvious strategy to increase effective memory size
- when a process yields or is blocked, copy its memory to disk
- when it is scheduled, copy it back
- if we have relocation hardware, we can put the memory in different RAM locations
- each process could see a memory space as big as the total amount of RAM

### Downsides to Simple Swapping

- if we actually move everything out, the costs of a context switch are very high
    - copy all of RAM out to disk
    - and then copy other stuff from disk to RAM
    - before the newly scheduled process can do anything
- We’re still limiting processes to the amount of RAM we actually have

## Paging

- What is paging?
- paged address translation
- paging and framentation
- paging memory management units

### How does paging work?

Divide physical memory into units of a single fixed size.

- A pretty small one, like 1-4k bytes or words
- Typically called a **page frame,** usually on cache (L1, L2, L3, etc.) and update with disk

Treat the virtual address space in the same way.

- Call each virtual unit a **page**

For each virtual address space page, store its data in one physical page frame

- ANY page frame, not one specific to this page

Use some magic per-page translation mechanism to convert virtual to physical pages.

![[/Untitled 86.png|Untitled 86.png]]

### Paging and Fragmentation

- a segment is implemented as a set of virtual pages

![[/Untitled 1 63.png|Untitled 1 63.png]]

- internal fragmentation
    - averages only 1/2 page (half of the last one)
- external fragmentation
    - completely non-existent
    - we never carve up pages

## Translation

On per page basis, we need to change a virtual address to a physical address.

- On every memory reference
- It needs to fast, so we’ll use hardware

**Memory management unit (MMU)** is a piece of hardware to preform the translation quickly.

**Page table** is a table in MMU that maps virtual address (page) to physical address (page frame)

![[/Untitled 2 55.png|Untitled 2 55.png]]

### MMU hardware

Memory Management Unit

- used to sit between CPU and bus
- but now they are typically integrated into CPU

Page table was

- originally implemented in special fast registers
- but we can’t fit large page table nowadays
    - If we have 4k pages and 64GB memory, there are 2^36/2^12=2^24=16M pages

### Handling Big Page Tables

- we can’t afford 16M of fast registers in registers
- So now they are stored in normal memory
- but we can’t afford 2 bus cycles for each memory access
    - one to look up the page table entry
    - one to get the actual data
- so we have a very fast set of MMU registers used as a cache
    - which means we need to worry about hit ratios, cache invalidation, etc.
    - TANSTAAFL

### MMU & multiple processes

There are several processes running

- so each needs a set of pages
- but if they need more pages than we physically got, so they need to go elsewhere

Some page tables on stored on the flash drive, but OS can’t run their code.

So we need to make updates to the page tables, handled by OS. Each process has a page table.

What if the current process adds or removes pages?

- Directly update active page table in memory
- Privileged instruction to flash (stale) cached entries

What if we switch from one process to another?

- Maintain separate page tables for each process
- Privileged instruction loads pointer to new page table
- A reload instruction flushes cached entries

How to share pages between multiple processes?

- Make each page table point to the same physical page
- Can be read-only or read/write sharing

## Demand paging

If we can’t keep all our pages in RAM, which ones do we put on the disk?

A process doesn’t actually need all its pages in memory to run. It only needs those it actually references. So we move pages onto and off of disk “on demand”.

MMU must support “not present” pages.

- Generates a fault/trap when they are referenced
- OS can bring in the request page and retry the faulted reference

Entire process doesn’t need to be in memory to start running

- Start each process with a subset of its pages
- Load additional pages as program demands them

Demand paging will have poor performance if most memory references require disk access, so it always ensures that the page holding the next memory reference is already there.

### Achieve Good Performance for Demand Paging

- Demand paging will perform poorly if most memory references require disk access
    - worst than swapping in all the pages at once, maybe
- so we need to make sure most don’t by ensuring that the page holding the next memory reference is already there
    - almost always

### Demand paging & locality of reference

How can we predict what pages we need in memory?

Primarily reply on **locality of reference:** code usually executes sequence of consecutive or nearby instructions.

- Most branches tend to be relatively short distances (into code in the same routine)
- We typically need access to things in the current or previous stack frame
- Many heap references to recently allocated structures
    - e.g. creating or processing a message
- No guarantees, but all three types of memory are likely of show locality of reference

### Page Faults

In some cases, page tables no longer necessarily contain pointers to pages of RAM, since they are put on disk (hard or flash) by demand paging.

When a process requests an address from a page not in RAM, CPU generates a **page fault,** which tells the system to go get it.

### Handling a page fault

Initialize page table entries to “not present”.

CPU faults if “not present” page is referenced

- Fault enters kernel, just like any other exception (trap / sys call)
- Forwarded to page fault handler
- Determine which page is required, where it resides
- Schedule I/O to fetch it, then block the process
- Make page table point at newly read-in page
- Back up user-mode PC to retry failed instruction
- Return to user-mode and try again

Meanwhile, other processes can run.

Process never crash because of page fault, but it may crash because it’s too slow.

### Demand paging performance

Page faults may block processes.

Overhead (fault handling, paging in and out)

- Process is blocked while we are reading in pages
- Delaying execution and consuming cycles
- Directly proportional to the number of page faults

Key is having the right pages in memory

- But OS can’t control which pages we read in by hardware
- Key to performance is choosing which to kick out (in virtual memory)

# Virtual memory

A generalization of what demand paging allows.

A form of memory where the system provides a useful abstraction.

- A very large quantity of memory
- For each process
- All directly accessible via normal addressing
- At a speed approaching that of actual RAM

### Basic concept

Give each process an address space of immense size

Allow processes to request segments within that space

Use dynamic paging and swapping to support that abstraction

### Why replace pages?

The goal is to have each page already in memory when a process accesses it.

Since we don’t know ahead of time what pages will be accessed (except locality of reference), we need to determine which ones to kick out.

### Page Replacement

We keep some set of all pages in memory, as many as we fit.

Under some circumstances, we need to replace one of them with another page on disk, usually when we have a page fault.

Paging hardware and MMU translation allows us to choose any page for ejection to disk.

### Optimal replacement algorithm

Replace the page in memory that will be next referenced furthest in the future

- Delays the next page fault as long as possible
- Fewer page faults per unit time = lower overhead

Since we don’t have an **oracle** (a system that perfectly predict the future, e.g. Belady’s Algorithm predicts the last page to referenced in the future), we are making an approximation.

### Approximating the optimal

Rely on locality of reference.

Note which pages have recently been used.

- Perhaps with extra bits in page tables
- Update when the page is accessed

If locality of reference holds, the page is probably going to be referenced soon.

### Candidate replacement algorithms

- Random, FIFO
- Least frequently used
- Least recently used (LRU)

LRU is the best since it asserts that near future will be like the recent past.

### Naive LRU

Each time a page is accessed, record the time.

When you need to eject, look at all timestamps and choose the one with the oldest timestamp, which is expansive.

![[/Screen_Shot_2022-04-26_at_5.33.24_AM.png|Screen_Shot_2022-04-26_at_5.33.24_AM.png]]

We need a cheap software surrogate for LRU

- No extra instructions per memory reference
- Mustn’t cause extra page faults
- Can’t scan entire list each time on replacement since it’s big

### Clock algorithms

Organize all pages in a circular list. MMU sets reference bit for the page on access and scans whenever we need another page.

- For each page, ask MMU if page’s reference bit is set
- If so, clear the reference bit in the MMU & skip this page
- If not, consider this page to be the least recently used
- Next search starts from this position, not head of the list

Use position in the scan as a surrogate for age.

No extra page faults, usually scan only a few pages.

![[/Screen_Shot_2022-04-26_at_5.35.52_AM.png|Screen_Shot_2022-04-26_at_5.35.52_AM.png]]

Clock algorithms vs LRU

- Same number of loads and replacement, but didn’t replace the same pages.
- Both are just approximations to the optimal.

# Page replacement & multiprogramming

We don’t want to clear out all the page frames on each context switch.

- When switched out process runs again, we don’t want a bunch of page faults.

So we want to share the page frames, several choices are

- Single global pool
- Fixed allocation of page frames per process
- Working set-based page frame allocations

### Single global page frame pool

Treat the entire set of page frames as a shared resource.

Approximate LRU for entire set and replace whichever process’ page is LRU.

Cons

- Bad interaction with round-robin scheduling
- The process last in scheduling queue will find all its pages swapped up, and not because he isn’t using them

### Per-process page frame pools

Set aside some number of page frames for each running process

- Use an LRU approximation separately for each

However, fixed number of pages per process is bad

- Different processes exhibit different locality
    - Which pages are needed changes over time
    - Number of pages needed changes over time
- Much like different natural scheduling intervals

We need a dynamic customized allocation.

## Working sets

Give each running process an allocation of page frames matched to its needs.

We know what each process needs are by using **working sets:** a set of pages used by a process in a fixed length sampling window in the immediate past.

- Allocate each page frames to hold each process’ working set
    - If a page has too many page faults, allocate more page frames
    - If a page isn’t use as much as allocated page frames, drop some
- Each process runs replacement within its own set

![[/Screen_Shot_2022-04-26_at_7.13.10_AM.png|Screen_Shot_2022-04-26_at_7.13.10_AM.png]]

### Optimal working sets

The optimal working set for a process is determined by the number of pages needed during the next time slice.

We will adjust the working set to optimal by observing the process’ behavior (how many pages it actually need).

### Implementing working sets

Manage the working set size

- Assign page frames to each in-memory process
- Process page against themselves in working set
- Observe paging behavior (faults per unit time)
- Adjust number of assigned page frames accordingly

**Page stealing:** drop page frames by a process when it’s not using the full allocated page frame.

- e.g. working set-clock
- Track last use time for each page, for owning process
- Find page (approximately) least recently used (by its owner)
- Processes that need more pages tend to get more
- Processes that don’t use their pages tend to lose them

## Thrashing

If sum of working set exceeds page frames (not enough memory)

- No process will have enough pages in memory

So we do **thrashing:** whenever anything runs, it will “steal” a page from another process.

- The process has a page fault one it starts running

When systems thrash, all processes run slow.

### Preventing thrashing

We usually can’t add more memory or squeeze working set sizes.

We can reduce number of competing processes

- Swap some of the ready processes out
- To ensure enough memory for the rest to run

Swapped-out processes won’t run for quite a while

- But we can round-robin which are in and which are out

## Clean vs dirty pages

Consider a page, recently paged in from disk.

- There are two copies, one on disk, one in memory

If the in-memory copy hasn’t been modified, there’s still an identical valid copy on disk.

- The in-memory copy is said to be **clean**
- Clean pages can be replaced without writing them back to disk

If the in-memory copy has been modified, the copy on disk in no longer up-to-date.

- The in-memory copy is said to be **dirty**
- If paged out of memory, must be written to disk

  

### Dirty pages & page replacement

Clean pages can be replaced at any time.

Dirty pages must be written to disk before the frame can be reused.

- A slow operation we don’t want to wait for

We could only kick out clean pages, but this would limit flexibility.

### Pre-emptive page laundering

Clean pages give memory manager flexibility.

We can increase flexibility by converting dirty pages to clean ones.

Ongoing background write-out of dirty pages.

- Find and write all dirty, non-running pages
    - No point in writing out a page that is actively in use
- On assumption we will eventually have to page out
- Make them clean again, available for replacement