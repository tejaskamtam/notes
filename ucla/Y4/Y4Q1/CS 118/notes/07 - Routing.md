---
title: 07 - Routers
area: ucla
created: 2024-10-22 13:57
updated: 2024-10-22 13:57
course: CS 118
parent: CS 118
layout: note
---
## Bridge to Routers
- Data link headers came before data link relays (bridges/switches) so they had to adapt
- but routers were first-class creations. The debate is whether to use bridges universally or routers
- the big problem is no loops in switch topology -> need possibly many intermediaries to communicate despite having fiber or really good hardware between stations
- switches also cannot handle **address incompatibility** (HDLC vs Ethernet (PPP)), **packet size incompatibility** and **bandwidth incompatibility** (FDDI vs Ether)
## Abstraction
- Bridges extend LANs to extended LANs
- Routers connect extended LANs to WANs
- Consider the following example
### Full Topology
![[Pasted image 20241022142109.png]]
### Bridge View
![[Pasted image 20241022142125.png]]
### Router View
![[Pasted image 20241022142142.png]]


## OSI Overview
![[Pasted image 20241022143325.png]]
![[Pasted image 20241022143335.png]]


## IP Forwarding
### Terms
- ISP - Internet Service Provider, usually local with regional POPs
	- usually small ISPs connect with mega ISPs then to NAPs
- POP - Point of Presence, a physical location with a link that ISPs usually have per region
- Autonomous Systems - network managed by 1 manager, entirely contained in a LAN or alike
- NAP - Network Access Point, single connect for all ISPs
	- legacy, very cluttered and congested, instead peering
- Peering - Interconnect b/w ISPs w/o NAPs
	- megacorps like google, meta have their own WANs and peer with everyone with POPs everywhere
### Internet
- IPs goal was to interconnect (internet) different network like DECNET, SNA, XEROX Net, Apple Talk
	- eventually all disappeared and IP works directly
- error message backward using ICMP (protocol)
### History
- 1970s, ARPANET - linked govt and university ite (UCLA) in 1970s
	- was shutdown by gov too risky
- 1983, NSFNET - 1983 ARPANET splits up into MILNET and ARPANET. In 1984 NSF establishes NSFNET to be backbone.  Campuses attached to backbone via regional networks (NYSERNET etc.) Strict hierarchy breaks down because of direct connections between providers
- late 1980s - multiple providers
### Domain Name Server
- servers that map domain names (urls) to 32-bit (5-byte) IP addrs
### DHCP Server
- when a station or node connects, it multicasts to DHCP server which allocates a local IP for the node, the prefix tells us the router IP
- this is slightly different when considering local vs public IPs
### Original/Old Model
- small number of large networks (class A), moderate number of campus networks (class B), many LANs (class C) ![[Pasted image 20241022144844.png]]
- Find Dest - parse Network number of dest addr and check for class of addr
- Final hop reached? - if network number of dest = network number of this router' local interface(s) then deliver packet. Map to local address using ARP
- lookup router table - lookup network number in routing table, if exists -> forward. else -> send to default router (e.g., many addrs in campus network -> have default router and then route internally in campus network)
### Challenges
- inefficient address usage - any org that need >255 addrs needed class B -> quickly ran out of class B addrs
- routing table growth - response to above -> allocate more class C addrs -> each core router needed much larger routing tables
- sol - change IP forwarding to longest matching prefix

### Subnetting/Supernetting
![[Pasted image 20241022151004.png]]

### New IP Forwarding
1. lookup - find longest matching prefix P of dest IP addr from forwarding table
2. default or local
	1. if P is nil -> forward on default
	2. elif P is associated with local interface -> deliver and map to local addr using ARP,
	3. else -> forward to next hop associated with P
- router internally has a crossbar switch which is used to bridge packets to the correct data link terminal. i.e. line
- the forwarding table maps ip prefixes to output links, this is constructed by routers comms with each other telling them that ips are on a specific direction -> maps to specific data links -> maps to specific mac addrs/ethernet terminals
- NOTE: IP does not yet know the mac addrs it needds to send -> see prob and sol below
- ![[Pasted image 20241022151707.png]]
### IP Solution to End-node Problem
- Given top. ![[Pasted image 20241022152835.png]]
- Prob1 - Routers need Data Link Addresses of endnodes
	- Sol1 - ARP for MAC address of destination
- Prob 2 - Endnodes need DL address of 1 router
	- Sol2 - a service called called DHCP gives you the IP address of one router (auto-configuration)
- Prob3 - E1 and E2 should be able to communicate without a router
	- Sol3 - two endnodes know they are on same subnet by comparing masks.  Then ARP
- Prob4 - E1 to E3 traffic should go through R2
	- Sol4 - send to router and router sends redirect  if packet returns on interface it entered router.  (Ignore this code in project),

### Routing Packet Structure
![[Pasted image 20241022153223.png]]


## Bandwidth Incompatibility (Path MTU)
- sps packet is larger than the data link bandwidth ![[Pasted image 20241022153650.png]]
- og IP said to fragment and reassaablle but was too expensive
- modern end node find right size known as **Path MTU** and sends request for this size instead of asking routers to fragment
## Fast IP Lookups
- Sol1 - Use unibit prefix trie as lookup table - too slow, 32 steps in worstcase![[Pasted image 20241022153910.png]]
- Sol2 - Multibit trie - to slow and tm memory ![[Pasted image 20241022154056.png]]
- Sol3 - ternary CAM (content addressable memory) - memory where each bit can be 0, 1, or \* that can be searched in parallel because we search by content instead of id or position- but requires tm power at high speed access, low longevity of memory ![[Pasted image 20241022154314.png]]
- diff router size ue diff types: compressed multi-bit tries, ternary CAMs
