---
title: 11 - TCP
area: ucla
created: 2024-00-12
course: CS 118
parent: CS 118
layout: note
---
## TCP Overview
### Tasks
- Muxing - UDP and TCP
- Reliability - TCP only
- Flow Control - TCP only
- Congestion Control - TCP only
### Process Abtraction
- transport protocol abstract proceses to ports
- processes are identified by IP addr (32-bits), protocol, and port (16 bits)
- services abstracted  to their required protocol: http (web), smtp (mail), dns, etc.
#### Port Selection
- OS assigns permanent ports to value <= 1024 e.g. http 80, smtp 25, dns 53
- OS allocates ephemeral (temp) ports to values above 1024

## UDP - User Datagram Protocol
- only handles multiplexing ![[Pasted image 20241112144653.png]]
- no reliability in ordering, etc.
- no need for retransmit or acks
- used for low latency reqs e.g. streaming, dns, NTP (Network Time protocol - clock syncing), video games
- "connectionless" packet delivery![[Pasted image 20241112144614.png]]

## TCP - Transmission Control Protocol
- Reliable bi-directional **bytestream** between processes
	- Uses a sliding window protocol for efficient transfer
	- Huge sequence numbers (4-bytes) because of possibly very old out of order packets
- Connection-oriented
	- Conversation between two endpoints with beginning and end
- Flow control (generalization of sliding window)
	- Prevents sender from over-running receiver buffers (tell sender how much buffer is left at receiver)
- Congestion control (next lecture)
	- Prevents sender from over-running network capacity
- TCP delivery ![[Pasted image 20241112144929.png]]
### Reliability - Data Link vs TCP
- ![[Pasted image 20241112145400.png]]![[Pasted image 20241112145419.png]]
### Similarity to Project
#### Similarities
- 3-way handshake with syn acks
- retransmission after 3 dup acks
- large seq num to handle retransmitted old packets
#### Differences
- retransmission timer set dynamically by calc round trip delay/time
- window is fixed but TCP calcs dynamically based on flow and congestion control
- selective reject support (TCP SACK) in addition to go back N
### TCP Connection Handling
- nodes identified by 4/5-tuple 
  `(src IP, src PORT, dst IP, dst PORT, protocol)`
- seq number assigned per byte (allows for packet sizes to change between transmissions)
#### 3-Way Handhake
- 3-Way Handshake with nonce seq ![[Pasted image 20241112151824.png]]
- We could abbreviate this setup, but it was chosen to be robust, especially against delayed duplicates
	- Three-way handshake first described inTomlinson 1975
- Choice of changing **initial sequence numbers (ISNs)** minimizes the chance of hosts that crash getting confused by a previous incarnation of a connection
- How to choose ISNs?
	- Maximize period between reuse
	- Minimize ability to guess (why?)
	- Random works OK, as in Project 2
- Operation
	1. Server: If in LISTEN and  SYN arrives, then transition to SYN_RCVD state, replying with ACK+SYN. 
	2. Client: active open, send SYN segment and transition to SYN_SENT. 
	3. Arrival of SYN+ACK causes the client to move to  ESTABLISHED and send an ack
	4. When this ACK arrives the server finally moves to the ESTABLISHED state. 

#### TCP Header
- src dest identified by IP + PORT
![[Pasted image 20241112151844.png]]

#### TCP Disconnect
1. Need timers anyway to get rid of connection state to dead nodes.
2. However, timer should be large so  that "keepalive" hello overhead  is low.
3. If communication is working,  would prefer graceful closing  (so receiver process knows  quickly) to long timers.
4. Hence 3 phase disconnect handshake  After sending disconnect and receiving disconnect ack, both  sender and receiver set short  timers.
![[Pasted image 20241112152608.png]]
- enter `TIME_WAIT` to handle very old packets that may not have been retransmit or have not been acked yet
- We wait $2\times MSL$ (maximum segment lifetime of 60 seconds) before completing the close
- Why?
	- ACK might have been lost and so FIN will be resent
	- Could interfere with a subsequent connection
- Real life: Abortive close
	- Don’t wait for $2\times MSL$, simply send Reset packet (RST)

### TCP Reliability
- Usual sequence numbers except:
	- Very large to deal with out of order (modulus > 2 W etc. only works on FIFO links).  As in Project 2
	- TCP **numbers bytes** not segments: allows it to change packet size in the middle of a connection
	- The sequence numbers don’t start with 0 but with an **ISN**. 
- Reliable Mechanisms similar except:
	- TCP has a quicker way to react to lost messages 
	- TCP does a **crude form of selective reject** not go-back N
	- TCP does flow control by allowing a dynamic window which receiver can set to reduce traffic rate (next lecture)
- recall go-back-N: retransmit all packets from last ack
- real timer for retransmit is based on calculated **Round Trip Time (RTT)**
#### TCP Fast Retransmit
- like selective reject but immediate retransmit with sliding window buffer
- timer as backup, use 3 dup acks to identify ![[Pasted image 20241112153315.png]]
#### TCP SACK - Selective ACK
- ack with last received in-order packet, BUT also send **sack** with received out of order packets ![[Pasted image 20241112153634.png]]
- limitations: ack/sack info could be very long if many drops and many out of order packets
- solution: limit to 3 sack blocks (ranges) - act like any out of order packets after reporting at most 3 sack ranges are considered to be lost
- e.g., ACK 1, SACK 3-8, SACK 10-15, SACK 17-25 => packets 2,9,16 are lost and any after 25 are considered lost or not sent yet
### Socket API
![[Pasted image 20241112154047.png]]
## QUIC - Quick UDP Internet Connections
- developed by google to make initial handshake faster with TLS
- Runs on UDP ![[Pasted image 20241112154234.png]]
- also adds other stuff like congestion and flow control for UDP
### The trick to lower latency
- Idea 1: Combine security handshake and sequence number handshake on first connection to server
- Idea 2: If server remembers information about client, need 0 handshakes on later connections
- Three way handshakes are required because server forgets info on client.  Important in old days but no longer as severs have massive memory
- A round trip is a big deal (several hundred msec across US) at today’s high speeds
### Additional Stuff
- Stream multiplexing: multiple streams in a single QUIC connection between client and server for HTTP/2
- No head of line blocking: can do HTTP/2 over a single TCP connection but a single loss stalls all streams.  Not so in QUIC
- Shared congestion information: as we will see it takes TCP a long time to ramp up.  In QUIC all congestion information is shared. 
- Wave of future: 9% of all websites use QUIC (4/2023). 40% of Chrome traffic uses QUIC 2
