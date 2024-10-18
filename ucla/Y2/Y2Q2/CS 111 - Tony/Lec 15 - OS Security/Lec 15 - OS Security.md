### Introduction

OS abstracts hardware access and provides interface visible to users.

- If OS isn’t protected, the machine isn’t protected
- Flaws in OS generally compromise all security at higher levels

### Why is OS security important?

- OS controls access to application memory
- OS controls scheduling of the processor
- OS ensures that users receive the resources they ask for

If OS isn’t doing these things securely, practically anything can go wrong.

- Almost all other security systems assume a secure at the bottom

## Key Definitions

- Security
- Protection
- Vulnerabilities
- Exploits
- Trust
- Authentication & authorization

### Security & Protection

**Security** is a policy.

- e.g. no unauthorized user may access this this

**Protection** is a mechanism.

- e.g. system checks user identity against access permissions.

Protection mechanisms implement security policies.

### Vulnerabilities & Exploits

A **vulnerability** is a weakness that can allow an attacker to cause problems.

- Not all vulnerabilities can cause all problems
- Most vulnerabilities are never exploited

An **exploit** is an actual incident of taking advantage of a vulnerability.

- Allowing attacker to do something bad on some particular machine
- Term also refers to the code or methodology used to take advantage a vulnerability

### Trust

Applications on OS have to trust the OS.

OS controls…

- All the hardware, including the memory
- How your processes are handled
- Controls all the I/O devices

# Authentication & Authorization

In many security situations, we need to know who wants to do something.

- We allow trusted parties to do it
- We don’t allow others to do it

**Authentication**: know who’s asking

**Authorization**: check if that party should be allowed to do it

- Authorization usually comes after authentication

### Real world authentication

- By recognition
    - I see your face and know who you are
- By credentials
    - You show me your driver’s license
- By knowledge
    - You tell something only you know
- Identification by location
    - You’re behind the counter at the DMV
- These all have cyber analogs

### User privileges

In machine language, we rely primarily on user ID.

- Which uniquely identifies some user
- Processes run on the user’s behalf, so they inherit his ID
    - e.g. a forked process has the same user associated as the parent

Implies a model where any process belonging to a user has all his privileges.

- Which has its drawbacks
- But that’s what we use mostly

## Passwords

Since process inherit their user IDs, somewhere we have to create a process belonging to a new user.

- Typically on login to a system

We authenticate the new user by password.

- System must be able to check that the password is correct
    - Either by storing it or a hash of it (a better option)
- If correct, tie user ID to a new command shell or window management process

### Problems with passwords

They have to be unguessable.

- Yet easy for people to remember

If networks connect remote devices to computers, susceptible to password sniffers

- Attacking programs which read data from the network, extracting passwords when they see them
- Unless quite long, brute force attacks (de-hash) often work on them

So passwords should be…

- Sufficiently long
- Unguessable (contain non-alphabetic characters)
- Never be written down or shared
- Changed often?

## Challenge/response systems

Authentication by what questions you can answer correctly.

- System asks the user to provide some information
- If provided correctly, the user is authenticated

Safest if it’s a different question every time.

- Not very practical without hardware support

### Hardware-based challenge/response

The challenge is sent to a hardware device belonging to the appropriate user.

- Authentication based on what you have

Sometimes mere possession of device is enough.

- e.g. text challenges sent to a smart phone to be typed into web request

Sometimes the device performs a secret function on the challenge.

- e.g. smart cards

## Biometric authentication

If based on what you _know_, usually too few unique and secret challenge/response pairs.

- Often the response can be found by attackers

If based on what you _have_, fails if you don’t have it.

- And whoever have it might pose as you

Biometric authentication is based on what you _are_.

- Measure some physical attribute of the user
    - e.g. fingerprints, voice patterns, retinal patterns
- Convert it into a binary representation
- Check the representation against a stored value for that attribute
- If it’s a close match, authenticate the user

### Problems

- Requires very special hardware
- Many physical characteristics vary too much for practical use
- Generally not helpful for authenticating programs or roles
- Requires special care when done across a network

### Errors

- False positives
    - You identified Bill Smith as Peter Reiher
    - Probably your biometric system was too generous in making matches
    - Bill Smith can pretend to be me
- False neggatives
    - You didn’t identify Peter Reiher as Peter Reiher
    - Probably because your biometric system was too picky in making matches
    - I can’t log into my own account

### Internet issues

- If authentication is on the same machine, it works find
- If on the internet, the attacker can obtain a copy her can send the pattern over the network
    - Requires high confidence in security of path between biometric reader and checking device

## Multi-factor authentication

Rely on two separate authentication methods.

- e.g. a password and a text msg to phone

If well done, each method compensates for some of others’ drawbacks.

- The current preferred approach in authentication

### Factors

Something you know: Password or PIN

Something you have: ATM or a smart phone

- e.g. authenticate to ATM by showing the ATM card and entering the PIN
- e.g. authenticate to UCLA’s network by showing the password and proving you have your phone

# Access control in OS

OS can control which processes access which resources.

- Giving it the chance to enforce security policies
- The mechanisms used to enforce policies on who can access what are called **access control**

### Access control list (ACL)

For each protected object, maintain a single list.

- Managed by OS, to prevent improper alteration

Each list entry specifies who can access the object.

- And the allowable modes of access

When something requests access to an object, check the access control list.

### The Unix File System

- An ACL-based method for protecting files
- still in very wide use today
- per-file ACLs (files are the objects)
- 3 subjects on list for each file
    - owner, group, other
- and three modes
    - read, write, execute
    - sometimes these have special meanings

### Pros and Cons of ACL

### Pros:

- easy to figure out who can access a resource
- ease to revoke or change access permissions

### Cons:

- hard to figure out what a subject can access
- changing access rights requires getting to the object

### Capabilities

- each entity keeps a set of data items that specify his allowable accesses
- essentially, a set of tickets
- to access an object, present the proper capability
- possession of the capability for an object implies that access is allowed

### Properties of Capabilities

- Capabilities are essentially a data structure
    - basically just a collection of bits
- merely possessing the capability grants access
    - so they must not be forgetable
- To ensure that capabilities can’t be forged:
    - Don’t let the user/process have them
    - Store them in OS instead

### Pros & Cons of capabilities

Pros

- Easy to determine what objects a subject can access
- Potentially faster than ACLs (in some circumstances)
- Easy model for transfer of privileges

Cons

- Hard to determine who can access an object
- Requires extra mechanism to allow revocation
- In network environment, need cryptographic methods to prevent forgery

### OS use of access control

OS often use both ACLs and capabilities.

- Sometimes for the same resource

e.g. Unix uses ACLs for file opens

- Which creates a file descriptor with a particular set of access rights
- The descriptor is essentially a capability

### Enforcing access in OS

Protected resources must be inaccessible.

- Hardware protection must be used to ensure this
- So OS can make them accessible to a process

To get access, issue request (system call) to OS.

- OS consults access control policy data

Access may be granted directly.

- Resource manager maps resource into process

Access may be granted indirectly

- Resource manager returns a capability to process

## Cryptography

- much of computer security is about keeping secrets
- one method of doing so is to make it hard for others to read the secrets
- while making it simple for authorized parties to read them
- that's what cryptography is all about
    - transforming bit patterns in controlled ways to obtain security advantages

### Cryptography Terminology

Sender is S, receiver is R

**Encryption:** making message unreadable/unalterable by anyone but R

**Decryption**: making encrypted message readable by R

**Cryptosystem:** a system performing these transformations

**Cipher**: rules for transformation

**Plaintext**: original form of the message (P)

**Ciphertext**: encrypted form of the message (C)

![[/Screen_Shot_2022-06-05_at_6.04.47_PM.png|Screen_Shot_2022-06-05_at_6.04.47_PM.png]]

### Cryptographic Keys

- most cryptographic algorithms use a key to perform encryption and decryption
    - referred to as K
- the key is a secret
- without a key, decryption is hard
- with the key, decryption is easy
- Reduces the secrecy problem from your (long) message to the (short) key

### More Terminology

- the encryption algorithm is referred to as E()
- C = E(K, P)
- the description algorithm is referred to as D()
- the decryption algorithm also has a key
- the combination of the two algorithms are often called a cryptosystem

### Symmetric Cryptosystems

- C = E(K, P)
- P = D(K, C)
- P = D(K, E(K, P))
- E() and D() are not necessarily the same operations

Advantages

- encryption and authentication performed in a single operation
- well known ones perform much faster than asymmetric key systems
- no centralized authority required
    - though key servers help a lot

Disadvantages

- hard to separate encryption from authentication
    - complicates some signature uses
- non-repudiation hard without servers
- key distribution can be a problem
- scaling
    - especially for Internet use

### Popular symmetric ciphers

- Data encryption standard (DES)
    - Old US encryption standard
    - Still somewhat used, for legacy reasons
    - Weak by modern standards
- Advanced encryption standard (AES)
    - Current US encryption standard
    - Probably the most widely used cipher
- Blowfish
- Many others…

### Brute force attacks in symmetric ciphers

Brute force: try every possible key until one works

The cost of brute force attacks depends on key length.

- For N possible keys, attack must try N/2 keys on average before finding the right one

DES uses 56 bit keys

- Too short for modern brute force attacks

AES uses 128 or 256 bit keys

- Long enough

## Asymmetric cryptosystem

Often called **public key cryptography** (PK for short)**.**

Decryption and decryption use different keys

$C=E(K_E,P)$﻿

Often works the other way to.

$C'=E(K_D,P)$﻿

### Using Public Key Cryptography

- Keys are created in pairs
- one key is kept secret by the owner
- the other is made public to the world
- if you want to send an encrypted message to someone, encrypt with his public key
    - only he has private key to decypt

### Authentication with public keys

- if I want to sign a message, encrypt it with my private key
- only I know private key, so no one else could create that message
- everyone knows my public key, so everyone can check my claim directly
- much better than with symmetric crypto
    - the receiver could not have created the message
    - only the sender could have

### Issues with PK key distribution

Security of public key cryptography depends on using the right public key.

If I’m fooled into using wrong one, that key’s owner reads my message.

- Or I authenticate incorrectly

Needs high assurance that a given key belongs to a particular person.

- Either a **key distribution infrastructure**
- Or use of **certificates**

Both are problematic, at high scale and in the real world.

### Nature of PK algorithms

Usually based on same problem in mathematics

- Like factoring extremely large numbers

Security less dependent on brute force.

- More on the complexity of the underlying problem
- Also implies choosing key pairs is complex and expensive

### Example public key ciphers

- RSA
    - The most popular public key algorithm
    - Used on pretty much everyone’s computer nowadays
- Elliptic curve cryptography
    - An alternative to RSA
    - Tends to have better performance
    - Not as widely used or studied

### Security of PK systems

Based on solving the underlying problem

- For RSA, factoring large numbers

In 2009, a 768 bit RSA was successfully factored.

Research on integer factorization suggests keys up to 2048 bits may be insecure.

- In 2013, Google went from 1024 to 2048 bit keys
- Size will keep increasing
- The longer the key, the more expensive the encryption and decryption

## Combination of symmetric and asymmetric cryptography

Very common to use both in a single session.

Asymmetric cryptography essentially used to “bootstrap” symmetric cryptography.

- Use RSA (or another PK algorithm) to authenticate and establish a **session key**
- Use DES or AES with session key for the rest of transmission

[[Reading 15]]