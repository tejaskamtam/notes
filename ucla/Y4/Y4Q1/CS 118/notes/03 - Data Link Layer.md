---
area: ucla
quarter: Y4Q1
created: 2024-10-08 14:08
updated: Tuesday 8th October 2024 14:08:47
course: CS 118
title: 03 - Data Link Layer

layout: note
parent: CS 118

---

## Role of Physical Layer Now

- abstracted to a semi-reliable 1-hop bit-pipe (modem to modem)
- bits - transmitted at physical layer
- frame - transmitted at data link layer (ip packet with ethernet header)
- packet - transmitted at ip/routing layer (tcp packet with ip header)
- ![[Pasted image 20241008141303.png]]

## Data Link Sublayers

- quasi-reliable 1-hop frame-pipe (router to router)
- EOD, output from data link is a frame - a group of bits ![[Pasted image 20241008141554.png]]
- **Framing**: breaking up a stream of bits into units called frames so that we can add extra information like destination addresses and checksums to frames.  (Required.)
- **Error detection**: using extra redundant bits called checksums to detect whether any bit in the frame was received incorrectly. (Required).
- **Media Access**: multiple senders. Need traffic control to decide who sends next. (Required for broadcast links).
- **Multiplexing**: Allowing multiple clients to use  Data Link. Need some info in the frame header to identify the client. (Optional)
- **Error Recovery**: Go beyond error detection and take recovery action by retransmitting when frames are lost or corrupted.  (Optional)
  - not usually done in modern routers, assumption is already that not all routers do error recovery, so you can't trust hop-to-hop error recovery
  - but modern storage area networks implement hop-to-hop error recovery to ensure low-latency recovery end-to-end by implement recovery at each hop

## Data Framing

### Why

- frames allow multiplexing and prevent infinite streams
- frames allow for better error detection and recovery

### How

- flag and encoding (HDLC) - add a flag (bit pattern) to delimit frame boundary and encode data to ensure the flag is not preemptively found in the data
- flag and char count (DDCMP) - add flags and a character count, only look for flag after char count
- physical layer flag - supply a special symbol from physical layer to dellimit

### Fixed-Length Framing

- good for receiving router but bad for variable size frames
- usually used within router code to fragment large payloads

### Length-based Framing

- variable length frame with length pre-pended
- still needs a flag to demarcate beginning
- bad if data corrupted b/c requiress reading and must be done while reading transmission
- e.g., DECNet, DDCMP

### Sentinel-based Framing

- variable length frames with flags delimit at both beginning and end
- add stuffing (stuff some bits) where the flag is found in the data/frame
- receiver "unstuffs" data e.g., sps flag is 111, then any time we see 111 in the data, add a 0 after -> 111...1110...111
- irl use byte-stuffing and denote the escape char to prevent false flag assign byte `DLE` and stuff it whenever STX/ETX found in payloaad if you get `DLE` in data then do `DLE_DLE`
- denote flags as STX/ETX (start/end) ![[Pasted image 20241008150307.png]]

### Physical Layer Solution

- because 4-5 encoding produces 16 possible symbols but there are 32 possible encoded, pass 2 of those unused as SOF/EOF

## Error Detection

- B/c TCP doesn't require end-to-end checksums, data link undetected errors must be so small close to 1 undetected error per 20 years of data

### Types of Errors

- **Random Errors**. A noise spike or inter-symbol interference makes you think a 0 is a 1 or 1 to 0.  Fiber: 1 in 10 10
- **Burst errors**: .A group of bits get corrupted  because of synchronization or connector plugged in. Correlated!
- **Modeling Burst error**: Burst error of length k à distance from first to last is k – 1. Intermediate may or may not be corrupted.  Burst error of 5 starting at 50. Bits 50 and 54 are corrupted, bits 51-53 may or may not be corrupted
- **Goal for quasi-reliability**: Like to add checksums to detect as large a burst (say 32) and as many random (at least 3)
- **Comparison**: Imagine a frame of size 1000 and an error rate of 1 in 1000. If random, all frames corrupted on average. If we get a burst of 1000 every 1000 frames, only 1 is lost!

### Parity error detection to Checksums

- parity - parity of the number of 1s in the data
- doing XOR of bits to detect parity may ddetect up to 2 bit error, but how to check error for >3 bits
- instead use checksums
- goal is detection not correction, detection = some bit in frame bad so drop frame vs flip bit (correction)
- CRC32 - use mod 2 division (XORs) for checksum instead of sum

### Simple Divide Checksum

- ![[Pasted image 20241008152751.png]]

### Mod 2 Checksum - CRC (Cyclic Redundancy Check)

- background ![[Pasted image 20241008153149.png]]
- example, observe remainder is less than generator![[Pasted image 20241008153657.png]]
- CRC is implemented via LFSR in CPU ![[Pasted image 20241008154152.png]]

## Error Recovery (Optional)

- usually not done on WAN but done on SAN
- RFC spec - english spec for network protocols
- RFC for error recovery at data link layer must ensure packets delivered without duplication, loss, or mis-ordering

### Assumption

- **Assumes error detection**: Assumes undetected error rate small enough to be ignored
- **Loss as well as errors**: whole frames can be lost in a way not detected by error detection
- **FIFO**: Physical layer is FIFO
- **Arbitrary Delay**: Delay on links is arbitrary and can vary from frame to frame.

### Time-Space Examples

- ![[Pasted image 20241010143342.png]]
- must return ack to validate the sending of the next packet, must id the packets to detect true duplication vs intended duplicate![[Pasted image 20241010143413.png]]
- issue with sending acks back-to-back -> require ack ids ![[Pasted image 20241010143534.png]]

### Stop and Wait Protocol (Send then wait for ack)

- time state diagram ![[Pasted image 20241010145025.png]]
- global state view of messages in channels ![[Pasted image 20241010144913.png]]
- code for sender and receiver ![[Pasted image 20241010145056.png]]

### Band Invariance

- when receiver processes the message in channel and sends ack, all state are only of 1 number (the id of the latest packet acknowledged) -> thus we can check for correctness of packets by ensuring band invariance
- prove band invariance by checking state transitions ![[Pasted image 20241010150200.png]]
- alternating bit recovery code: ![[Pasted image 20241010150219.png]]

### Performance Measures

- throughput - jobs completed per second
- latency - worst-case time to complete a job
- 1-way propagation delay - time for the transmitted bit to reach the receiver; disregarding transmission rate, there is some amount of time it takes for the bit to travel the length of the link - this is the 1 way propagation delay
- transmission rate - the rate at which bits can be sent over a link, i.e. the number of bits per second - tells us that the second bit may come quickly after the first bit is sent
- pipe size (bandwidth-delay product) = transmission rate $\times$ round-trip propagation delay
- pipe size (and prop delay) tells us our pipe/link utilization e.g., stop and wait frames (send next frame after ack) ![[Pasted image 20241010151808.png]]

### Sliding Window Protocoll

- **Window**: Sender can send a window of outstanding frames before getting any acks. Lower window edge $L$, can send up to $L + w - 1$.
- **Receiver numbers**: receiver has a receive sequence number R, next number it expects. $L$ and $R$ are initially $0$.
- **Sender Code**: Retransmits all frames in current window until it gets an ack. Ack numbered $r$ implicitly acknowledges all numbers $\lt r$.
- **Two variants**: receiver accepts frames in order only (go-back-N) or buffers out-of-order frames (selective reject)
- we have batched rejects or selective rejects using complex acks or simple acks but resend all packets in the sliding window of frames sent![[Pasted image 20241010152206.png]]
- code for both implementations
  - ![[Pasted image 20241010152654.png]]
  - ![[Pasted image 20241010152708.png]]
  - ![[Pasted image 20241010152718.png]]
  -
- implementation details - ONLY for FIFO packets
  - ![[Pasted image 20241010154221.png]]
  - ![[Pasted image 20241010154444.png]]
- flow control - variable size windows, usually et by receiver to prevent backlogging frames (send the right window edge with ack)
- previously selelctive reject was not allowed as you need long listss/buffers for acks, but now RFC has some allowance

### Restart signal

- although we can send restarts for error recovery, there is a deterministic protocol violation when restart ack is not sent but datagrams are already sent on line ![[Pasted image 20241015142510.png]]
- so we can instead number the restarts as well

## Invariants

- Consider 9 queens problem: in a game of chess White can have at most 9 queens on the board, give us the invariant: $$Q\le 9$$
- An inducted invariant includes pawns s.t.: $$Q+P\le 9\implies Q\le9$$
- also used in program, e.g. in bin. search. $k$ is in $R$ or $k$ is not in the array

### Band Invariance

- consider state of sender and receiver
- there are 2 possible overall states:
  - 1 band: sender is at $x$, to signal $x$, receiver at $x$
    - $x$ band
  - 2 bands: sender at $x$, to signal at $x$, receiver at $x+1$, from signal (ack) at $x+1$
    - $x$ band and $x+1$ band
- therefore, band invariance within $x+1$, there will never be $x+2$ in any band
