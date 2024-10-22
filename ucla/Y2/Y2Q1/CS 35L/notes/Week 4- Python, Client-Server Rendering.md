---
course: CS 35L
area: ucla
created: 2022-10-27T19:06
updated: 2022-10-27T19:11
📕 courses:
  - "[[CS 35L- Software Construction]]"
tags: cs
parent: CS 35L

title: Week 4- Python, Client-Server Rendering

layout: note

---
**Week 4 Lecture Notes**

- Python (Continued)
    - Classes and OOP
        - Dunders and "Operator Overloading"
        - Namespaces in Classes
    - Modules
        - The import Statement
    - Packages
        - The PYTHONPATH Environment Variable
- Client-Server Computing
    - Alternatives to the Client-Server Model
    - Performance Issues
    - Correctness Issues
    - Task Networking Styles
- The Internet
    - Packet Switching
    - Internet Protocol Suite (TCP/IP)
    - Link Layer
    - Internet Layer
        - IP (Internet Protocol)
        - UDP (User Datagram Protocol)
    - Transport Layer
        - TCP (Transmission Control Protocol)
    - Application Layer
        - RTP (Realtime Transmission Protocol)
        - HTTP (HyperText Transfer Protocol)
        - telnet Aside
        - Variants of HTTP
    - Data Languages
        - SGML (Standard General Markup Language)
- Discussion Notes: Midterm Review
    - Glob (Wildcard) Pattern Matching
    - File Permissions
    - File Links
    - Emacs
    - The Shell
        - Shell Scripting
    - Practice Midterm Questions

---

# Python (Continued)

## Classes and OOP

Class hierarchies (especially apparent with **multiple inheritance**) are **directed acyclic graphs (DAG)**.

Python's **method resolution order (MRO)** is depth-first, left-to-right. So for example, if you define a class that inherits like so:

```
class C(A, B):
    def some_method(self, arg):
        pass
```

With the DAG model, this design makes it so that if `A` and `B` disagree, `A` will always take priority.

**Historical Aside:** The decision to explicitly include `self` in all method definitions was to not abstract a fundamental mechanism of OOP: every method is _bound_ to the class and _acts on_ the instance. If you examine the machine code of similar OOP languages like C++, you'll see that there's a hidden first argument to every method, that is the pointer to the object that the method is acting _on behalf of_.

### Dunders and "Operator Overloading"

Besides the ones you already know...

The old way to redefine the comparison operators:

```
def __cmp__(self, other):
    # negative for <, 0 for equal, positive for >
    return num
```

This is still supported but it is now anachronistic approach because you can run into hardware problems. A notable example is the case of _floating point numbers_, which have an additional state, **NaN**, beyond negative, zero, and positive. Thus, we have the familiar `__lt__`, `__gt__`, etc.

This is the Python 2 predecessor to the familiar `__bool__` method:

```
def __nonzero__(self):
    # Return whether the object is considered to be "not zero"
    return b
```

### Namespaces in Classes

**Namespaces** are just dictionaries. Classes have a special attribute `__dict__`, a `dict` that maps names to values. This gives rise to opportunities to write "clever" Python code, where you can programmatically alter the definition of an existing class:

```
c = C()
c.__dict__["m"] is c.m
```

This is (probably) how **metaclasses** are implemented.

## Modules

### The `import` Statement

1. Creates a namespace for the module.
2. Executes the contents of the module _in the context of that namespace_. Eggert didn't mention this, but this step is actually only performed if the module _hasn't already been imported_. Modules are only run onces.
3. Adds a name, the module name, to the current namespace.

Proof for \#2:

```
# module.py
print("Hello world")
```

```
# runner.py
import module
import module
```

```
$ python3 runner.py
Hello world
```

## Packages

Packages organize source code into a familiar tree structure. This allows importing to be parallel the file system.

The special `__init__.py` scripts turns a directory into a proper package, and it is automatically run upon import.

### The `PYTHONPATH` Environment Variable

Just as how `PATH` instructs the shell program where to search for commands, `PYTHONPATH` instructs the Python interpreter on where to search for code.

Determines the behavior of the `import` statement. Python will search through the sequence of paths, delimited by colons (Unix) or semicolons (Windows), to search for names of packages or modules to import. The path to the standard library is included in `PYTHONPATH` by default.

Official documentation: [https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH](https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH).

This variable is stored in and can be modified programmaticaly with `sys.path`, which is a `list[str]` containing the individual string paths.

**Why all this complexity with packages vs classes?**

Packages are oriented towards developers (like a _compile-time notion_). The tree is structured so that different developers can work on different parts of the code.

Classes are about runtime behavior (a _runtime notion_). You want inheritance to be independent of package hierarchy. Classes are only concerned with their own behavior, "what to do next", so it should be able to pull code from anywhere in the codebase. How developers _organize_ that codebase is made possible with packages.

# Client-Server Computing

Firstly, some common concepts between Node+React and POSIX:

- Quoting
- Configuration

---

The Client-Server Model:

```
C                     S
+---------+         +------------+
| browser | <-----> | web server |
+---------+         +------+-----+
C                    ^     |
+---------+          |  +--+--+
| browser | <--------+  | DB  |
+---------+             +-----+
```

## Alternatives to the Client-Server Model

1. **Single computer** (CS 31 assignments, where the logistics of networking, OS, etc. were abstracted away)
2. **Peer-to-peer (P2P)**: Decentralized approach. If a peer doesn't have a resource, the request is redirected to another resource. The main advantage of this is that it is more fault-tolerant: a single peer going down doesn't bring the system down. The downside is that it is more involved to maintain a consistent state across every peer. This is in contrast to the less fault-tolerant but more state-consistent client-server model.
3. **Primary secondary**: One primary machine that serves as the "overseer" - it keeps track of how the application is split up among numerous secondary servers. The secondary servers receive a small "subproblem" of the application from the primary server and return any results.

## Performance Issues

Traditional programming performance metrics:

- CPU time: how many CPU instructions executed (roughly proportional to the amount of energy consumed)
- Real time: amount of time elapsed
- RAM
- I/O

Networking performance metrics:

- **Throughput**: Number of client requests per second that the system can handle (assuming individual requests and responses are reasonably small and approximately equally sized); bigger is better.
- **Latency**: Delay between a request to the server and the response back from the server; smaller is better.

To improve **throughput**:

- You can perform actions "out of order" (compared to "request order").
- You can perform actions _in parallel_.

To improve **latency**:

- You can use **caching**.

## Correctness Issues

The aforementioned _throughput fixes_ can cause out-of-order execution, which can "mis-order" transactions.

The aforementioned _latency fixes_ can cause **stale caches**, requires **cache validation**, which could be an expensive operation.

## Task Networking Styles

**Circuit Switching**

- System is connected to the nearest central office, which can connect to other central offices. In the end, you get a path between the one computer to the other.
- However, you have temporary ownership of a wire during the transaction.

**Packet Switching**

- Connected to a little computer that breaks the signal into a bunch of small messages called **packets**. Each packet is sent to a local **router** that sends the packets along the network to the destination. Each packet travels independently and possible along different paths, and they do so very quickly, so it does not back up the network

# The Internet

## Packet Switching

Idea originally proposed by Paul Baran (1960s, RAND).

Sold to Department of Defense as a reliable way to communicate in the event of nuclear war because of its ability to _reroute_ in the event of an office goes down, which gives it an edge over traditional **circuit switching**.

Packet switching is a best effort transmission/no guarantees (circuit-switching is a _guarantee_ between the two machines).

**Problems:**

- Packets can be lost - if some router along the way gets overloaded, some packets may be discarded
- Packets can be received out of order
- Packets can be duplicated via a mechanism called **bridges**
- All routing decisions are local to the individual routers, so packets may be directed into a loop

## Internet Protocol Suite (TCP/IP)

A **protocol** is simply a set of rules. This set of rules forms the foundation of the Internet.

Basic idea: **layering**. Protocols are built on top of each other, with each layer abstracting and extending the one below it:

```
                          End user
                            |
+-----------------------+   |
|   Application Layer   | Applications
+-----------------------+   |
|    Transport Layer    | Data channels
+-----------------------+   |
|    Internet Layer     | Packets
+-----------------------+   |
|      Link Layer       | Bits and bytes
+-----------------------+   |
                            |
                          Hardware
```

## Link Layer

Point-to-point.

The bits and bytes you send on a single link from one node to another (no routers in between). Very hardware oriented. Each technology used has its own link layer protocol.

## Internet Layer

**Packets.** Software almost never operate directly at this level because it is too low level.

### IP (Internet Protocol)

IP comes in different versions, IPv4 and IPv6.

**IPv4**

Created in 1983, specified by Jon Pastel (UCLA), etc. Involves packets, connection.

We are running out of IPv4 addresses because there are only about 4 billion, and the US has most of them.

**Packet Anatomy**

A packet is just a sequence of bytes. The **payload** is prefixed by a **header** that stores _metadata_ like:

- Length
- Protocol number (to support any protocol that ends up being built atop IP) tells you the _type_ of packet that's being transported so algorithms can determine their priority. For example, a single video frame is much less important than part of a image file.
- Source IP address (a 32-bit number often expressed in Base 256)
- Destination IP address (ibid)
- A **checksum** (16-bit)
- **A time-to-live (TTL)** field (8-bit "hop count" that keeps track of how many routers it goes through; packets with abnormally high TTL values get dropped to prevent packet loops)

When routers receive packets, they look at the header, especially the destination address, to determine what to do with it.

**IPv6**

- Created in 1996.
- 128 bit IP addresses.
- The headers are also longer.
- A superset of IPv4; the 32 bits of IPv4 can be mapped to 32 bits of an IPv6 address, so IPv4 users can communicate with IPv6 users. The converse is not as simple but made possible with complicated translation techniques.
- Less efficient because the extra length is overhead for the link layer

### UDP (User Datagram Protocol)

- Created by David Reed at MIT.
- Designed as a thin layer over IP, but still at the Internet layer.
- You use UDP if your application sends single short messages over the Internet without much care if it is lost, duplicated, etc. Intended for apps that _want_ to deal with packets.

## Transport Layer

**Data channels.** Large data _streams_ (TB of data) that cannot be individual packets. This layer oversees how a _stream of packets_ is transmitted.

### TCP (Transmission Control Protocol)

Vint Cerf from Stanford, Bob Kahn from Princeton.

Looks like a _stream of data_ that:

- Is reliable (via **acknowledgements**).
- Have **sequence numbers** for packets.
- Is ordered (the recipient reassembles the packets that may be out of order in the lower layers).
- Is **end-to-end error-checked**.

The protocol has:

- Flow control; sends packets at the correct rate to not overload the network.
- Retransmission.
- Reassembly.

A single machine can listen to multiple TCP channels on different **ports**.

## Application Layer

Application dependent: web, voice, etc.

### RTP (Realtime Transmission Protocol)

Runs atop UDP because TCP is not suited for sending realtime data. TCP would cause **jitter**.

### HTTP (HyperText Transfer Protocol)

Runs atop TCP because reliability is a must - a single misplaced bracket may break an HTML document.

Tim Berners-Lee at CERN in 1991. He invented:

1. The Web, HTTP and its **request-response protocol**:

- Create a TCP connection (default port 80)
- Client sends the server a GET message
- Server responds with the contents of the webpage

1. **HTML (HyperText Markup Language)**: a way to express the contents of a webpage in a machine-independent format.

The Internet fundamentally is just HTML and HTTP combined together. HTML is like the content of the Internet, HTTP is how it gets around.

### `telnet` Aside

You can use the `telnet` command to open a 2-way stream where you can send raw HTTP requests. Run `telnet` with the IP address and the port to connect to. THen enter the `GET` command with the resource you want to get and the protocol version to use. Then specify the `Host`:

```
$ host www.cs.ucla.edu
WWW.cs.ucla.edu has address 164.67.100.182
$ telnet 164.67.100.182 80
Trying 164.67.100.182...
Connected to 164.67.100.182.
Escape character is '^]'.
GET / HTTP/1.1
Host: www.cs.ucla.edu

HTTP/1.1 301 Moved Permanently
Date: Wed, 19 Oct 2022 22:21:10 GMT
Server: Apache
X-Frame-Options: SAMEORIGIN
Location: <https://www.cs.ucla.edu/>
Content-Length: 232
Content-Type: text/html; charset=iso-8859-1

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="<https://www.cs.ucla.edu/>">here</a>.</p>
</body></html>
```

The actual HTML data is prefixed with a response **header**, detailing metadata like the response code, content length, etc.

### Variants of HTTP

**HTTPS (HTTP Secure)**

With plain HTTP, every router between the source and destination can see the raw data that is transmitted.

Uses shared private keys or something.

**HTTP/2**

Came out in 2015.

Added extra features to HTTP:

1. Header compression
2. Server push (lets the server send a response without a request)
3. Pipelining (allows client to send multiple requests so the server can respond in batches, allows more _parallel_ communication instead of having the client wait for a response every single time)
4. Multiplexing (talk to multiple websites over one TCP channel)

**HTTP/3**

Not released yet.

1. Now based on UDP instead of TCP (motivated by the increase in voice/video services)
2. Uses even more multiplexing
3. Avoids jitter by avoiding **head-of-line** blocking delays; allows content after a dropped packet to be delivered (?)

---

## Data Languages

HTML is an example of a data language.

### SGML (Standard General Markup Language)

Markup language for documents (1980s).

A **declarative** (vs. **imperative**) language. **Markup** specifies the structure and attributes of a document.

<!-- HTML for highlighting, SGML doesn't seem to be supported -->

```
<QUOTE TYPE="example">
    OK <ITALICS>This text</ITALICS> is
    part of a block quote intended for example.
</QUOTE>
```

Extensible bracket types allow you to define new features without making breaking changes to the language. `<QUOTE>` is one type of bracket with its closing tag `</QUOTE>`, `<ITALIC>` is another, etc.

The structure of the document forms a tree structure: the content inside `<ITALICS>` is a child node to `<QUOTE>`.

# Discussion Notes: Midterm Review

## Glob (Wildcard) Pattern Matching

Used in file management: `man 7 glob`

The shell will **expand** strings containing these special characters to every string that matches the pattern, separated by whitespaces. For example, `*` in a directory containing files named `file1`, `file2`, and `file3` would expand to:

```
$ echo *
file1 file2 file3
```

This is done _by the shell_ and NOT the programs typically associated with them like `ls`. When you run something like `ls hello/*`, bash first expands the string `hello/*` to `hello/some_file hello/another_file ...` and _then_ passes it to `ls`.

- `?` - match one, any character
- - match any number of characters, including the empty string
- `{pdf,jpeg}` - match multiple literals
- `[]` - character set that supports _ranges_, similar to regex
- `[!]` - complement of a character set if `!` is the first character
- `\\` - escape character

## File Permissions

- 3 permissions: read (r), write (w), execute (x)
- 3 user groups: user (**owner)**) (u), group (g), others (o)
- Each 0-7 in numerical modes (one octal digit), for a total of 3 octal digits for a file (e.g. 755 for `rwxr-xr-x`)

A set of rwx permissions on a file is called "**sensible**" if the owner has al the permissions of the group and the group has all the permission of others. For example:

- 551 (r-x|r-x|--x) is sensible. The owner's permissions are a _superset_ of those of the group.
- 467 (r--|rw-|rwx) is not. The group has `w` permission while the owner doesn't.

Non-sensible permissions don't make sense because the _owner_ is considered to be the most closely related to the file, so they should have the most access.

**How many distinct sensible permissions are there?**

Solution:

Consider r, w, x permissions separately. For each of then, there are 4 ways to gst sensible permissions for u, g, and o (in binary, 000, 100, 110, 111).

Total: $4^3=64$

## File Links

- **Soft link** (**symbolic link**) is only a pointer
- **Hard link** creates a copy of the target file
- **Dangling link**: a soft link that points to a nonexistent file

**Give an example of how renaming a dangling symbolic link can transform it into a non-dangling symbolic link.**

Soft links can be linked to a relative path. Suppose `c` has content `b`, but `b` only exists as `temp/b` relative to the current working directory. We can use `mv c temp` to make the relative path `b` now work since `c` is now in the same directory as `b`.

## Emacs

**Explain how to arrange for Emacs to treat C-t as a command that causes Emacs to issue a message like this in the echo area:**

_some time string I missed it lol_

Solution:

1. Define a function.
2. Use `current-time-string` to get current time, and use `concat` to concetatne time with other text
3. Make the function `interactive`
4. Use `message` for output in the echo area
    
    ```
    (defun print-time ()
        (interactive)
        (message (concat "It is now" (current-time-string) ".")))
    ```
    
5. Create the `C-t` key binding:
    
    ```
    M-x global-set-key C-t print-time RET
    ```
    

## The Shell

Be familiar with at least these commands:

- **grep**: search for text that matches the give pattern
- **sed**: streaming text editor
- **shuf**: randomly shuffle the input
- Maybe also **awk**: a scripting language for editing text

### Shell Scripting

**Looping:**

```
for i in {1..100}
do
    echo $i
done
```

You can use the `expr` command to evaluate an expression. You can also use _compound expansion_ with `((expression))` syntax.

**Conditionals**

```
if [ condition ]
then
    # body
fi
```

**What does this script do?**

```
#!/bin/sh
atom='[a-zA-Z0-9]+'         # at least 1 alphanumeric character
string='\\\\"([^"\\]|\\\\.)*\\\\"' # \\"(something)\\", where (something) is . OR neither " or \\
word="($atom|$string)"
words="$word(\\\\.$word)*"
grep -E "$words" | grep ' '
```

This script wil print any line in the standard input that satisfies both of the following:

- Contains a space
- Contains a sequence of words specified by `$word`

For `$word`, it matches:

1. An atom character specified by `$atom`, which is just one or more alphanumeric characters
2. A sequence of non-double-quote characters that are enclosed with `\\"` and if backslash appears, it must be followed by another character (to form an escape sequence)

**What if the** `**-E**` **flag is removed?**

BRE is used instead of ERE. Many meta-characters including `(` `|` `)` will then be treated as normal characters.

**How to modify the script to only use grep once without changing the I/O behavior?**

Use `sed`:

```
grep -E "$words" | sed -n '/ /p'
```

The captive space means match the space and the `p` means print.

## Practice Midterm Questions

**What is the main difference between a hard link and a symbolic link?**

A hard link increments the file object's reference count. A symbolic link does not increment the file's reference count.

Deleting all hard links to a file (and ceasing all operations that use the file) deletes the file. Deleting symbolic links do not affect the underlying file. A symbolic link can become dangling if the underlying file is deleted.

**Consider the shell command being executed on a device named ubun3 by user groot:**

```
ubun3:~/zoo-wee-mama groot$ a b < c | ./d > e
```

This executes the command named a with b as an argument and the file c as its input. The output of a is then piped into the d file in the current directory. The standard output of the d file is redirected to a file named e in the current directory, creating it if necessary, every time it receives pipeline input.

The programs being executed are a, which is presumably on the user's `PATH`, and d, which is in the current directory.

**Write an ERE that only matches numbers between 0 and 255.**

```
^(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])$
```

**TIP:** Make sure to remember to include `^$`! That constrains the number of digits you can match, and more importantly, it ensures no partial matching.

<script type="text/javascript" src="[http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML](http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML)"></script>  
<script type="text/x-mathjax-config">  
MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });  
</script>