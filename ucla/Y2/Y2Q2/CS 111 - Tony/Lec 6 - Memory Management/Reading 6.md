[https://pages.cs.wisc.edu/~remzi/OSTEP/vm-intro.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-intro.pdf)

### Address Space

### Memory Virtualization

- transparency
- efficiency
- protection

[https://pages.cs.wisc.edu/~remzi/OSTEP/vm-api.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-api.pdf)

## Memory API

### stack memory

handled for you by compiler

### heap memory

handled by you

### malloc() call

### free()

### Garbage Collector

[https://pages.cs.wisc.edu/~remzi/OSTEP/vm-mechanism.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-mechanism.pdf)

## Address Translation

### Base and Bounds, aka dynamic relocation

- base and bounds registers can be changed

### OS Requirement:

- memory menagement
- base/bounds management
- exception handling

[https://pages.cs.wisc.edu/~remzi/OSTEP/vm-segmentation.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-segmentation.pdf)

## Segmentation

[https://pages.cs.wisc.edu/~remzi/OSTEP/vm-freespace.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/vm-freespace.pdf)

## Free Space Management

### splitting + coalescing

include header block to indicate size for allocator

### Allocation Strategies

Best Fit

Worst Fit

First Fit

Next Fit

Segregated list, buffer pool

Binary buddy allocator

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/gc_defrag.html#GC](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/gc_defrag.html#GC)

## Garbage Collection

Garbage Collection +

• resources are allocated, and never explicitly freed  
• when the pool of available resources becomes dangerously small, the system initiates garbage collection:  
1. begin with a list of all of the resources that originally existed.  
2. scan the process to find all resources that are still reachable.  
3. each time a reachable resource is found, remove it from the original resource list.  
4. at the end of the scan, anything that is still in the list of original resources, is no longer referenced by the process, and can be freed.  
5. after freeing the unused resources, normal program operation can resume.

Defragmentation