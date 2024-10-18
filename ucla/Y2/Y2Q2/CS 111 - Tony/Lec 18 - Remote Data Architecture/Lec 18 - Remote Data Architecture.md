- A logical extension of client/server model  
    – All data services accessed via standard protocols  
    • Opaque encapsulation of servers/resources  
    – Resources are abstract/logical  
    – E.g., a file system or object store  
    – One highly available IP address for all services  
    – Mirroring/migration happen under the covers  
    • Protocols likely to be WAN-scale optimized  
    • Advantages:  
    – Simple, scalable, highly available, low cost  
    – A very compelling business model  
    • Clouds are not just for storage

## Goals and Challenges

- Sometimes the data we want isn’t on our  
    machine
    - A file
    - A database
    - A web page
- We’d like to be able to access it, anyway
- How do we provide access to remote data?

### Basic Goals

• Transparency  
– Indistinguishable from local files for all uses  
– All clients see all files from anywhere  
• Performance  
– Per-client: at least as fast as local disk  
– Scalability: unaffected by the number of clients  
• Cost  
– Capital: less than local (per client) disk storage  
– Operational: zero, it requires no administration  
• Capacity: unlimited, it is never full  
• Availability: 100%, no failures or service down-time

### Key Characteristics of Remote Data Access Solutions

- APIs and transparency
    - how do users and processes access remote data?
    - how closely does remote data mimic local data
- Performance, robustness, nad synchronization
    - is remote data as fast and reliable as local data?
    - is synchronized access to remote data like local?
- Architecture
    - how is solution integrated into clients and servers
- Protocol and work partitioning
    - how do client and server cooperate

## Remote File Access

- Goal: complete transparency
    - normal file system calls work on remote files
    - support file sharing by multiple cients
    - performance, availability, reliability, scalability
- Typical architecture
    - Exploits plug-in file system architecture
    - Client-side file system is a local proxy
    - Translates file operations into network requests
    - Server-side daemon receives/process requests
    - Translates them into real file system operations

![[/Untitled 89.png|Untitled 89.png]]

### Rating Remote File Access

- Advantages
    - very good application level transparency
    - very good functional encapsulation
    - able to support multi-client file sharing
    - potential for good performance and robustness
- disadvantages
    - at least part of implementation must be in the OS
    - client and server sides tend to be fairly complex

**This is THE model for client/server storage**

### Cloud Storage

- A logical extension of client/server model  
    – All data services accessed via standard protocols  
    • Opaque encapsulation of servers/resources  
    – Resources are abstract/logical  
    – E.g., a file system or object store  
    – One highly available IP address for all services  
    – Mirroring/migration happen under the covers  
    • Protocols likely to be WAN-scale optimized  
    • Advantages:  
    – Simple, scalable, highly available, low cost  
    – A very compelling business model  
    • Clouds are not just for storage

### Security for Remote File Systems

- major issues
    - privacy and integrity for data on the network
        - solution: encript all data sent over network
    - authentication of remote users
        - solution: various approaches
    - trust-worthiness

### Authentication Approaches

- anonymous access
- peer-to-peer approaches
- server authentication approaches
- domain authentication approches

### Peer-to-Peer Authentication

- all participating nodes are trusted peers
- client-side authentication/authorization
- advantages:
    - simple implementation
- disadvantages:
    - you can’t always trust all remote machines
    - doesn’t work with heterogeneous OS environment
    - universal user registry is not scalable
    

### Server Authentication Appraoch

### Domain Authentication Approaches

- independent authentication of client and server
    - each authenticates with independent authentication service
    - each knows/trusts only the authentication service
- authentication service may issue signed “tickets”
    - assuring each of the others’ identity and rights