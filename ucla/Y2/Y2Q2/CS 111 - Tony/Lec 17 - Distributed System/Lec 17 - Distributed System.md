## Distributed System

- **a collection of independent components located on different machines that share messages with each other in order to achieve common goals**

## Goals of distributed systems

- Scalability and performance
    - Apps require more resources than one computer has
    - Can we grow system capacity/bandwidth to meet demand
- Improved reliability and availability
    - 24x7 service despite disk/computer/software failures
- Ease of use, with reduced operating expenses
    - Centralized management of all services and systems
    - Buy (better) services rather than computer equipment
- Enable new collaboration and business models
    - Collaborations than span system (or national) boundaries
    - A global free market for a side range of new service

### Problems:

- different machines don’t share memory
    - or any peripheral devices
    - so one machine can’t easily know the state of another
- the only way to interact remotely is to use a network
    - usually asynchronous, slow, and error-prone
- failures of one machine aren’t visible to other machines

### Transparency

Ideally, a distributed system would be just like a single machine system, but better…

- More resources
- More reliable
- Faster

Transparent distributed systems look as much like a single machine systems as possible

### Deutsch’s “Seven Fallacies of Network Computing”

- the network is reliable
- there is no latency
- the available bandwidth is infinite
- the network is secure
- the topology of the network does not change
- there is one administrator for the whole network
- the cost of transporting additional data is zero

Bottom Line: true transparency is not achievable

## Distributed System Paradigms

- parallel processing
    - relying on tightly coupled special hardware
- single system images
    - make all then nodes look like one big computer
    - somewhere between hard and impossible
- loosely coupled systems
    - work with difficulties as best as you can
    - typical modern approach to distributed systems
- cloud computing
    - a recent variant

### Loosely Coupled Systems

Characterization:

- a parallel group of independent computers
- connected by a high speed LAN
- serving similar but independent requests
- minimal coordination and cooperation required

Motivation:

- scalability and price performance
- availability - if protocol permits stateless servers
- ease of management, reconfigurable capacity

Ex.

- web servers, app servers, cloud computing

### Horizontal Scalability

- each node largely independent
- so you can add capacity just by adding a node on the side
- scalability can be limited by network, instead of hardware or algorithms
- reliability is high
    - failure of one of the N nodes just reduces the capacity

![[/Untitled 88.png|Untitled 88.png]]

### Elements of Loosely Coupled Architecture

- farm of independent servers
    - servers run same software, serve different requests
    - may share a common back-end dataase
- Front-end switch
    - distributes incoming requests among available servers
    - can do both load balancing and fall-over
- Service protocol
    - stateless servers and idempotent operations
    - successive requests may be sent to different servers

### Horizontally Scaled Performance

- Individual servers are very inexpensive
    - blade servers may be only $100-$200 each
- Scalability is excellent
    - 100 servers deliver approximately 100x performance
- Service availability is excellent
    - front-end automatically bypasses failed servers
    - stateless servers and the client retries fail-over easily
- the challenge is managing thousands of servers
    - automated installation, global configuration services
    - self monitoring, self-healing systems
    - scaling limited by management, not HW or algorithms

### Cloud computing

The recent twist on distributed computing.

- Set up a large number of machines all identically configured
- Connect them to a high speed LAN
    - And to the internet
- Accept arbitrary jobs from remote users
- Run each job on one or more nodes
- Entire facility probably running mix of single machine and distributed jobs, simultaneously

### What Runs in a Cloud?

- In principle, anything
    - But general distributed computing is hard
- So much of the work is run using special tools
- These tools support particular kinds of parallel/distributed processing
    - Using a method like map-reduce or horizontal  
        scaling
- Things where the user need not be a distributed systems expert

### MapReduce

Perhaps the most common cloud computing software tool/technique.

A method of dividing large problems into compartmentalized pieces.

- Each of which can be performed on a separate node
- With an eventual combined set of results

### The idea behind MapReduce

There is a single function you want to perform on a lot of data.

- Such as searching it for a particular string

1. Divide the data into disjoint pieces
2. Perform the function on each piece on a separate node (map)
3. Combine the results to obtain output (reduce)

### On To Reduce

- we might have two more nodes assigned to doing the reduce operation
- they will each reduce a share of data from a map node
- The reduce node performs a reduce operation to “combine” the shares
- Outputting its own result

### Synchronization in MapReduce

- each map node produces an output file for each reduce node
- it is produced stomically
- the reduce node can’t work on this data until the whole file is written
- forcing a synchronization point between the map and reduce phases

### Cloud Computing and Horizontal Scaling

- an excellent match
- rent some cloud nodes to be your web servers
- if load gets heavy, ask the cloud for another web server node
- as load lightens, release unneeded nodes
- no need to buy new machines
- no need to administer or own machines

### Cloud Computing and Sysadmin

- not quite as painless as it sounds
- the cloud provider will take care of lots of the problem
    - running the hardware
    - fixing broken hardware
    - loading your software onto machines
- But they won’t take care of internal administration

# Remote procedure calls (RPC)

One way of building distributed system.

Procedure calls are a fundamental paradigm.

- Primary unit of computation in most languages
- Unit of information hiding in most methodologies
- Primary level of interface specification

A natural boundary between client and server.

- Turn procedure calls into message send/receives

A few limitations.

- No implicit parameters/returns (e.g. global variables)
- No call-by-reference parameters
- Much slower than procedure calls (TANSTAAFL)

### Remote Procedure Call Concepts

- Interface Specification
    - methods, parameter types, return types
- External Data Representation (XDR)
    - machine independent data-type representations
    - may have optimization for similar client/server
- client stub
    - client-side proxy for a method in the API
- Server stub (or skeleton)
    - server-side recipient for API invocations

### Key Features of RPC

Client application links against local procedures

- Call local procedures, gets results

All RPC implementation inside those procedures.

- Client application doesn’t know about RPC.

Doesn’t worry about…

- Formats of messages
- Sends, timeouts, resends
- External data representation

All of this is generated automatically by RPC tools.

The key to the tools is the interface specification.

![[/Untitled 1 64.png|Untitled 1 64.png]]

![[/Untitled 2 56.png|Untitled 2 56.png]]

### RPC Is Not a Complete Solution

- requires client/server binding model
    - expects to be given a live connection
- threading model implementation
    - a single thread services requests one at a time
    - so use numerous one-per-request worker threads
- limited failure handling
    - client must arrange for timeout and recovery
- limited consistency support
    - only between calling client and called server
    - what if there are multiple clients servers working together
- higher level abstractions improve RPC
    - e.g. Microsoft DCOM, Java RMI, DRb, Pyro

# Distributed synchronization

- Why is it hard to synchronize distributed systems?
- What tools do we use to synchronize them?

### What’s hard about distributed synchronization?

- Spatial separation
    - Different processes run on different systems
    - No shared memory for (atomic instruction) locks
    - They are controlled by different OS
- Temporal separation
    - Can’t “totally order” spatially separated events
    - Before/simultaneous/after lose their meaning
- Independent modes of failure
    - One partner can die, while others continue

### Leases - More Robust Locks

- obtained from resource manager
    - gives client exclusive right to update the file
    - lease “cookie” must be passed to server on update
    - lease can be released at end of critical section
- only valid for a limited period of time
    - after which the lease cookie expires
        - updates with stale cookies are not permitted
    - after which new leases can be granted
- handles a wide range of failures
    - process, client node, server node, network

### Lock Breaking and Recovery

- revoking an expired lease is fairly easy
    - lease cookie includes a “good until” time
        - based on server’s clock
    - any operation involving a “stale cookie” fails
- This makes it safe to issue a new lease
    - old lease holder can no longer access object
    - but was object left in a “reasonable” state?
- object must be restored to last “good” state
    - roll back to state prior to the aborted lease
    - implement all-or-none transactions

### Security for Distributed Systems

- security is hard in single machines
- it’s even harder in distributed systems
- why?

### Distributed Security Difficulties

- your OS cannot guarantee privacy and integrity
    - network activities happen outside of the OS
    - should you trust where they happen?
- Authentication is harder
    - all possible agents may not be in the local password file
- the wire connecting the user to the system is insecure
    - eavesdropping, replays, man-in-the-middle attacks
- even with honest partners, hard to coordinate distributed security
- the internet is an open network for all
    - many sites on the internet try to serve all comers
    - core internet makes no judgments on what’s acceptable
    - even supposedly private systems may be on the internet

### Goals of network security

- Secure conversations
    - Privacy: only you and your partner know what’s said
    - Integrity: nobody can tamper with your messages
- Positive identification of both parties
    - Authentication of the identity of message sender
    - Assurance that a message is not a replay or forgery
- Availability
    - The network and other nodes must be reachable when they need to do

### Elements of network security

- Cryptography
    - Symmetric cryptography for protecting bulk transport of data
    - Public key cryptography primarily for authentication
    - Cryptographic hashes to detect message alterations
- Digital signatures and public key certificates
    - Powerful tools to authenticate a message’s sender
- Filtering technologies
    - Firewalls and the like
    - To keep bad stuff from reaching our machines

### Using cryptographic hashes

1. Start with a message you want to protect
2. Compute a cryptographic hash for that message, e.g. using Secure Hash Algorithm 3 (SHA-3)
3. Transmit the hash securely
4. Recipient does same computation on received text
    - If both hash results agree the message is intact
    - If not, the message has been corrupted/compromised

### Secure hash transport

Why must the hash be transmitted securely?

- Cryptographic hashes aren’t keyed, so anyone can produce them

How to transmit hash securely

- Encrypt it
- Unless secrecy required, cheaper than encrypting entire message
- If you have a secure channel, could transmit it that way

### A principle of key use

Both symmetric and PK cryptography rely on a secret key for their properties

The more you use one key, the less secure.

- The key stays around in various places longer
- There are more opportunities for an attacker to get it
- There is more incentive for attacker to get it
- Brute force attacks may eventually succeed

Therefore,

- Use a given key as little as possible
- Change them often
- Within the limits of practicality and required performance

## Secure socket layer (SSL)

A general solution for securing network communication.

- Built on top of existing socket IPC

Establishes secure link between two parties.

- Privacy: nobody can snoop on conversation
- Integrity: nobody can generate fake messages

Certificate-based authentication of server.

- Typically, but not necessarily
- Client knows what server he’s talking to

Optional certificate-based authentication of client.

- If server requires authentication and non-repudiation

PK used to distribute a symmetric session key.

- New key for each new socket
- Rest of data transport switches to symmetric cryptography

### Digital signatures

Encrypting a message with private key signs it.

- Only you could have encrypted it, it must be from you
- It hasn’t been tampered with since you wrote it

Encrypting everything with you private key is a bad idea.

- Asymmetric encryption is extremely slow

If you only care about integrity, you don’t need to encrypt at all.

- Compute a cryptographic hash for your message
- Encrypt the cryptographic hash with your private key
- Faster than encrypting whole message

![[/Untitled 3 48.png|Untitled 3 48.png]]

### Signed load modules

How do we know we can trust a program?

- Is it really the new update to Windows, or actually evil code that will screw me?
- Digital signatures can answer this question

Designate a certification authority.

- Perhaps the OS manufacturer (Microsoft, Apple, …)

They verify the reliability of the software.

- By code review, by testing, etc.
- They sign a certified module with their private key

We can verify signature with their private key.

- Proves the module was certified by them
- Proves the module hasn’t been tampered with

## PK certificate

If I have a public key…

- I can authenticate received messages
- I know they were sent by the owner of the private key

But how can I be sure who owns the private keys?

- How do I know that this is really my bank’s public key?
- Could some swindler have sent me his public key instead?

I can get Microsoft’s public key when I first buy their OS.

- So I can verify their load modules and updates
- But how to handle more general case?

I would like a certificate of authenticity.

- Guaranteeing who the real owner of the a public key is

### What is a PK certificate?

Essentially a data structure containing an identity and a matching public key.

- And perhaps other information

Also containing a digital signature of those items.

Signature usually signed by someone I trust.

- And whose public key I already have

### Using public key certificates

If I know public key of the authority who signed it.

- I can validate the signature is correct
- And the certificate hasn’t been tampered with

If I trust the authority who signed the certificate.

- I can trust the authority who signed the certificate
- e.g. we trust driver licenses and passports

But first I must know and trust signing authority.

- Which really means I know and trust their public key

### A chicken & egg problem

I can learn the public key of a new partner using his certificate.

- But to use his certificate, I need the public key of whoever signed it

I get that public key through some other means.

- Commonly by having the key in a trusted program, like a web browser