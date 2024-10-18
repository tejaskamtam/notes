[https://pages.cs.wisc.edu/~remzi/OSTEP/file-intro.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/file-intro.pdf)

### Files and Directories

file - a linear array of bytes

directory - directory tree

File System Interface

- create files
    - open()
    - return file descriptor,
- reading and writing files
    - read()
    - write()
- reading and writing, not sequentially:
    - lseek()
- shared file table entries
    - happen with fork()
- writing immediately with fsync()
- renaming files, use rename()
- removing files, unlink()
- reading directories
- deleting directories rmdir()
- hard links, link()
- symbolic link, dangling reference
- permission bits and ACL(access control list)
- making and mounting a file system

[https://pages.cs.wisc.edu/~remzi/OSTEP/file-implementation.pdf](https://pages.cs.wisc.edu/~remzi/OSTEP/file-implementation.pdf)

### File System Implementation

- data structure
- access methods

blocks

- metadata, in inode
    - indirect pointers, refer to TA slides
    - multi level index
- inode table
- block bit map + inode bitmap
- superblock

directory organization

- use inode but store file infos in data blocks

free space management

- use bitmaps

Reading file from Disk

writing a file to disk

caching and buffering

- static partitioning
- dynamic partitioning
- unified page cache

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/filetypes.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/filetypes.html)

### File Types and Attributes

Ordinary Files

- text file
- archive
- load module
- MPEG stream

Data Types and Associated Applications

File Structure and Operations

Other types of files

- directories
- inter-process communication ports
- i/o devices

File attributes

- type
- ownership
- protection
- when the file was created
- size

Extended Attributes

Diversity of Semantics

[http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/DOS/dos.html](http://htmlpreview.github.io/?https://github.com/markkampe/Operating-Systems-Reading/blob/master/DOS/dos.html)

### Fat File System (file allocation table)

- provide reasonable performance
- successful example of linked list space allocation

structural overview

- bootstrap
- volume descriptors
- file descriptors
- free space descriptors
- file name descriptors

boot block bios parameter block and FDISK table

garbage collection

fat system is not crash proof

[https://en.wikipedia.org/wiki/Filesystem_in_Userspace](https://en.wikipedia.org/wiki/Filesystem_in_Userspace)

FUSE