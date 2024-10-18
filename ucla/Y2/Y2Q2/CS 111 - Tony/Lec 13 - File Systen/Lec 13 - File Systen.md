### Persistent data

Most systems need to store data persistently

- So it’s still there after reboot, or even power down

Typically a core piece of functionality in OS

- Even OS needs to be stored this way

### Our persistent data options

Use raw storage blocks to store the data.

- On a hard disk, flash drive, etc.
- Which make no sense to users
- Not even easy for OS developers to work with

Use a database to store the data.

- Probably more structure (and possibly overhead) than we need or can afford)

Use a file system

- Some organized way of structuring persistent data
- Which makes sense to users and programmers

## File systems

Originally the computer equivalent of a physical filing cabinet.

- Put related sets of data into individual containers
- Put them all into an overall storage unit
- Organized by some simple principle
    - alphabetically by title
    - chronologically by date

Goals to provide

- Persistence
- Ease of access
- Good performance

### The basic file system concept

Organize data into natural coherent units

- e.g. paper, spreadsheet, message, program

Store each unit as its own self-contained entity - a **file.**

- Store each file in a way allowing efficient access

Provide some simple, powerful organizing principle for the collection of files.

- Making it easy to find and organize them

### File Systems and Hardware

File systems are typically stored on hardware providing persistent memory

- Flash memory, hard disks, tapes, etc.

Performance considerations will require us to match the implementation to the hardware.

But ideally, the same user-visible file system should work on any reasonable hardware.

Until recently, file systems were designed primarily for hard disks.

- Which required many optimizations based on particular disk characters to minimize
    - seek overhead
    - rotational latency delays

Generally, disks provide cheap persistent storage at the cost of high latency.

- File system design had to hide as much of the latency as possible

### Data & Metadata

File system deal with 2 kinds of information

1. **Data**: information that file is actually supposed to store
    - e.g. instructions of the program or words in the letter
2. **Metadata**: information about the information the file stores
    - e.g. how many bytes are there and when was it created
    - Sometimes called **attributes**

Ultimately, both data and metadata∂ must be stored persistently

- And usually on the same piece of hardware

### A Further Wrinkle

- We want our file system to be agnostic to the storage medium
- the same program should access the file system the same way, regardless of medium
    - so that it is easy to write portable programs
- should work for flash drives of different types
- or if we use a hard disk instead of flash
- or if we use a RAID instead of one disk
- or if even we don’t use persistent memory at all
    - E.g. RAM file systems

## Desirable file system properties

- Persistence
- Easy use model
    - For accessing one file
    - For organizing collections of files
- Flexibility
    - No limit on number of files
    - No limit on file size, type, contents
- Portability across hardware device types
- Performance
- Reliability
- Suitable security

# Basics of file system design

- Where do file systems fit in the OS?
- File control data structures

## File systems & OS

![[/Screen_Shot_2022-06-01_at_11.12.29_PM.png|Screen_Shot_2022-06-01_at_11.12.29_PM.png]]

- File system use system calls to do operations
- **VFS (virtual file system integration layer)** performs operations using device independent block I/O (DDI)
- Devices and sockets are treated as files and performs open/close/read/write/etc. operations
    - But using different sys calls

### Layered abstractions in FS

- At the top, apps think thy are accessing files
- At the bottom, various block devices are reading and writing blocks
- There are multiple layers of abstraction in between

Why not translate directly from application file operation to devices’ block operations?

### File System API

Highly desirable to provide a single API to programers and users for all files.

- Regardless of how the file system underneath is actually implemented

A requirement if one wants program portability.

- Very bad if a program won’t work because there’s a different file system underneath

## 3 categories of system calls

- File container operations
- Directory operations
- File I/O operations

### File container operations

Standard file management system calls

- Manipulate files as objects
- These operations ignore the contents of the file

Implemented with standard file system methods

- Get/set attributes, ownership, protection…
- Create/destroy file & directories
- Create/destroy links

Real work happens in file system implementation.

### Directory operations

Directories provide the organization of a file system

- Typically hierarchical
- Sometimes with some extra wrinkles

At the core, directories translate a name to a lower-level file pointer.

Operations tend to be related to that

- Find a file by name
- Create new name/file mapping
- List a set of known names

### File I/O

- Open: use name to set up an open instance
- Read/write: read and write data to file
    - Implemented using logical block fetches
    - Copy data between user space and file buffer
    - Request file system to write back block when done
- Seek: change logical offset associated with open instance
- Map: map file into address space
    - File block buffers are just pages of physical memory
    - Map into address space, page it to and from file system

## File system layers

### Virtual file system (VFS) layer

Federation layer to generalize file systems.

- Permits rest of OS to treat all file system as the same
- Support dynamic addition of new file systems

Plug-in interface for file system implementations.

- DOS FAT, Unix, EXT3, ISO 9660, NFS, etc.7
- Each file system implemented by a plug-in module
- All implement same basic methods
    - Create, delete, open, close, link, unlink
    - Get/put block, get/set attributes, read directory, etc.

### File system layer

Desirable to support multiple different file systems

All implemented on top of block I/O

- Should be independent of underlying devices

All file systems perform same basic functions.

- Map names to files
- Map <file, offset> into <device, block>
- Manage free space and allocate it to files
- Create and destroy files
- Get and set file attributes
- Manipulate the file name space

### Why multiple file systems?

There may be multiple storage devices

- e.g. hard disk & flash drive
- They might benefit from very different file systems

Different file systems provide different services, despite the same interface.

- Differing reliability guarantees
- Differing performance
- Read-only vs read/write

Different file systems used for different purposes

- e.g. a temporary file system

### Block I/O devices

File system typically sit on a general block I/O layer.

- Make all disks look the same

Implements standard operations on each block device.

- Asynchronous read/write (physical block #, buffer, byte count)
- Map logical block number to device address
    - e.g. logical block number to <cylinder, head, sector>

Encapsulate all particulars of device support.

- I/O scheduling, initiation, completion, error handlings
- Size & alignment limitations

### Why device independent block I/O?

A better abstraction than generic disks.

Allows unified LRU buffer cache for disk data.

- Hold frequently used data until it’s needed again
- Hold pre-fetched read-ahead data until it’s requested

Provides buffers for data re-blocking.

- Adapting file system block size to device block size and user request sizes

Handles automatic buffer management.

- Allocation, deallocation
- Automatic write-back of changed buffers

### Why do we need cache?

File access exhibits a high degree of reference locality at multiple levels:

- Users often read and write parts of a single block in small operations, reusing that block
- Users read and write the same files over and over
- User often open files from the same directory
- OS regularly consults the same meta-data blocks

### Why a single block I/O cache?

A single cache is more efficient when multiple users access the same file.

- Provides a better hit ratio than several independent caches
    - Whether per process, user, or device
    - Generally true for caching, not just here

## Space management in FS

### Finding data on devices

Essentially a question of how you managed the space on your device.

Space management on a device is complex.

- There are millions of blocks and thousands of files
- Files are continuously created and destroyed
- Files can be extended after they have been written
- Data placement may have performance effects
- Poor management leads to poor performance

Must manage space assigned to each file.

### On-device file control structure

On-device description of important attributes of a file.

- Particularly where its data is located

A core design element of - virtually all file systems have such data structures.

- Different implemented, performance & abilities
- Implementation can have profound effects on what the file system can do

Paired with some kind of in-memory representation of the same information.

### Basic file control structure problem

A file typically consists of multiple data blocks.

- The control structure must be able to find them.

Problems

- Blocks can be changed
- New data can be added to the file, or old data deleted
- File can be sparsely populated
    
    - Some blocks have been written, but not all
    - The empty blocks don’t need to be allocated yet
    
    ![[/Screen_Shot_2022-06-03_at_12.16.36_AM.png|Screen_Shot_2022-06-03_at_12.16.36_AM.png]]
    
      
    

## In-memory representation

While there is an on-disk structure pointing to device blocks (and holding other information)…

When a file is opened, an in-memory structure is created.

Not an exact copy of the device version.

- The device version points to device blocks
- The in-memory version points to RAM pages
    - Or indicates that the block isn’t in memory
- Also keep track of which have been written and which aren’t

### In-memory structures & processes

What if multiple processes have the same file open? Should they share one control structure or have one each?

In-memory structures typically contain a cursor pointer.

- Indicating how far into the file data has been read/written

If cooperating processes are working with the same file, they might want to share a file cursor.

When all processes are finished with an open file, we can reclaim space used for its in-memory descriptor.

Implies a two-level solution.

1. A structure shared by all processes accessing the file
2. A structure shared by cooperating processes

### Unix approach

![[/Screen_Shot_2022-06-03_at_12.38.40_AM.png|Screen_Shot_2022-06-03_at_12.38.40_AM.png]]

Each process has a **file descriptor** describing all the files it opened.

A file descriptor has mainly three attributes used by the process

- stdin
- stdout
- stderr

Two processes can share one **open file instance descriptor.**

Two open file instance descriptors can share one **inode** (in memory file descriptors).

Each inode is mapped to an **dinode** (on-disk file descriptors).

# File system structure

How do I organize a device into a file system?

- Linked extents
    - DOS FAT file system
- File index blocks
    - Unix system V file system

## Basics of file system structure

Most file systems live on block-oriented devices, divided into fixed-size blocks.

- Many sizes are used: 512, 1024, 2048, 4096… (byte)

Most blocks will be used to store user data, and some will be used to store organizing metadata.

- Description of file system (e.g. layout & state)
- File control blocks to describe individual files
- Lists of free blocks (not yet allocated to any file)

All file systems have such data structures.

- Different OS and file systems have different goals, result in different implementations

### Boot block

The 0th block of a device is usually reserved for the **boot block**.

- Code allowing the machine to boot an OS

Not usually under the control of a file system.

- It typically ignores the boot block entirely

Not all devices are bootable.

- But the 0th block is usually reserved, “just in case”

So file systems start work at block 1.

### Managing allocated space

A core activity for a file system, with various choices.

What if we give each file the same amount of space?

- Internal fragmentation, just like memory

What if we allocate just as much as file needs?

- External fragmentation

Perhaps we should allocate space in “pages”.

- How many chunks (pages) can a file contain?
- The file control data structure determines this
    - It only has room for so many pointers, then the file is “full”

## Linked extents

A simple answer to allocate space in a file as chunks.

File control block contains exactly one pointer.

- To the first chunk of the file
- Each chunk contains a pointer to the next chunk
- Allows us to add arbitrarily many chunks to each file

Pointers can be in the chunks themselves.

- This takes away a little of every chunk
- To find chunk N, you have to read the first N-1 chunks

Or pointers can be in auxiliary “chunk linage” table.

- Faster searches, especially if table kept in memory

### DOS file systems

Microsoft use DOS file systems.

![[/Screen_Shot_2022-06-03_at_1.06.24_AM.png|Screen_Shot_2022-06-03_at_1.06.24_AM.png]]

DOS file systems divide space into **clusters.**

- Cluster size (multiple of 512) fixed for each file system
- Clusters are numbered 1 through N

File control structure points to first cluster of a file.

File allocation table (FAT), one entry per cluster.

- Contains the number of the next cluster in file
- A 0 entry means that the cluster is not allocated
- A -1 entry means “end of file”

File system is sometimes call “FAT”, after the name of this key data structure.

![[/Screen_Shot_2022-06-03_at_1.23.05_AM.png|Screen_Shot_2022-06-03_at_1.23.05_AM.png]]

### DOS file system characteristics

To find a particular block of a file:

- Get number of first cluster from directory entry
- Follow chain of pointers through FAT

Entire FAT is kept in memory.

- No disk I/O is required to find a cluster
- For very large files the in-memory search can still be long

No support for “space” files.

- If a file has a block N, it must have all blocks < n.

Width of FAT determines max file system size.

- How many bits describe a cluster address?
- Originally 8 bits, eventually expanded to 32

### Max file size in DOS

FAT table has max size.

- Kept in memory on a machine with little RAM
- Originally 4096 entries

Each cluster has max size.

- Originally 512 bytes

Original max file size = 2^12 * 2^9 = 2^21 = 4M bytes

### File index blocks

A different way to keep track of where a file’s data blocks are on the device.

A file control block points to all blocks in file.

- Very fast access to any desired block
- But how many pointers can the file control block holds?

File control block could point at extent descriptors (of bigger than block size).

- But this still gives us a fixed number of extents

### Hierarchically structured File index blocks

To solve the problem of file size being limited by entries in file index block.

- The basic file index block points to blocks
- Some of those contain pointers which in turn point to blocks

Can be point to many extents, but still a limit to how many.

- But that limit might be a very large number
- Has potential to adapt to wide range of file sizes

### Unix system V file system

Invented by Bell lab (which became AT&T) in Unix.

![[/Screen_Shot_2022-06-03_at_1.35.13_AM.png|Screen_Shot_2022-06-03_at_1.35.13_AM.png]]

![[/Screen_Shot_2022-06-03_at_1.39.19_AM.png|Screen_Shot_2022-06-03_at_1.39.19_AM.png]]

An I-node can have at most 13th block pointers.

- 1-10th Inode directly point to a single data block.
- 11th Inode points to an indirect block that contains 1024 pointers, each points to a single data blocks.
- 12th Inode points to a indirect block that points to 1024 double-indirect blocks…
- 13th Inode has triple-indirect blocks…

### Why Unix file system is a good idea?

Unix pointer structures seems complicated, but…

File sizes are not random

- The majority of files are only a few thousand bytes long

Unix approach allows us to access up to 40K bytes (assuming 4K blocks) without extra I/Os.

- However, double and triple indirect blocks must be fetched off disk

### Max file size of Unix file system

Assuming 4k bytes per block and 4 bytes per pointer.

- 10 direct blocks = 10 * 4K bytes = 40K bytes
- Indirect block = 1K * 4K = 4M bytes
- Double indirect = 1K * 4M = 4G bytes
- Triple indirect = 1K * 4G = 4T bytes

### Unix inode performance issues

Inode is in memory whenever file is open.

So the first ten blocks can be found with no extra I/O.

After that, we must read indirect blocks.

- The real pointers are in the indirect blocks
- Sequential file processing will keep referencing it
- Block I/O will keep it in the buffer cache

1-3 extra I/O operations per thousand blocks.

- Any block can be found with 3 or fewer reads

Index blocks can support sparse files.

- Not unlike page tables for sparse address spaces

  

[[Reading 13]]