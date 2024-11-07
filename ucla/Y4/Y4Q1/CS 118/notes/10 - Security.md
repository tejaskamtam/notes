---
title: 10 - Security
area: ucla
created: 2024-12-07
course: CS 118
parent: CS 118
layout: note
---
## Internet Security
- instead of multiple ad-hoc security measures, implement security at Transport layer in TCP/UDP
- TLS - Transport Layer Security
- made up of: encryption and signatures
- TLS is basis of **HTTPS** and **SSL**

## Symmetric Key Encryption
- symmetric key encryption - sender and receiver both have the same key ![[Pasted image 20241107144333.png]]
### One Time Pad
- Sender and receiver have secret key of random chars `K` of length of the message `M` i.e., `|K| = |M|`
- sender creates cipher text `C = M ^ K` and sends over TCP
- the receiver decodes cipher text via `M = C ^ K`
#### Problems
- con1: how to get key to both endpoints
- con2: can't reuse because key dependent on message len
#### Solutions
- key reuse (con2) solved by encryption standards like **DES/AES** whih uses a hort 64 bit key (< `|M| = ~1500 Bytes`)
- key exchange (con1) solved by public key encryption and certificates
### DES/AES
- Block Cypher
	- Breaks message into 64 bit chunks
	- Uses a sequence of Shift and XORs based on 64-bit key
	- Based on a basic unit called a Feistel function 
- Feistel function ![[Pasted image 20241107142350.png]]
	- Break text into two halves. Right half is combined with key and a Round function (think XOR) and XORed with left half
	- Do several rounds to encrypt, decryption in reverse order
	- Luby-Rackoff: if Round function F is pseudo-random, then after 4 rounds of this, we get a pseudorandom permutation
- Chaining Modes
	- Simplest mode: **ECB** (Electronic Code Blur), each block is done independently
	- ECB has a pattern issues when the single blocks occur multiple times within the text e.g., tux ![[Pasted image 20241107142618.png]]
#### CBC - Cypher Block Chaining
- CBC or Cypher Block Chaining: Each block is XORed with previous block before being encrypted ![[Pasted image 20241107142829.png]]
- First block has to be XORed with an initialization vector (IV) that can be sent in the clear
- pro: no leakage like in previous slide
- con: Sequential not parallel.  Also as in Ethernet, last block may have be padded to be 64 bits
- Several other modes allowed by TLS but CBC is quite common
#### DES - Data Encryption Standard
- US encryption standard (NIST 1993)
- **56**-bit symmetric key, **64**-bit plaintext input
	- no known “backdoor” decryption approach
	- Too short for current computing power - can brute force it
- ![[Pasted image 20241107143020.png]]
#### AES - Advanced Encryption Standard
- Newer (2001) symmetric-key standard, replacing DES
- Processes data in **128** bit blocks
- 128, 192, or 256 bit keys, harder to break!
- Multiple rounds of encryption, also makes it harder to break compared to DES

## Public Key Encryption
- every node has 2 keys: secret and public
- sender encrypts message with **sender's private key**
- receiver decrypts with **sender's public key**
- ![[Pasted image 20241107144355.png]]
- con: much more computationally expensive
- con: susceptible to phishing because public keys can be posted anywhere, and it is hard to recognize whether the public key actually belongs to the user
- e.g., Diffie-Hellman76, RSA78 (Rivest-Shamir-Adleman), ed25519 (Edwards Curve25519)
- pro: commutative so keys can be applied in any order, good for auth
### RSA
#### Overview
RSA (Rivest-Shamir-Adleman) encryption is a widely used public-key cryptographic system that enables secure data transmission. Here’s a step-by-step explanation of how RSA encryption works:

##### 1. Key Generation
The first step in RSA encryption is generating a pair of keys: a public key and a private key.

- **Choose Two Prime Numbers**: Select two distinct large prime numbers, \( p \) and \( q \).
  
- **Calculate \( n \)**: Compute \( n = p \times q \). The value \( n \) is used as the modulus for both the public and private keys.

- **Calculate the Totient**: Compute the totient \( \phi(n) = (p-1)(q-1) \). This value is used in the key generation process.

- **Choose the Public Exponent \( e \)**: Select an integer \( e \) such that \( 1 < e < \phi(n) \) and \( e \) is coprime to \( \phi(n) \). Common choices for \( e \) are 3, 17, or 65537.

- **Calculate the Private Exponent \( d \)**: Compute \( d \) as the modular multiplicative inverse of \( e \) modulo \( \phi(n) \). This means \( d \times e \equiv 1 \mod \phi(n) \).

- **Public and Private Keys**: The public key is the pair \( (e, n) \), and the private key is the pair \( (d, n) \).

##### 2. Encryption

To encrypt a message using RSA:

- **Convert the Message to an Integer**: The plaintext message \( M \) must be converted into an integer \( m \) such that \( 0 \leq m < n \).

- **Encrypt the Message**: The ciphertext \( c \) is computed using the public key:
  \[
  c \equiv m^e \mod n
  \]

##### 3. Decryption

To decrypt the ciphertext:

- **Decrypt the Message**: The original message \( m \) is recovered using the private key:
  \[
  m \equiv c^d \mod n
  \]

- **Convert the Integer Back to Plaintext**: The integer \( m \) is then converted back to the original plaintext message \( M \).

##### 4. Security

The security of RSA relies on the difficulty of factoring the product of two large prime numbers. While it is easy to multiply two primes to get \( n \), it is computationally hard to do the reverse (factor \( n \) back into \( p \) and \( q \)) if \( n \) is large enough (typically 2048 bits or more).

##### Summary

In summary, RSA encryption involves generating a pair of keys, encrypting a message with the public key, and decrypting it with the private key. Its security is based on the mathematical properties of prime numbers and modular arithmetic. RSA is widely used for secure data transmission, digital signatures, and authentication.
#### Visual
![[Pasted image 20241107144823.png]]
#### Example
- Suppose Bob selects the primes  $p=11$ and $q = 17$, along with  $e = 3$
- Bob calculates $n = pq = 11\times17 = 187$ and $\Phi(n)=(p−1)(q−1)=10\times16=160$
- Bob calculates $d=107$, since  $de  = 321$ and $321≡1(\mod \Phi(n))$
- Bob distributes public key:  $n=187$ and $e = 3$
- Now suppose Alice wants to send the message `"HELLO"` character by character. `"H" = 72` in ASCII. Alice calculates $m  =72^3 ≡183 (\mod187)$
- Bob calculates $183^{107} \mod 187 = 72$ back to `"H"`!

### Digital Signature
![[Pasted image 20241107145326.png]]

### Message Digests
- goal to reduce long-length encrypt to fixed size computationally easy fingerprint/hash
- Older: MD5 (RFC 13121), SHA-1xx
- Modern: SHA2 family, SHA3 family, BLAKE2 family, etc.
![[Pasted image 20241107145551.png]]

### MAC - Message Authentic Code
- Message Digest via a hash like SHA only guarantees data integrity
- **Message Auth Code (MAC)** - guarantees data integrity and authenticity, used in TLC, uses shared secret key (symmetric)
- e.g., HMAC, many used in TLC (Transport Layer Cryptography)

## Certifications
- public keys not perfect, how can u determine a public key actually belong to the user it sys it belongs to
- Trusted Certification Authority (CA)
- a trusted authority e.g., VeriSign, will register a CA key with the user and applies the certificate to the message in transit ![[Pasted image 20241107150617.png]]
- identity is verified offline at e.g., a VeriSign office
- decryption ![[Pasted image 20241107150657.png]]

### Replay Attack
- issue with both public key and symmetric key and certification is replay attacks - replaying an event or request on the network
- Use **nonces** - random, large, one-time use numbers 
- or **sequence numbers** that will be encrypted

## TLS - Transport Layer Security
- exposes a TLS/SSL API on TCP e.g., OpenSSL ![[Pasted image 20241107151534.png]]
- basic idea is a handshake with keys ![[Pasted image 20241107151832.png]]
- client-server agreement on method of auth and encryption - cipher agreement: DES, AES, 3DES; RSA+DH, ed25519; HMAC+MD5, etc.
### RSA Example
- idea is pseudorandom number generator with pre-master then dilute down to random number and verify via shared secret keys (MACs)
1. ![[Pasted image 20241107152048.png]]
2. ![[Pasted image 20241107152109.png]]
### Diffie-Hellman Example (Proj2)
![[Pasted image 20241107152326.png]]

### TLS Protections
- Attacker runs a sniffer to capture our WiFi session?
	- (maybe by breaking crummy WEP security)
	- But: encrypted communication is unreadable
		- No problem!
- DNS cache poisoning?
	- Client goes to wrong server
	- But: detects impersonation - No problem!
- Attacker hijacks our connection, injects new traffic
	- But: data receiver rejects it due to failed integrity check No problem!
- DHCP spoofing?
	- Client goes to wrong server
	- But: detects impersonation -- No problem!
- Attacker manipulates routing to run us by an eavesdropper or take us to the wrong server?
	- But: they can’t read; we detect impersonation No problem!
- Attacker slips in as a Man In The Middle?
	- But: they can’t read, they can’t inject
	- Can’t even replay previous encrypted traffic - No problem!

