[https://pages.cs.wisc.edu/~remzi/OSTEP/file-devices.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/file-devices.pdf)

### I/O devices

memory bus,

i/o bus

peripheral bus

PCIe

- A Canonical Devic
    - device needs to have
        - hardware interface
        - internal structure
    - device interface
        - status register
        - command register
        - data register
    - use interrupt so CPU can do other work
    - if the device is fast, use **polling**
    - else **interrupts**
    - if speed unknown, use **hybrid**
    - **coalescing** - combine multiple interrupts into a single interrupt delivery
- DMA

Methods of Device Interaction

- I/O instructions
- memory mapped I/O

Device driver

[https://pages.cs.wisc.edu/~remzi/OSTEP/file-disks.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/file-disks.pdf)

### Hard Disk Drives

- hard disk geometry, how it works
- single track latency
- multiple tracks: seek time
- summary: i/o to hard disk is costly

Disk Scheduling

- shortest seek time first
- elevator aka SCAN
- shortest positioning time first

scheduling problems

[https://pages.cs.wisc.edu/~remzi/OSTEP/file-raid.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/file-raid.pdf)

### Redundant Arrays of Inexpensive Disks (RAIDs)

- have multiple disks, memory, and processors
    - advantages
        - performance
        - capacity
        - reliability
        - transparent - look just like a big disk

fault model

RAID Level 0: Striping - chunk size

RAID Level 1: Mirroring

RAID level 4: saving space with parity

RAID level 5: rotating parity

[https://lasr.cs.ucla.edu/classes/111_fall16/readings/device_drivers.html](https://lasr.cs.ucla.edu/classes/111_fall16/readings/device_drivers.html)

### Device Drivers

- generalizing abstractions
- simplifying abstractions

Major Driver Classes

- block devices
- character devices

driver sub-classes

services for device drivers

Driver-kernel interface

[https://lasr.cs.ucla.edu/classes/111_fall16/readings/dynamic_modules.html](https://lasr.cs.ucla.edu/classes/111_fall16/readings/dynamic_modules.html)

### Dynamically Loaded Kernel Modules

want device drivers to be dynamically loadable

- too many possible i/o devices
- os must load required device drivers
- don’t know which drivers are required until the device is plugged in
- new devices become available
- device drivers are developed independently from the OS

need to call a factory to obtain the module

Loading a new Module

- may only need some memory space
- may need a run-time loader to load needed function

Initialization and registration

federation frame works

Unloading

- un-reigster itself as a device driver
- shut down the devices it had been managing
- return all allocated memory and I’O resources back to the OS

Criticality of Stable Interface

Hot Pluggable Device and Drivers