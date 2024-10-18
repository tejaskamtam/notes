## Peripheral devices

Our computers typically have lots of devices attached to them.

Each device needs to have some code associated with it.

- To perform whatever operations it does
- To integrate it with the rest of the system

### Devices and performance

Most devices are very slow

- Compared to CPU, bus, RAM
- Sometimes orders of magnitude slower

Leads to challenges in managing devices

- Primarily performance challenges
- System must operate at CPU speeds, not device speeds
- But often correct application behavior requires device interactions
    - System code must handle the mismatch

### Peripheral device code and OS

Why are peripheral devices the OS’ problem?

Sometimes they can be handled in user-level code, but some of them

- Critical for system correctness
    - e.g. flash drive holding swap space
- Must be shared among multiple processes
    - e.g. wifi message signals
- Security-sensitive

### Where device driver fits in

Application at one end, and a very specific piece of hardware at the other end. OS handles everything in between.

- Web browser as application, network card as hardware

When the application sends a message, OS needs to invoke the proper device driver.

- Which feeds detailed instructions to the hardware

## Device drivers

Generally, the code for a kind of devices is pretty specific to them.

It’s basically code that drives the device

- Makes the device perform the operations it’s designed for
- Usually interacts with the rest of the system in limited, well defined ways

Linux 2.6 kernel came with over 3200 of device drivers.

- Generally written by device developers who understand the device well, but not necessarily experts on OS issues

### Abstractions and device drivers

Abstractions regularize and simplify the chaos of the world of devices.

OS defined idealized device classes.

- Flash drive, display, printer, network serial ports

Classes define expected interfaces / behaviors.

- All drivers in a same class support certain standard methods

Device drivers implement standard behaviors.

- Make diverse devices fit into a common mold
- Protect applications from device eccentricities

Drive abstractions encapsulates

- Knowledge of how to use the device
    - Map standard operations into operations on device
    - Map device states into standard object behavior
    - Hide irrelevant behavior from users
    - Correctly coordinate device and application behavior
- Knowledge of optimization
    - Efficiently perform standard operations on a device
- Fault handling
    - Understands how to handle recoverable faults
    - Prevent device faults from becoming OS faults

OS provides capabilities to plug in particular drivers in well defined ways.

### How Do Device Drivers Fit Into a Modern OS?

- there will be a lot of them
- they are pretty independent
- may need to add new ones later
- a pluggable model is typical
- OS provides capabilities to plug in particular drivers in well defined ways
- making it easy to change or augment later

### Layering device drivers

The interactions with the bus, down the bottom, are pretty standard

- How to address devices on the bus, coordinate signaling and data transfers, etc.
- Not too dependent on the device itself

The interactions with the applications, up at the top, are also pretty standard

- Typically using some file-oriented approach

In between are some very device specific things.

![[/Screen_Shot_2022-05-28_at_4.11.50_PM.png|Screen_Shot_2022-05-28_at_4.11.50_PM.png]]

Apps calls for a device, the device driver in the kernel converts the operations required by the app, sends a signal to the USB bus controller, and then the called hardware does its thing.

### Device drivers vs Core OS code

Common functionalities belong in OS.

- Caching
- File systems code not tied to a specific device
- Network protocols above physical/link layers

Specialized functionality belongs in the drivers.

- Things that differ in different pieces of hardware
- Things that only pertain to the particular piece of hardware

### Devices and Interrupts

- Devices are primarily interrupt-driven
    - drivers aren’t scheduled processes
- Devices work at a different speed than the CPU
    - typically slower
    - often much slower
- They can do their own work while the CPU does something else
- They use interrupts to get the CPU’s attention

### Devices and Busses

Devices communicate with CPU across the bus

- Devices are not connected directly to the CPU
- Both CPU and devices are connected to a bus
- Sometimes the same bus, sometimes a different bus

Bus used both to send/receive interrupts and to transfer data and commands

- Devices signal controller when they are done/ready
- When device finishes a task, controller puts interrupt on bus
- Bus then transfers interrupt to CPU, perhaps leading to movement of data

### CPU & interrupt

Interrupts look very much like traps

- Traps come from CPU
- Interrupts are caused externally to CPU

Unlike trap, interrupts can be enabled/disabled by special CPU instructions

- Device can be told when they may generate interrupts
- Interrupt may be held pending until software is ready for it

## Device performance

Key system devices limit system performance.

- File system I/O, swapping, network communication
- Much slower than CPU

If device sits idle, its throughput drops.

- Result in lower system throughput
- Longer service queues, slower response times

Delays can disrupt real-time data flows.

- Result in unacceptable performance
- Possible loss of irreplaceable data

It’s very important to keep key devices busy.

- But CPU must not be held up waiting for devices
- Start request n+1 immediately when n finishes

![[/Untitled 87.png|Untitled 87.png]]

### Improve device utilization

Exploit parallelism by letting devices operate independently of the CPU.

Modern CPUs try to avoid going to RAM

- Working with registers
- Caching on CPU itself

If things go well, CPU doesn’t use the memory bus that much.

One way to parallelize activities is to let a device use the bus instead of the CPU.

## Direct Memory Access (DMA)

Allows any two devices attached to memory bus to move data directly

- Without passing it through CPU first

Bus can only be used for one thing at a time.

- If it’s doing DMA, it’s not servicing CPU request, but often CPU doesn’t need it anyway

With DMA, data moves from device to memory at bus/device/memory speed.

### Keep key devices busy

Allow multiple requests to be pending at a time.

- Queue them, just like processes in the ready queue
- Requesters block to await eventual completions

Use DMA to perform the actual data transfers.

- Data transferred, with no delay, at device speed
- Minimal overhead imposed on CPU

When the currently active request completes,

- Device controller generates a completion interrupts
- OS accepts interrupt and calls appropriate handler
- Interrupt handler posts completion to requester
- Interrupt handler selects and initiates next transfer

![[/Screen_Shot_2022-05-31_at_3.18.45_PM.png|Screen_Shot_2022-05-31_at_3.18.45_PM.png]]

### Bigger transfers are better

![[/Screen_Shot_2022-05-31_at_3.19.15_PM.png|Screen_Shot_2022-05-31_at_3.19.15_PM.png]]

All transfers have per-operation overhead

- DMA, device, OS-related
- Instructions to set up operation
- Device time to start new operation
- Time and cycles to service completion interrupt

Larger transfers have lower overhead/byte.

## I/O & Buffering

Most I/O requests cause data to come into the memory or to copied to a device

- Which requires a place in memory, commonly called a **buffer**

Data in buffers is ready to send to a device, and an existing empty buffer is ready to receive data from a device.

- OS needs to make user buffers available when devices are ready to use them

### OS buffering issues

Fewer/larger transfers are more efficient

- May not be convenient for applications
- Natural record sizes tend to be relatively small

Operating system can consolidate I/O requests

- Maintain a cache of recently used disk blocks
- Accumulate small writes, flush out as blocks fill
- Read whole blocks, deliver data as requested

Enables read-ahead

- OS reads/caches blocks not yet requested

### Deep request queues

Having many I/O operations queued is good.

- Maintains high device utilization (little idle time)
- Reduces mean seek distance/rotational delay for disks
- May be possible to combine adjacent requests
- Can sometimes avoid performing a write at all

Ways to achieve deep queues.

- Many processes/threads making requests
- Individual processes making parallel requests
- Read-ahead for expected data requests
- Write-back cache flushing

### Double-buffered output

Two buffers exist between application and device.

- To keep device always have works to do
- e.g. If device is processing data in buffer \#2, application can fill in data to buffer \#1

![[/Screen_Shot_2022-05-31_at_3.34.58_PM.png|Screen_Shot_2022-05-31_at_3.34.58_PM.png]]

Have multiple buffers (2+) queued up, reading to write

- Each write completion interrupt starts the next write
- Only block when all buffers are full

Application and device I/O proceed in parallel

- Application queues successive writes
    - Don’t bother waiting for pervious operation to finish
- Device picks up next buffer as soon as it’s ready

If we’re I/O-bound (more CPU than output).

- Application speed up because it doesn’t wait for I/O

If we’re CPU-bound (more output than CPU)

- Device is kept busy, which improves throughput
- But eventually we may have to block the process

### Double-buffered input

![[/Screen_Shot_2022-05-31_at_3.39.45_PM.png|Screen_Shot_2022-05-31_at_3.39.45_PM.png]]

The two buffers keep application always have input back from device.

- e.g. If application is reading buffer \#1, device can fill up buffer \#2

Have multiple reads (2+) queued up

- Read completion interrupt starts read into next buffer

Filled buffers wait until application asks for them.

- Applications doesn’t have to wait for data to be read

### Scatter/Gather I/O

Many device controllers support DMA transfers.

- Entire transfer must be contiguous in physical memory

User buffers are in paged virtual memory

- So buffers may be spread all over physical memory
- **Scatter**: read from device to multiple page frames
- **Gather**: write from multiple page frames to device

Three basic approaches apply:

1. Copy all user data into physically contiguous buffer
2. Split logical request into chain-scheduled page requests
3. I/O MMU may automatically handle scatter/gather

![[/Screen_Shot_2022-05-31_at_3.45.47_PM.png|Screen_Shot_2022-05-31_at_3.45.47_PM.png]]

![[/Screen_Shot_2022-05-31_at_3.46.24_PM.png|Screen_Shot_2022-05-31_at_3.46.24_PM.png]]

### Memory mapped I/O

DMA may not always be the best way to do I/O.

- Designed for large contiguous transfers
- Some devices have many small sparse transfers
    - e.g. video game display adaptor

Instead, treat registers/memory in device as part of the regular memory space.

- Accessed by reading/writing those locations
- e.g. a bit-mapped display adapter
    - 1 M-pixel display controller, on CPU memory bus
    - Each word of memory corresponds to one pixel
    - Application uses ordinary stores to update display
- Low overhead per update, no interrupts to service
- Relatively easy to program

### Memory mapping vs DMA

DMA performs large transfers efficiently

- Better utilization of both devices and CPU
    - Device doesn’t have to wait for CPU to do transfer
- But there is considerable per transfer overhead

Memory-mapped I/O has no per-op overhead

- But every byte is transferred by a CPU instruction
    - No waiting because device accepts data at memory speed

Tradeoffs

- DMA better for occasional large transfers
- Memory-mapped better for frequent small transfers, but memory-mapped devices are more difficult to share

## Generalizing abstractions for device drivers

How do we simplify OS by leveraging commonalities between a class of devices?

### Providing abstractions

OS defines idealized device **classes**

- Flash, display, printer, tape, network, serial ports

Classes define expected interfaces/behavior, while device drivers implement standard behavior

- Make diverse devices fit into a common mold

Interfaces are key to providing abstractions.

### Device driver interface (DDI)

Standard (top-end) device driver entry-points.

- Top-end: from OS to driver
- Basis for device-independent applications
- Enables system to exploit new devices
- A critical interface contract for 3rd party developers

Some entry points correspond directly to system calls.

- e.g. open, close, read, write

Some are associated with OS frameworks.

- Flash drivers are meant to be called by block I/O
- Network drivers are meant to be called by protocols

![[/Screen_Shot_2022-05-31_at_6.20.53_PM.png|Screen_Shot_2022-05-31_at_6.20.53_PM.png]]

### Standard driver classes & clients

![[/Screen_Shot_2022-05-31_at_6.22.13_PM.png|Screen_Shot_2022-05-31_at_6.22.13_PM.png]]

### Driver/kernel interface

![[/Screen_Shot_2022-05-31_at_6.27.23_PM.png|Screen_Shot_2022-05-31_at_6.27.23_PM.png]]

Specifies bottom-end services OS provides to drivers.

- Things drivers can ask the kernel to do
- Analogous to an ABI for device driver writers

Must be very well-defined and stable.

- To enable 3rd party driver writers to build drivers
- So old drivers continue to work on new OS versions (upwards compatible)

Each OS has its own **DKI** (driver/kernel interface), but they are all similar.

- Memory allocation, data transfer and buffering
- I/O resource (e.g. ports, interrupts) management, DMA
- Synchronization, error reporting
- Dynamic module support, configuration, plumbing

## Linux device driver abstractions

Inherited from earlier Unix systems

A class-based system and several super-classes

- Block devices
- Character devices
- Some regard network devices as a third major class

Other divisions within each super-class.

### Character device superclass

Devices that read/write one byte at a time

- Character means byte, not ASCII

May be wither

- stream or record structured
- sequential or random access

Support direct, synchronous reads/writes.

- keyboards
- monitors
- most other devices except block and network superclass

### Block device superclass

Devices that deal with a block of data (usually fixed size) at a time.

- Read/write a single sized block (e.g. 4K bytes) of data at a time
- Random access
- Support queued, asynchronous reads/writes

Examples

- Hard disk
- CD
- flash
- some tapes

Such devices require some very elaborate services.

- Buffer allocation
- LRU management of a buffer cache
- Data copying services for those buffers
- Scheduled I/O
- Asynchronous completion

Important system functionality (file systems and swapping/paging) implemented on top of block I/O

- designed to provide very high performance for critical functions

### Network device superclass

Devices that send/receive data in packets.

- Originally treated as character devices
- But sufficiently different to be distinguished

Only used in context of network protocols.

- which leads to special characteristics

Examples

- Ethernet cards
- 802.11 cards
- Bluetooth devices

### Access linux device drivers

Done through file system in special files

- Files that are associated with a device instance
- LINUX use <block/character, major, minor>
    - Major number corresponds to a particular device driver
    - Minor number identifies an instance under that drive

![[/Screen_Shot_2022-05-31_at_9.40.28_PM.png|Screen_Shot_2022-05-31_at_9.40.28_PM.png]]

Opening a special file opens the associated device

- Open/close/read/write etc. calls map to calls to appropriate entry-points of the selected driver

  

[[Reading 12]]