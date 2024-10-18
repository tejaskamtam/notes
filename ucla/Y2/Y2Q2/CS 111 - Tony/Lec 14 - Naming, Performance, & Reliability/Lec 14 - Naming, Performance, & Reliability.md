## Free space & allocation issues

- How do I keep track of a file system’s free space?
- How do I allocate new disk blocks when needed?
    - And how do I handle deallocation?

### Allocation/deallocation problem

A need to maintain a free list of unused disk blocks.

In memory, we have free lists.

- Primarily for variable sized partitions

However,

- Free blocks in disk are fixed size blocks
- For hard disks, locality matters
- For flash, there are issue of erasure and load leveling

### Create a file

Allocate a free file control blocks.

- For UNIX
    - Search the super-block free Inode list
    - Take the first free Inode
- For DOS
    - Search the parent directory for an unused directory entry

Initialize the new file control block.

- With file type, protections, ownership, …

Give new file a name.

### Extend a file

Applications requests new data be assigned to a file.

- May be an explicit allocation/extension request
- May be implicit (e.g. write to a currently non-existent block)

Find a free chunk of space.

- Traverse the free list to find an appropriate chunk
- Remove the chosen chunk from the free list

Associate it with the appropriate address in the file

- Go to appropriate place in the file or extent descriptor
- Update it to point to the newly allocated chunk

### Delete a file

Release all the space that is allocated to the file.

- For UNIX, return each block to the free block list
- DOS doesn’t free space
    - Uses garbage collection
    - Search out deallocated blocks and add them to the free list at some future time

Deallocate the file control lock.

- For UNIX, zero inode and return it to free list
- For DOS, zero the first byte of the name in the parent directory
    - Indicating that the directory entry is no longer in use

### Free space maintenance

File system manger manages the free space.

Getting/releasing blocks should be fast operations.

- They are extremely frequent
- We’d like to avoid doing I/O as much as possible

Unlike memory, it matters which block we choose.

- Can’t write fully-written flash blocks
- May want to do wear-levelling and keep data contiguous
- Other issues for hard disk drives

Free-list organization must address both concerns

1. Speed of allocation & deallocation
2. Ability to allocate preferred device space

## Other performance improvements strategies

- Beyond disk layout issues
    - Only relevant for hard drives, not flash or other devices
- Transfer size
- Caching

### Allocation/transfer size

Per operation overheads are high.

- DMA startup, interrupts device-specific costs

Large transfer units are more efficient.

- Amortize fixed per-op cost over more bytes/op
- Multi-MB transfers are very good

What unit do we use to allocate storage space?

- Small chunks reduce efficiency
- Large fixed size chunks → internal fragmentation
- Variable sized chunks → external fragmentation
- Tradeoff between fragmentation and efficiency

### Flash drive issues

Flash is becoming the dominant technology.

- Sales predicted to overtake HDD by 2021

Special flash characteristics:

- Faster than hard disks, slower than RAM
- Any location equally fast to access
- But write-once/read-many access
    - Until you erase
- Can only erase very large chunks of memory

## Caching

### Read caching

Persistent storage I/O takes a long time.

- Deep queues, large transfers improve efficiency
- But don’t make it significantly faster

We must eliminate much of our persistent storage I/O.

- Maintain an in-memory cache
- Depend on locality, reuse of the same blocks
- Check cache before scheduling I/O

### Read-ahead

Request blocks from device before process asked for them.

- Reduces process wait time

When does it make sense?

- When client specifically requests sequential access
- When client seems to be reading sequentially

What are the risks

- May waste device access time reading unwanted blocks
- May waste buffer space on unneeded blocks

### Write caching

Most device writes go to a write-back cache.

- They will be flushed out to the device later

Aggregates small writes into large writes.

- If application does less than full block writes

Eliminates moot writes.

- If application subsequently rewrites the same data
- If application subsequently deletes the file

Accumulates large batches of writes.

- A deeper queue to enable better disk scheduling

### Common types of disk caching

- General block caching
    - Popular files that are read frequently
    - Files that are written and then promptly re-read
    - Provides buffers for read-ahead and deferred write
- Special purpose caches
    - Directory caches speed up searches of same directories
    - Inode caches speed up reuses of same files
- Special purpose caches are more complex
    - But they often work much better by matching cache granularities to actual needs

# Naming in file systems

Each file needs some kind of handle to allow us to refer to it.

Low level names (like inode numbers) aren’t usable by people or even programs.

We need a better way to name our files.

- User friendly
- Allowing for easy organization of large number of files
- Readily realizable in file systems

### File names & binding

The file system must handle name-to-file mapping.

- Associating names with new files
- Finding the underlying representation for a given name
- Changing names associated with existing files
- Allowing users to organize files using names

**Name spaces**: the total collection of all names known by some naming mechanisms.

- Sometimes means all names that could be created by the mechanism

## Name space structure

There are many ways to structure a name space.

- Flat name spaces
    - All names exist in a single level
- Graph-based name spaces
    - Can be a strict hierarchical tree
    - Or a more general graph (usually directed)

### Issues in name space structure

How many files can have the same name?

- One per file system: flat name spaces
- One per directory: hierarchical name spaces

How many different names can one file have?

- Only one “true name”, but aliases are allowed
- Arbitrarily many

Do different names have different characteristics?

- Does deleting one name make others disappear too?
- Do all names see the same access permissions?

### Hierarchical name spaces

Essentially a graphical organization.

Typically organized using directories.

- A file containing references to other files
- A non-leaf node in the graph
- It can be used as a naming context
    - Each process has a current directory
    - File names are interpreted relative to that directory

Nested directories can form a tree.

- A file name describes a path through that tree
- The directory tree expands from a root node
    - A name beginning from root is called **fully qualified**
- May actually form a directed graph
    - If files are allowed to have multiple names

A rooted directory tree

![[/Screen_Shot_2022-06-03_at_6.38.36_PM.png|Screen_Shot_2022-06-03_at_6.38.36_PM.png]]

### Directories are files

Directories are a special type of file.

- Used by OS to map file names into the associated files

A directory contains multiple directory entries.

- Each directory entry describes one file (can be another directory) and its name

User applications are allowed to read directories.

- To get information about each file
- To find out what files exist

Usually only OS is allowed to write them.

- Users can cause writes through special system calls
- The file system depends on the integrity of directories

Moving up the hierarchy is often useful.

- Directories usually have a special entry for parent
- Many file systems use the name “..” for that

### File names vs Path names

In some name space systems, file have “true names”.

- Only one possible name for a file
- Kept in a record somewhere

e.g. In DOS, a file is described by a directory entry.

- Local name is specified in that directory entry
- Fully qualified name is the path to that directory entry
    - e.g. start from root, to user_3, to dir_a, to file_b

What if files had no intrinsic names of their own?

- All names came from directory paths

## Unix directories

Unix file system allows multiple file names

- There is no single true file name, unlike DOS

File names separated by slashes.

- e.g. /user_3/dir_a/file_b

The actual file descriptors are the inodes.

- Directory entries only point to inodes
- Association of a name with an inode is called a **hard link**
- Multiple directory entries can point to the same inode

Contents a Unix directory entry

- Name (relative to this directory)
- Pointer to the inode of the associated file

![[/Screen_Shot_2022-06-03_at_6.47.30_PM.png|Screen_Shot_2022-06-03_at_6.47.30_PM.png]]

### Links to files in Unix

Links relate to files by names only.

All other metadata is stored in the file inode.

- File owner sets file protection (e.g. read-only)

All links provide the same access to file.

- Anyone with read access to file can create new link
- But directories are protected files too
    - Not everyone has read or search access to every directory

All links are equal.

- There is nothing special about the first or owner’s link

File exist under multiple names.

- The file exist as long as at least one name existing
- Implying that we must maintain a reference count of links
    - In the file inode, not in a directory

Unix hard link example

![[/Screen_Shot_2022-06-03_at_11.49.17_PM.png|Screen_Shot_2022-06-03_at_11.49.17_PM.png]]

  

![[/Screen_Shot_2022-06-03_at_11.49.40_PM.png|Screen_Shot_2022-06-03_at_11.49.40_PM.png]]

### Symbolic links

A different way of giving files multiple names.

Symbolic links implemented as a special type of file.

- An indirect reference to some other file
- Contents is a path name to another file

File system recognizes symbolic links.

- Automatically opens associated file instead
- If file is inaccessible or non-existent, the open fails

Symbolic link is not a reference to the inode.

- Symbolic links don’t prevent deletion or update link count
- Don’t guarantee ability to follow the specified path
- Internet URLs are similar to symbolic links

![[/Screen_Shot_2022-06-03_at_11.52.32_PM.png|Screen_Shot_2022-06-03_at_11.52.32_PM.png]]

# File system reliability issues

### File system reliability

What can go wrong in a file system?

Data loss

- File or data is no longer present
- Some/all of data can’t be correctly read back

File system corruption

- Los free space
- References to non-existent files
- Corrupted free list multiply allocates space
- File contents over-written by something else
- Corrupted directories make files unfindable
- Corrupted inodes lose file info/pointers

### File system - system failures

Caused by system crashes or OS bugs.

Queued writes that don’t get completed.

- Client writes or creates that will not be persisted
- Partial multi-block file system updates

Can also be caused by power failures

- Solution: NVRAM disk controllers, uninterruptable power supply (UPS)

### Deferred writes

A worst case scenario.

Process allocates a new block to file A.

- We get a new block x from the free list
- We write out the updated inode for file A
- We defer free list write-back (happens all the time)

The system crashes, and after it reboots

- A new process wants a new block for fileB
- We get block x from the (stale) free list

Two different files now contain the same block.

- When file A is written, file B gets corrupted
- When file B is written, file A gets corrupted.

## Safe write issue

Applications make system calls to perform writes.

When system call returns, the application (and user) expect the write to be “safe”.

- Persist even if system crashes

We can block the writing application until really safe.

- But that might block application for quite a while

Since crashes are rare, persistence failure caused by them are also rare.

- Accept big performance penalties for occasional safety?

### Buffered writes

Don’t wait for the write to actually be persisted.

- Keep track of the write in RAM
- Tell the application it’s OK
- At some later point, actually write to persistent memory

Pros

- Less application blocking
- Deeper and optimizable write queues

Cons

- No safe writes when a crash happens

## Potential solutions to safe write issues

### Ordered writes

Carefully ordered writes can reduce potential damage.

Write out data before writing pointers to it.

- Unreferenced objects can be garbage collected
- Pointers to incorrect info are more serious

Write out deallocations before allocations.

- Disassociate resource from old files ASAP
- Free list can be corrected by garbage collection
- Improperly shared data is more serious than missing data

### Practicality of ordered writes

- Greatly reduce I/O performance
    - Eliminates accumulation of nearby operations
    - Eliminates consolidation of updates to same block
- May not be possible
    - Modern devices may reorder queued requests
- Doesn’t actually solve the safe writes problem
    - Doesn’t eliminate incomplete writes
    - Chooses minor problems over major ones

### Audit & Repair

Design file system structures for audit and repairs.

Redundant information in multiple distinct places.

- Maintain reference counts in each object
- Children have pointers back to their parents
- Transaction logs of all updates
- All resources can be garbage collected

Audit file system for correctness prior to **mount**: initialize a file system and makes it available for use.

- All objects are well formatted
- All references and free lists are correct and consistent

Use redundant info to enable automatic repair.

### Practicality of audit & repair

- Integrity checking a file system after a crash.
    - Verifying check-sums, reference counts, etc.
    - Automatically correct any inconsistencies
    - A standard practice for many years (using `fsck(8)` in Unix)
- No longer practical
    - Checking a 2TB FS at 100MB/sec = 5.5 hours
- We need more efficient partial write solutions
    - File systems that are immune to them
    - File systems that enable very fast recovery

## Journaling

Create a circular buffer journaling device.

- Journal writes are always sequential
- Journal writes can be batched
- Journal is relatively small, may use NVRAM

Journal all intended file system updates.

- Inode updates, block write/alloc/free

Efficiently schedule actual file system updates.

- Write-back cache, batching, motion-scheduling

Journal completions when real writes happen.

### Batched journal entries

Operation is safe after journal entry persisted.

- Caller must wait for this to happen

Small writes are still inefficient.

- Accumulate batch until full or max wait time

![[/Screen_Shot_2022-06-04_at_12.19.20_AM.png|Screen_Shot_2022-06-04_at_12.19.20_AM.png]]

### Journal recovery

Journal is a small circular buffer.

- It can be recycled after old ops have completed
- Timestamps distinguish new entries from old

After system restart…

- Review entire (relatively small) journal
- Note which ops are known to have completed
- Perform all writes not known to have completed
    - Data and destination are both in the journal
    - All of these write operations are idempotent
- Truncate journal and resume normal operation

### Why does journaling work?

Journal writes are much faster than data writes.

- All journal writes are sequential

In normal operation, journal is write-only.

- File system never reads/processes the journal

Scanning the journal on restart is very fast.

- It’s very small compared to the file system
- It can read sequentially with huge efficient reads
- All recovery processing is done in memory

Journal pages may contain information for multiple files.

- Performed by different processes and users

### Metadata-only journaling

Why journal metadata?

- It’s small and random (very I/O inefficient)
- It’s integrity-critical (huge potential data loss)

Why not journal data?

- It’s often large and sequential (I/O efficient)
- It would consume most of journal capacity bandwidth
- It’s less order sensitive (just precede meta-data)

Safe metadata journaling.

- Allocate new space for the data, write it there
- Then journal metadata updates

### Log structured file systems

The journal _is_ the file system.

- All inode and data updates written to the log
- Updates are **redirect-on-write**
    - Don’t overwrite old data
    - Write it elsewhere and change the metadata (inode) pointer to it
- An in-memory index caches inode locations

Becoming a dominant architecture.

- Flash file systems
- Key/value stores

Issues

- Recovery time (to reconstruct index/cache)
- Log defragmentation and garbage collection

### Navigating a logging file system

Inodes point at data segments in the log

- Sequential writes may be contiguous in log
- Random updates can be spread all over the log

Updated inodes are added to end of log.

Index points to latest version of each inode.

- Index is periodically appended to the log

Recovery

- Find and recover the latest index
- Replay all log updates since then

### Redirect on write

Many modern file systems now do this

- Once written, blocks and inodes are immutable (work very nicely for flash devices)
- Add new info to the log and update the index

The old inodes and data remain in the log.

- If we have an old index, we can access them
- Clones and snapshots are almost free

Price is management and garbage collection.

- We must inventory and manage old versions
- We must eventually recycle old log entries