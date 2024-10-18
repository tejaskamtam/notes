---
course: CS 35L
area: ucla
created: 2022-10-27T19:03
updated: 2022-10-27T19:04
📕 courses:
  - "[[CS 35L- Software Construction]]"
tags: cs
---
**Week 2 Lecture Notes**

- Emacs (Continued)
- The Shell (Continued)
    - Commands and Arguments
    - The sh Program
    - Quoting
        - Single Quoting
        - Double Quoting
    - The grep Command and Pattern Matching
        - Basic Regular Expressions
        - grep Pattern Trouble
        - Extended Regular Expressions
        - Both BREs and EREs
    - The sed Command
    - The awk Command
- Files and File Systems
    - Tree Structure File System
    - Linux File Systems
        - Data Structure Representations
        - Hard Links
        - Soft Link Questions
        - Secondary Storage
    - The mv Command
    - File Permissions
    - So How Do You Update a File?
- Scripting Languages
    - History of the Python Programming Language
- Discussion Notes: ELisp Basics
    - Within Emacs
    - The Language
        - Variables
        - Expressions
        - Control Flow
        - Functions
    - Data Types
        - Numerical Types
        - List Type
        - Other Types
    - Common Functions
    - Exercises
    - Customizing Emacs
    - Concept of Pure Functions

---

# Emacs (Continued)

Emacs is built in "layers": it has a C interpreter inside it, and atop it is a Lisp interpreter. The bulk of Emacs is written in Lisp.

```
+------------------+
| Lisp code        |
+------------------+
| Lisp interpreter |
+------------------+
| C interpreter    |
+------------------+
```

The I/O devices like mouse, keyboard, and display communicate with the application through the Lisp code.

Programs typically have their own interpreters embedded in their own executables. For example, Chromium executables come with a JavaScript interpreter included in them.

# The Shell (Continued)

## Commands and Arguments

Within shell languages, the simplest commands look like

```
word0, word1, ... wordn
```

`word0` is the name of the program and `word1, ..., wordn` are the arguments to that program.

The **sub-expression** `$()` syntax allows you to write a shell command _as if you wrote the output_ of the sub-expression word for word out as the arguments to the outer command.

This can have significant edge cases like:

```
mkdir empty
cd empty
wc $(find . -type f)
```

The program then looks like it's jammed because if the sub-expression `$(find . -type f)` returns nothing, it's _as if_ you just typed the command:

```
wc
```

`wc` has defined behavior where if you did not provide any command line arguments, then it reads from stdin. Thus, the program is actually prompting the user to input something to the `wc` program.

Only caring about that last summary line, you can use the `tail` command:

```
wc $(find . -type f) | tail -n 1
```

A big part of scripting is knowing when you don't have to care about efficiency. "Your time is more important than the computer's time." This is a different paradigm then coding with algorithms and asymptotic time, etc. in mind.

## The `sh` Program

sh is the predecessor to bash (Bourne Again SH). sh was designed to work on 16-bit machines so it's a very little language. Bash adds some features in addition ot the original sh.

There is also a lot of other shell langauges ending in sh. Having so many distinct shell langauges becomes a problem, so the **POSIX standard** was created as a spec for shells.

If the name of a program does not contain any slashes, then the shell automatically looks through directories listed in the `PATH` **environment variable** to find the program name. This is why when you want to run an executable in the current directory, you have to use the `./executable` syntax:

```
$ a.out
bash: a.out: command not found
```

```
$ ./a.out
Hello world
```

Alternatively you can _append_ the current directory to the PATH:

```
PATH=$PATH:.
```

Now it would work because `a.out` is now treated like a command that's on your `PATH`:

```
$ a.out
Hello world
```

---

You can type the _null byte_ with `^@`! Alternatively, you can use `printf '\\0'` to use familiar C code and pipe that into whatever you want.

---

## Quoting

The shell itself has special characters, so you must use quoting to input what you intend to. A common use case is quoting a file name that has a space in it so the shell does not treat the space as a delimiter for arguments.

Special characters include _whitespace_ as well as:

```
` ~ # $ & * ( ) = [ ] \\ | ; ' " < > ?
```

There are two forms of quoting: single (`'`) and double (`"`).

### Single Quoting

Using single quotes makes the shell treat everything inside the quotes as a _single word_. More importantly, _every_ character inside is preserved _literally_. This means that you cannot include the single quote `'` itself because escaping is not possible.

```
$ echo 'hello\\there\\n"general kenobi"'
hello\\there\\n"general kenobi"
```

### Double Quoting

Alternatively you can use _double quotes_ to enclose "most any characters". `$` is still special, used to **interpolate** other variables or sub-expressions. Special characters are also possible with **escape sequences**, like `\\"` to represent a double quote mark itself. Interestingly, `\\n` does not work the way you would expect.

```
$ echo "hey there's\\n\\"general kenobi\\""
hey there's\\n"general kenobi"
```

Quoting can even include newlines itself (RET at the command line), but that's so controversial that it's probably going to be removed in an upcoming POSIX standard release.

## The `grep` Command and Pattern Matching

Normal invocation syntax:

```
grep PATTERN FILE1, ..., FILEn
```

If it finds a line with the PATTERN, it outputs it. So it is similar to `cat`, but more selective. In fact, if you use a pattern that matches every character, `grep` can behave identically to `cat`:

```
grep '.*' file
```

### Basic Regular Expressions

`grep` actually uses **Basic regular expressions (BREs)**, a simpler form of the more familiar regex, **extended regular expressions (EREs)**. It also only matches against single lines.

- Most printable characters like letters and numbers match themselves.
- Control characters like need to be escaped in order to match themselves e.g. `\\*` and `\\\\`.
- `.` as a control character matches every single character
- `^` matches the start of the line
- `$` matches the end of the line
- `[]` matches a single character but only those that are included in the set enclosed in the square brackets

**CAUTION**: the `*` is a **globbing pattern** to the shell, so it's interpreted with special meaning. Enclose it with _quoting_ - don't let the _arguments themselves_ be interpreted by the shell.

```
grep 'ab*c*' fo
```

### grep Pattern Trouble

Example:

```
grep '*' foo
```

This is a weird case where `*` actually matches itself instead of being treated like a quantifier. grep has some ambiguous edge cases.

But _sometimes_ grep yells at you:

```
$ grep '['
grep: Invalid regular expression
$ grep '\\['     # so just use something well-defined
```

### Extended Regular Expressions

Historically there was another team that came up with alternate syntax to the familiar grep, called egrep. Nowadays you can use the `-E` flag to specify that the pattern is using the extended syntax instead:

```
grep -E PATTERN FILE1, ..., FILEn
```

It provides some features in addition to the BREs:

- The `+` quantifier to match "1 or more occurrences," so `P+` is equivalent to `PP*`.
- The range quantifier: `P{2,5}`.
- Grouping with `()` and combining patterns with `|` to mean logical OR. This means the characters `(` `|` `)` become **meta-characters** in EREs. In BREs, they match themselves literally.

### Both BREs and EREs

- Bracket expressions `[]` are available in both standards and specify a **character set**.
- **Ranges** in bracket expressions like `[a-z]`. The `^` at the _start_ negates the set e.g. `[^a-z]`. To include the literal `^` inside the character set, put it at the end.

Within a set, these characters take on special meanings, so to match them literally:

- To match the `]`, put it at the start of the set like `[]abc]`
- To match the `^`, put it at the end of the set like `[abc^]`
- To match the , put it at the end of the set like `[abc^-]`

There are also **named character sets**:

```
[[:alpha:]]     # match every alphabetic character
[[:alpha]$/]    # match every alphabetic character of $, /
[[:alpha]$/\\]   # backslash isn't special inside a bracket
```

## The `sed` Command

A command that is a generalization of the above commands:

Short for "stream editor". sed was designed to let you edit a file of ANY size because it does not use a buffer; rather it uses a **stream**. It's a "programmable incremental editor".

**Using sed as the previous commands:**

```
sed -n '1,10p'      # head -n 10
sed -n '10q'        # head -n 10
sed -n '$p'         # tail -n 1; can't generally because sed is incremental
```

**Little language: sed commands**:

|   |   |
|---|---|
|Character|Command|
|p|print|
|q|quit|
|s|substitute|
|d|delete|

**Example: removing trailing whitespace:**

```
sed 's/[[:space:]]*$//; /^$/d'
```

The substitution pattern is:

```
s/PATTERN/REPLACEMENT/
```

## The `awk` Command

In a sense, even more general then sed. A scripting language designed to edit text. It's a programming language with variables, arrays, regular expressions, etc.

```
awk '{ x = $0; print "("x")"; }'
awk '{ if ($0 == x) print $0; x = $0 }'  # outputs duplicates
```

# Files and File Systems

## Tree Structure File System

- The model popularized by Unix and Linux.
- **Directory**: file that maps _file name_ _**components**_ to files; they are literally just look-up tables.
- **Regular files**: byte sequences (can be read from or written to, unlike directories).
- **Special files**: built into the kernel e.g. `/dev/null`.
- **Symbolic links** (aka **soft links**): single files that contain a single string that is interpreted as a file name (could be any file or directory, including another symbolic link). When using `ls -l`, you can see symbolic links with `>` pointing to their **target**.
- Every file name look-up follows the pattern: starting at the root, consult the directory table, resolving any symbolic links along the way.
- A **file name component** is a nonempty sequence of non-slash characters. The `/` character is _very special_ in the POSIX file convention because they are interpreted as part of a path in the tree file system.

---

`/dev/null` is useful for "reading nothing" or discarding output:

```
echo abc > /dev/null
```

---

**TIP:** The first flag for a file when using `ls -l` tells you the file type: `d` for directory, `l` for symbolic link, `c` for special files like `/dev/null`, `-` for regular files.

File names are not recursive by design. If you want to search for files that match the pattern like `/usr/*/emacs`, then use the `find` command:

```
find /usr/ -name emacs
```

Some special directories in the POSIX file system include `/usr` and `/usr/bin`.

Every file in the POSIX standard has a unique **inum** associated with it. You can see them with the `-i` flag in the `ls` command:

```
$ ls -idl /
2 dr-xr-xr-x. 21 root root 4096 Dec 17  2021 /
# 2 is the inum
```

## Linux File Systems

It's not _actually_ a tree, but it still does not have loops. They achieved this with the notion of **hard links**, which are like aliases for the same file in memory. The iron-clad rule is that hard links _must not point to directories_.

```
$ ls -al /usr/bin
total 373832
sdafhausegulaskhglkas .
dsafhsagkjsajhgjasjga ..
sdafkjdhsajsadhgklsda '['
```

Every directory includes links to themselves (`.`) and their parent directory (`..`). The special case is the root directory `/`, whose parent is also `/`.

File names _starting_ with slash are **absolute paths**, paths that start at the root. File names that do not start with a slash are interpreted as **relative paths**, paths starting from the **current working directory**.

Remember that the file systems are data structures that are mostly on _secondary storage_, which are _persistent_, but much MUCH slower than primary storage aka RAM. Just like RAM, file systems can have "pointers" too which reference locations on the hard drive. Thus, data structures in the file system have to be very intelligently designed in order to be efficient.

### Data Structure Representations

A directory is really just a _mapping_ of the file names components to the inodes (via inum numbers) in the file system tree.

You can visualize the file system as a graph of nodes representing file objects in memory but the file name components along the _edges_ of the graph.

The file system is not a tree, but there are some limitations enforced:

1. You cannot have two different parents with the same directory. The "tree-like" structure holds for directories.
2. However, you can have multiple links to the same non-file. Files are often identified with names, but actually names are just **paths TO** the file. You cannot in general look at a file in a file system and determine what it's "name" is because it could have multiple of them.

### Hard Links

Creating a **hard link** - "create a file named b that's the same as the file already named a":

```
ln a b
```

This is like a _mutable reference_ in C++. If you modify one, you modify the other because they're the _same file in memory_ and even share the same inum:

```
$ ln a b
$ echo "foo" > b
$ cat b
foo
$ cat a
foo
```

Hard links work because a directory as is simply a _mapping_ of file name components to files. The file names are different, and there's no rule saying different keys can't map to the same value, so everything is consistent with what the definition of a directory.

**Soft link (symbolic links)** on the other hand are actual separate data structures that have content (the string that is interpreted as the path to their target). A hard link only contributes to the directory size (expands the mapping by one entry). The underlying file remains unchanged.

Symbolic links can also point to nowhere. They can be **dangling**. When using such a pointer, the OS will try to resolve the existing path that's saved as the content of its file, but if that file no longer exists, then you get the error:

```
linkname: No such file or directory
```

A symbolic link is always interpreted _when you use it_, NOT when you create it. If a dangling symlink is pointing to a non-existent `foo`, but then you create a new file `foo`, the symlink works again.

**Destroying a File**

```
rm file
```

However, this is actually an operation on the directory, not the file in memory itself. What `rm` is doing is modifying the current directory so that `file` no longer maps to the file object it did. The contents of the file object still exist in memory. So as a continuation from above:

```
rm bar
ls -ali
# foo still shows up
```

**So how does the file system know when to reclaim the memory?**

Recursively searching every directory for any remaining hard links would be too slow.

Instead, the file system maintains a reference count called a **link count**. Associated with each file is a number that counts the number of hard links to the file i.e the number of entities that map to this file.

**IMPORTANT:** Symlinks DO NOT contribute to the link count. Link counts ONLY count hard links.

You can use this to list the link count to each file, next to the permission flags:

```
ls -li
```

**HOWEVER:** Memory cannot be reclaimed until all processes using/accessing the file are done with it.

So operations like `rm` decrements the link count. **If it's 0,** then it waits until every process accessing the file exits or closes. Only **then** can the OS reclaim the memory. And operations like `ln` _increment_ the link count (of both the original file and the new hard link).

**ALSO:** Even if the link count is 0 and no processes are working, the memory is still sitting in memory. It could be overwritten naturally by new files, but it is not guaranteed, and you must use low level techniques to either irreversibly remove the content or recover it.

---

Listing all the file systems and how much space is available in each of them:

```
df -k
```

`find` supports searching by inum:

```
find . -inum 4590237 -print
```

Remove every file with that inum found within the current directory:

```
find . -inum 4590273 -exec rm {} ';'
```

### Soft Link Questions

**Can you have symbolic links to directories?**

```
$ ls -li /bin
... /bin -> usr/bin
```

Yes. A symlink can even be resolved in the middle of a file name (in which case, it better be a directory).

**Can a symlink point to another symlink?** Yes.

**Can a symlink point to itself?** Yes. It can even point to a symlink that points back to itself. They aren't _dangling_ lists, but if you try resolving the path, you enter an infinite loop.

The kernel has a guard against this. If you attempt this, you get the error:

```
filename: Too many levels of symbolic links
```

**Symbolic links to hard links?** Yes.

**Hard links to symbolic links?** Yes.

### Secondary Storage

Flash drives wear out.

"4 TB drive 200TBW" means it has 4TB capacity and you are guaranteed that you can overwrite the same block of memory with 200TB worth of data. After that, that part of the drive wears out.

Linux solves this problem by moving the file around. The user thinks they're writing to the same area, but the OS is actually writing to different parts of the drive.

The implication is that if you remove the file, there are actually parts of the file still scattered around the drive. Attempting a clean wipe of the drive is more involved, and there is also software dedicated to recovering deleted date from these data remnants.

---

**Aside:** Overwriting the content of a file with random junk:

```
shred foo
```

---

## The `mv` Command

```
mv foo bar
```

This also modifies the mapping of the directory instead of the files themselves. What this does at the low level is:

- Remove one directory entry
- Add another entry in a directory, possibly the same one or another directory

So `mv` is a very cheap operation, unlike something `cp` which has to actually iterate over the content of the file.

The `ls -l` flag outputs each entry in the format:

```
(inum) (file type AND permissions) (link count) (owner)
```

## File Permissions

The permissions bits are just a 9-bit number, which stores 3 groups of octal numbers representing the `rwx` permission bits for the `ugo` (owner, group, other) of the file. The flags displayed with `ls -l` have ten bits, with the leading bit representing the **file type**:

|   |   |
|---|---|
|Bit|File Type|
|-|regular|
|d|directory|
|l|symbolic link|
|c|char special file|
|...|...|

Technically, the 9 bits are actually 12 bits because they are encoded in a way to allow for the special flag:

```
$ ls -lai /bin/sudo
... -rws-r-xr-x 1 root root ... /bin/sudo
```

The `x` flag of the octal number for the owner category is an `s`,  
short for **superuser**. This means that this command is _trusted_ by the OS. And no, you cannot just:

```
$ chmod +s /bin/sh
chmod: changing permissions of 'bin/sh': Operation not permitted
```

## So How Do You Update a File?

Options:

1. Write directly to a file `F`. But if some other program reads the file at the same time, problems could arise. You want to be able to update files (and databases) **atomically**.
2. Write to a temporary file `F#` and then `mv F# F`. The downside obviously is that it occupies twice the space on drive. The upside is that because `mv` is **atomic**, any other processes attempting to use the file at the same time will either get the old file or the new file, not some intermediate state.

# Scripting Languages

From `grep` to `sed` to `awk`, such commands attempt to generalize and expand what the previous does, rising in levels of complexity.

The **Perl** programming language was designed to be able do everything awk, etc. can do.

Then **Python** was designed to do everything Perl, etc. can do.

## History of the Python Programming Language

**Part 1: BASIC and ABC**

BASIC - an instructional language. Instructors noticed that students showed up knowing BASIC.

Instead of writing very low-level code, go up one level of abstraction. Give people a language where:

- Hash tables are implemented into the language, like `set` and `dict`
- All the basic algorithms already built-in. Just `sort` lol.
- Enforce indentation.
- An IDE to run the programs.

High school students will then be programming in this new language called **ABC**. It didn't work because employers still wanted BASIC.

**Part 2: Perl**

Perl = sh + awk + sed + ...

Perl was designed as an antidote to the "Little Languages" philosophy, so it combined all the little languages into one scripting language. Perl became the scripting language of choice for about 10 years. It was designed to be like a real spoken language - there was always more than one way to do something.

However, ABC had the philosophy that there is one correct way to do anything.

Python emerged as a combination of ABC as well as the capabilities of Perl.

Python is a scripting language that tries to do everything.

> Theoretically, if you know the language very well, you do not have to touch the little languages of the shell.

---

All 3 languages, BASIC, Perl, and Python can be either compiled or interpreted.

The tradition in Unix is that TAB stops at 8 characters.

---

# Discussion Notes: ELisp Basics

**LISP**: LISt processor because the source code is comprised of lists.

Developed by John McCarthy in 1958, Lisp is the first **functional language**.

**ELisp** (Emacs Lisp) is a variant of Lisp used to write and extend the Emacs application.

## Within Emacs

- You can use `M-: RET` to enter an `Eval` minibuffer.
- You can also eval a line in a main buffer by moving the cursor tot he end f the Lisp list and then entering `C-x C-e.`.
- You can directly enter an initial buffer without a file called the \_scratch\_ buffer. You do this by pressing `q` right after starting up Emacs..

**Lisp interaction mode:**

- Move cursor to end of Lisp expression line.
- `C-j` to evaluate this line.
- Output will be shown and written to the buffer.
- Use instead of `C-x C-e` if you want the history to be saved in the buffer itself.

## The Language

**Atoms** are words that cannot be divided into any smaller parts, such as:

- Numbers: 30, \#b111 (binary), \#x6e3 (hexadecimal)
- Strings: "Hello", "buffer-name"

### Variables

Define and set a variable:

```
defvar x 5
defvar y 5
```

Set the value of an existing variable:

```
setq x 5
setq y 5
```

Local binding:

```
(let ((a 1) (b 2)) ; local binding
    (+ a b)        ; body
)
```

### Expressions

The general syntax is `([Prefix] argument_1 argument_2 ...)`

Written as lists using _prefix notation_:

```
(+ 1 2)
```

Recursive (nested) expressions:

```
(* (+ 1 2) (+ 2 3))
```

**The** `**quote**` **Function:**

This will return the data structure itself i.e. `(+ 1 2)` instead of the result of its evaluation i.e. `3`:

```
(quote (+ 1 2))
'(+ 1 2) ; shorthand
```

### Control Flow

Comparison operator:

```
(= 1 2)
(> 2 2)
```

If statements:

```
(if (= 1 2));
    "Yes"; will run if true
    "No";  will run if false
)
```

Here `;` is used to separate the lines of code, not only marking the start of comments.

### Functions

```
(defun function-name (arguments...)
    "optional-documetation..."
    (interactive argument-passing-info) ; optional
    ; body
)
```

Example:

```
(defun multiply-by-thirty-five (number)
    "Multiply NUMBER by Thirty Five."
    (* 35 number)
)

; calling the function
(multiply-by-thirty-five 2) ; 70
```

```
; you can define a function to be interactive
; such functions can be called via M-x
(defun add (x y) (interactive) (+ x y)
```

---

**Small bash aside:** `.bash_profile` is for code to be only run once, like modifying environment variables such as `PATH`. `.bashrc` is for code to be run every time a new shell is started.

---

## Data Types

### Numerical Types

**Integer Type**

These are *_all_ valid integers:

```
-1
1
1.
+1
```

_fixnum_

- Its range depends on the machine: `M-: RET (print most-positive-fixnum) RET`

_bignum_:

- Can have arbitrary precision
- Most languages implement this with a _linked list_

**Floating Point Type**

All of these are the _floating point_ number 1500:

```
1500.0
+15e2
15.0e+2
+1500000e-3
.15e4
```

### List Type

```
(A 2 "A")       ; list of 3 elements
()              ; list of no elements (empty list)
nil             ; also the empty list
("A ()")        ; list of 1 element: the string "A"
(A ())          ; list of 2 elements: A and empty list
((A B C))         ; list of 1 element: a list with three elements
```

You can split lists across multiple lines:

```
'(rose
  violet
  daisy
  buttercup)
```

Remember the quote is necessary because we want the list _itself_ and not to evaluate its contents.

**Evaluating a list can result in:**

- Error message
- Nothing (returns the list itself using `quote`)
- Treat the first symbol in the list as a command and return its result `(+ 2 2)` -> `4`
- Evaluate an expression from a buffer directly with `C-x C-e` or `C-j`

### Other Types

**Function Type**

All functions are defined in terms of other functions except for a few called **primitive functions** written in C.

A **lambda expression** can be called as an _anonymous function_. This is useful because many functions only need to be used once.

**Character Type**

Uses ASCII encoding; a character in ELisp is nothing more than an integer

**Symbol Type**

```
foo             ; symbol named 'foo'
FOO             ; symbol named 'FOO'
1+              ; symbol named '1+'
\\+1             ; symbol named '+1'
\\(*\\ 1\\ 2\\)     ; symbol named '(* 1 2)' (you're an idiot)
```

**Boolean Type**

True is `t` and false is `nil`.

## Common Functions

- `quote` returns object, without evaluating it
    
    ```
    (quote (+ 2 2))
    '(+ 2 2)
    ```
    
- `car` returns the first element in a list
    
    ```
    (car '(rose violet daisy buttercup))
    ; rose
    ```
    
- `cdr` returns the rest of the list
    
    ```
    (cdr '(rose violet daisy buttercup))
    ; (violet daisy buttercup)
    ```
    
- `cons` constructs lists
    
    ```
    (cons 'I '(like lisp))
    ; (I like lisp)
    (cons (car '(rose violet daisy buttercup)) (cdr '(rose violet daisy buttercup)))
    ; (rose violet daisy buttercup)
    ```
    
- `append` attaches one list to another
    
    ```
    (append '(1 2 3 4) '(5 6 7 8))
    ; (1 2 3 4 5 6 7 8)
    (cons '(1 2 3 4) '(5 6 7 8))
    ; ((1 2 3 4) 5 6 7 8)
    ```
    

## Exercises

```
quote (1 2 3))                      ; (1 2 3)
'(1 2 3)                            ; (1 2 3)
(list (+ 1 2) '(+ 1 2))             ; (3 (+ 1 2))
(cons (+ 1 2) '(3 4))               ; (3 3 4)
(+ 10 (car '(1 2 3)))               ; 11
(append '(1 2) '(3 4))              ; (1 2 3 4)
(reverse (append '(1 2) '(3 4)))    ; (4 3 2 1)
(cdddar (1 2 3 4 5 6 7))            ; ERROR (unless cdddar defined)
```

## Customizing Emacs

Some Emacs jargon:

|   |   |
|---|---|
|Term|Meaning|
|Point|Current position of the cursor|
|Mark|Another position in the buffer|
|Region|Text between the mark and point|

The function `point` returns the current position of the cursor as a number.

`save-excursion` is often used to keep point in the location expected by the user:

```
(save-excursion
    (actions-that-modify-point))
```

**TIP:** You can use `(global-set-key KEY COMMAND)` to define a custom key bind.

## Concept of Pure Functions

Also known as **deterministic**, functions that have two properties:

1. Given a specific input `x`, the function _always_ returns the same output `y`.
2. It doesn't modify any data beyond initializing local variables required to compute its output.

```
// Pure
int f(int p) {
    int q = 5 * p * p;
    return q;
}

// Impure
int z;
int f(int p) {
    return p * z++;
}
```

Notice that as long as you're using or modifying a global mutable variable, your function risks not being a pure function.

Functional languages...

- Are only composed of functions
- Can't change variable state (no `p = p + 1`).
- No loops, only recursion (because the counter `i` changes its state).
- Order of execution is not important because all functions are pure, so they won't have any _side effects_ by definition.