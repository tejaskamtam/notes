---
title: 12 - Application Protocols
area: ucla
created: 2024-21-21
course: CS 118
parent: CS 118
layout: note
---
### Client-Server vs. P2P
- Client-server - server always on with permanent IP, client connects with dynamic IP
	- e.g., HTTP, IMAP, FTP
- P2P - no such server, all inter client connects, scalable
	- e.g., torrent file sharing - bittorrent
### Process Communication
- processes on the same host comms via Inter-Process Comms (IPC) via OS
- client-server - processes are either clients or servers and are always listening or trying to connect
- p2p - procs have both client and server ports
- comms via sockets (abstraction) ![[Pasted image 20241121142638.png]]
- procs identified by both IP and Port
	- port e.g., HTTP:80, SMTP:25 (mail)

## Application Level Protocols
- protocols contain/define ![[Pasted image 20241121142747.png]]
- apps require transport service ![[Pasted image 20241121142821.png]]
- e.g. proc examples ![[Pasted image 20241121142833.png]]
### TCP vs. UDP
- ![[Pasted image 20241121142853.png]]
- e.g., app transport protocols ![[Pasted image 20241121142913.png]]
- TCP security (TLS) ![[Pasted image 20241121142931.png]]

### Web and HTTP
- web page consists of objects stored in a DOM structure
- object an be HTML file/element, images, applets, auio, etc.
- web-page consists of base HTML file (e.g. index.html) with several referenced objets addressable via URL e.g. ![[Pasted image 20241121143157.png]]
#### HTTP
- **HTTP** - hypertext transfer protocol
	- ![[Pasted image 20241121143234.png]]
- HTTP is persistent or non-persistent because storing state is complex ![[Pasted image 20241121143322.png]]
	- e.g., Non-persistent HTTP ![[Pasted image 20241121143348.png]] ![[Pasted image 20241121143357.png]]
	- non-persistent performance ![[Pasted image 20241121143437.png]]
- persistent (HTTP 1.1) v. non-persistent pro cons ![[Pasted image 20241121143502.png]]
- messages are request (GET/POST/PUT...) or response (status ode, e.g. 404) ![[Pasted image 20241121143638.png]]
	- request messages ![[Pasted image 20241121143855.png]]
	- request messages ![[Pasted image 20241121143931.png]]
#### Cookies - State Management
- HTTP requests are stateless so for multi-step exchange or repeated connections, store cookies to maintain state (stored in the browser)
- components ![[Pasted image 20241121144834.png]]
	- cookie header line of HTTP **response** message
	- cookie header line in next HTTP **request** message
	- cookie kept on user's host and managed by user's browser
	- back-end DB at server website containing cookie id val to map state
- **first party cookies** - track user behavior for the given website
- **third party cookies** - tracks user behavior across multiple websites without visiting third party site
- GDPR (EU general data protection regulation) requires sites to inform users about 3rd party cookies
#### Web Cache
- to inc performance and decrease load on server, initial http get may include data and web cached data
- may be done via proxy server which acts both as client and server intermediary ![[Pasted image 20241121145708.png]]
- example
	- og bottleneck ![[Pasted image 20241121145939.png]]
	- sol1: get faster link ![[Pasted image 20241121145955.png]]
	- sol2: web cache, much cheaper than more expensive link ![[Pasted image 20241121150024.png]]
#### HTTP/2
- dec delay iin multi obj HTTP requets
- HTTP1.1 introdued multiple pipelined gets over single TCP connection
- server responds in order (FCFS) - this may cause head of line (HOL) blocks for small objs behind large objects -> loss recovery stalling transmission
- ![[Pasted image 20241121150906.png]]
	- e.g, HTTP/1.1 HOL issue ![[Pasted image 20241121150951.png]]
	- e.g., HTTP/2 frame sol ![[Pasted image 20241121150917.png]]
#### HTTP/3
- HTTP/2 disadvantages
	- single connection means recovery from packet loss still stalls object transmissions
	- no security over vanilla TCP
- HTTP/3 adds security and per object error and congestion control via pipelining over UDP

### Email, SMTP, IMAP
- composed of: user agents, mail servers, and SMTP
- **SMTP** - simple mail transfer protocol
	- between mail servers on client (sender) - server (receiver) protocol
	- ![[Pasted image 20241121152027.png]]
- **user agent** - mail reader, creating editing reading sending mail on various clients - outlook, gmail, iphone, etc,
- **mail server** - composed of mailbox (contains incoming messages) and message queue (outgoing mail queue)
- ![[Pasted image 20241121152003.png]]
- request and response messages ![[Pasted image 20241121152100.png]]
- **IMAP** - internet mail access protocol - provides retrieval and deletion ![[Pasted image 20241121152204.png]]
