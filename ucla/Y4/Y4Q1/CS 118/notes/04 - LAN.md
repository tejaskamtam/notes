---
area: ucla
quarter: Y4Q1
created: 2024-10-15 14:35
updated: Tuesday 15th October 2024 14:35:20
course: CS 118
---
## LAN
- fiber unidirectional 1 to 1
- Ethernet is many to many link
- however bc its a single link, we need to be able to demux the signal to the correct receiver -> Media Access Control Adress (MAC addr.)
- LAN is also known as
	- Multi access link - multiple nodes on the same link
	- broadcast links - every transmission can be heard by all nodes
	- LAN - geographically serviced by a local region 1-10 km(s)
- Pros
	- cost - connect all devices on a campus on a single link
	- bandwidth - ethernet i high bandwidth distributed computing
	- statistical multiplexing - time division multiplexing (TDM) is not good when user traffic is busy -> many collisions
		- each user splits the bandwidth, high bandwidth when low traffic
### Statistical vs Strict Mux
- strict - TDM/FDM where user given fix allocation regardless of whether user want to send -> bad
- bursty - traffic has aa high and average peak
- therefore, strict gives each user $B/N$ bandwidth
- stat mux gives $B/x$ where $x$ is number of busy users, $x<<N$
## ALOHA
- ethernet predecessor - multiple ground stations across Hawaii
- problem - no collision detection when traffic was high -> similar problems in wireless 802.11
- sol - slotted aloha, allocate bandwidth and reduce collision period by half but require shared clock![[Pasted image 20241015144614.png]]
## CSMA/CD & Ethernet
Bob Metcalfe - inventor of Ethernet at Xerox PARC and CSMA/CD for Harvard PhD thesis
### CSMA/CD
- to be better than aloha
- CS - carrier sense -> nodes listen before sending
- MA - Multiple access - many to many
- CD - w/ Collision detection -> only handles collision errors
### Ethernet
- aborts transmission after 64 bytes if a collision is detected while aloha sends full 1500 byte datagram
- only handles collision detection (frequent) but not frame corruption recovery
- senders cannot detect collisions, only nodes at the intersection of 2 signals can detect collisions at their node
- note that collision are between waves in ethernet and 802.11 not mass-based particles
### Packet Size dependence
- ethernet enforces minimum packet size of 64 bytes for CD
- without min packet size - no retransmission ![[Pasted image 20241015145823.png]]
- with limited packet size ![[Pasted image 20241015145839.png]]
- the min-size of the packet depends on the pipe size = transmission rate $\times$ round trip prop delay
	- e.g., if R = 10Mbit/s, RTPD = 25.6$\mu$s; then pipe size = 512 bits = 64 bytes
### Collision Detection
- consider 2 colliders, one should wait 1 slot and the other 0 slots, mux collision or time with coin toss -> just pick 1 signal to pass through the detecting node, e.g. if C detects colision of A->B and B->A and order is A->C->B then C just muxes one of the signals
- consider 16 colliders - ethernet does **Binary Exponential Backoff**
	- after attempt A, each station randomly picks a number of slots between 0 and $2^A-1$. A slot is 51.2$\mu s$ (because of prev question pipe). after 1 collision pick 0 or 1 slot, after 2 collisions pick up to 4 sots, after 3 up to 8 slots (slots 0...7)
- ethernet's 3 mechanisms
	- CS - don't transmit when someone else is (imagine the detecting node wants to transmit)
	- CD - stop frame if CD before 64 bytes of frame
	- Exponential backoff - collisions are frequent so must retransmit, random backoff avoids synchronized colllissions, dynamically adjut number of colliders with backoff
- terms
	- slot time - 2T, where T is 1-way prop delay, limited to 51.2$\mu s$ to allow 64 byte pipe size
	- min packet size - 64 bytes to avoid transmision end before CD
	- jam - transmit smal number of bits after CD to ensure other tranmitterss also detect collision
		- ![[Pasted image 20241015153010.png]]
	- CD - one option is use Manchester encoding averge voltage, e.g. 0 (0V) or 1 (1.5V) has avg 0.75V, collision => average 1.5V
## Ethernet Details
### Terms
- slot time - 2T, where T is 1-way prop delay, limited to 51.2$\mu s$ to allow 64 byte pipe size
- min packet size - 64 bytes to avoid transmision end before CD
- jam - transmit smal number of bits after CD to ensure other tranmitterss also detect collision
	- ![[Pasted image 20241015153010.png]]
- CD - one option is use Manchester encoding averge voltage, e.g. 0 (0V) or 1 (1.5V) has avg 0.75V, collision => average 1.5V
### Header
- dest for mux, source for mux ack, length in case frame is smaller than min packet size, CRC - error detection hash
![[Pasted image 20241015152914.png]]
### Hardware
- limited distance of 2.5 km with 500m wires and 4 repeaters
- thin wire or thick wire
- physical topology of star (all nodes connected to hub) or tree (bus with main line and branches)

### Limitations
- Bandwidth and distance, if speed increased, distance must be shorter, e.g. 100 Mbps ether hass 200m extent
- Gigabit ether has 2m extent -> switches, hubs, point to point
- therefore, cost of stat mux is why ethernet is limited to LAN
- so modern day shift from mainline ethernet to series of point to point switches but keep ethernet header
- CSMA/CD to Switches ![[Pasted image 20241015153510.png]]