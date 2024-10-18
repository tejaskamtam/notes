### What is a virtual machine?

A **virtual machine** is a software illusion meant to appear to be a real machine.

We have an actual computer…

- We do something in software to make it appear to apps and users like we have multiple computers

![[/Screen_Shot_2022-06-05_at_12.56.28_AM.png|Screen_Shot_2022-06-05_at_12.56.28_AM.png]]

### How do we make a VM?

We use the real hardware to implement the virtual hardware.

- Instructions for the CPU run on the real CPU
- Real RAM stores the data for virtual RAM
- A real disk stores data for the virtual disk
- etc.

## Why do we want virtual machines?

For several reasons

- Fault isolation
- Better security
- To use a different OS
- To provide better controlled sharing of the hardware

### Fault isolation

OS must never crash…

- But crashing a VM’s OS doesn’t take down the entire machine, just the VM

So our correctness requirements can be relaxed.

Similar advantages for faults that could damage devices.

- They damage VM, not the physical

### Better security

OS is supposed to provide security for processes.

But OS also provides shared resources.

- e.g. file system, IPC channels

VM doesn’t need to see the real shared resource.

- So processes in VMs are harder to reach and possibly damage

### Using a different OS

e.g.

- I’m using Windows, but I need to use Linux
- Windows have a different system call interface than Linux
- So I can install a Linux VM

### Sharing a machine’s resources

An OS can control how to share resources among processes.

- But actually guaranteeing a particular division of resources is hard.

It’s easier to guarantee an entire virtual machine gets a set division of resources.

- So the processes running in VM won’t steal resources from other VMs
- A very big deal for cloud computing

## How does OS run VM?

Easiest if the virtual and real machine use the same ISA.

- Tricky and probably slow, otherwise

Basically, reply on limited direct execution.

- Run as much VM activity directly on CPU as possible
- Use a VMM to trap VM

### Virtual machine monitor (VMM)

A hypervisor (controller) that handles all virtual machines running on a real machine.

- When necessary, trap from VM to VMM
- Performs whatever magic is necessary
- Then returns to limited direct execution
- Much like a process’ system call to an OS

A trap is necessary whenever VM does something privileged.

- Like when a process wants to do something privileged

### VMM in OS architecture

![[/Screen_Shot_2022-06-05_at_1.15.29_AM.png|Screen_Shot_2022-06-05_at_1.15.29_AM.png]]

![[/Screen_Shot_2022-06-05_at_1.15.38_AM.png|Screen_Shot_2022-06-05_at_1.15.38_AM.png]]

### System calls with multiple VMs

![[/Screen_Shot_2022-06-05_at_1.27.22_AM.png|Screen_Shot_2022-06-05_at_1.27.22_AM.png]]

Assume there are 3 VMs with 3 system call interfaces.

If App A makes a system call and sent directly to VMM…

- OS A can’t perform it
- VMM can’t perform the sys call correctly since it doesn’t understand OS A’s internal state

Instead, OS A traps when it makes a system call.

- But OS A can’t privileged instructions
- So VMM catches the trap and does the instruction for A
    - Since it knows where A’s trap table is located

The key point is the VMM controls what happens

- Even though OS in the VM thinks it’s in control
- VMM might not decide to do the privileged instruction asked by OS A
    - e.g. If it tries to access another VM’s memory
    - e.g. VMM might block VM A and run VM B for a while

### Virtualize memory

![[/Screen_Shot_2022-06-05_at_1.35.15_AM.png|Screen_Shot_2022-06-05_at_1.35.15_AM.png]]

Virtual OS thinks it has physical memory addresses.

- Instead it provides virtual memory addresses to its processes
- And handles virtual-to-physical translations

VMM has machine addresses.

- Which it translates to physical addresses within a single VM
- Still use the same paging hardware as the actual OS

Translation example

1. App A issues virtual address X, but causes a TLB miss and a trap, which OS A catches and sends to VMM
2. VMM invokes back OS A since only OS A understands App A’s virtual page table
3. VMM gets the virtual address X in App A’s page table and tries to install the physical page number fo X in TLB…which causes another trap to VMM

### Penalties of virtualizing memory

TLB misses are much more expensive.

- Since we move back and forth from privileged mode to unprivileged
- Paying overhead costs each time
- Run more system code
- Extra paging structures in VMM

VM are thus likely to suffer performance penalties.

### Making VM perform better

- Add special hardware
    - Some CPUs have features to make issues of virtualizing CPU and memory cheaper
- Paravirtualization
    - The basic VM approach assumes the virtual OS in VM don’t know about virtualization
    - If you make some changes to those virtual OS, they can help make virtualization cheaper

### VM & cloud computing

Cloud computing is about sharing hardware among multiple customers.

- Everyone runs in a VM
- Some customers have many VMs to handle bigger jobs

Since customers’ work loads fluctuate…

- Cloud computing companies want the efficient packing of VMs onto physical machines possible
- e.g. If VM X in machine A is running too slowly, move the work to lightly loaded physical machine B

### VM migration

Move VM(s) from a server to another.

VM migration must be…

- Invisible
    - On observable interruption of service
    - Must work the same on the new server
- Fast
    - A VM might be large
    - Burning resources to move it

## Approaches of VM migration

### Copy bits

Simply copy bits to another machine.

- And thus the same virtual machine

Assume both machines are of the same time

- ISA, memory, etc.
- They will be since cloud computing companies have lots of same machines

But…

- The program running in VM on the old machines may change some bits
    - As does the system software in VM
- Moving lots of bits across the network isn’t quick
    - So there will be lots of time for bits to change

There’re are 3 approaches to deal with this complication.

### Non-live migration

Freeze VM during migration.

- The bits don’t change
- But VM doesn’t run

Pros

- Simple and safe
- Predictable delay
- Predictable amount of data moved

Cons

- Long halts
- May move more than needed
- Uses resources on both machines till migration completes

### Pre-copy migration

Move bits starting at one time, then iterate until no move changes.

- Running on the old machine till done

Pros

- Job is (almost) always running

Cons

- Unpredictable completion time
- Uses resources on both machines till migration completes
- May use un predictable amount of network resources
- Short period when job isn’t running

### Post-copy migration

Move minimum bits as of one time, then pull over whatever else you need.

- Starting on new server at once

Pros

- Minimizes amount of data to move
- Predictable maximum of network resources used

Cons

- Uses resources on both servers or unpredictable time
- Short (maybe) period at start when job isn’t running
- Migration failure can lose VM

### Push vs Pull

Push: a server is overloaded, so we move a VM to another server.

Push evens out the load among servers.

- Allow flexibility in assigning VMs to machines
- Possibly helpful in consolidating related VMs

Pull: a server is underloaded, so we move a VM from another server.

Concentrates cloud load on the smallest set servers

- Flexibility in allowing some servers to become unused
- Allows them to be put in low power mode

### Where to move A VM to?

There are several important criteria.

- Meet the user’s service level agreement (SLA)
- The new location can optimize VM’s communication
- Decrease the number of powered servers
- VM can share memory pages in the new location
- How much data must be moved to migrate the VM vs Resource needed to run others VMs at the same time

These criteria often reduces a bin packing algorithm, which tends to be NP-hard.

- N: # of servers or VM
- The more factors considered, the harder to solve

So estimation techniques are used.