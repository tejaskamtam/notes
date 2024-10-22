---
course: MATH 61
area: ucla
created: 2022-10-31T11:00
updated: 2022-10-31T11:24
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 15 - Shortest Path - 8.4

layout: note

---
# Definitions

---

# Big Ideas

---

### Dijkstra’s Algorithm

- let $w(i,j)$﻿ refer to the weight of the edge $(i,j)$﻿, in weighted, connected graph $G$﻿
- algo finds the length $L(z)$﻿ of the shortest path $a\in V(G)\to z\in V(G)$﻿
- the weight of edge $(i,j)=e\in E(G)$﻿ is $w(i,j)\gt0$﻿ and
- the label of vertex $x\in V$﻿ is $L(x)$﻿
- Input: connected, weighted graph $G$﻿ with all positive weights, vertices $a,z$﻿
- Output: $L(z)$﻿ of shortest path

```
def djikstra(w,a,z,l){
	L(a)=0
	for x in V(G), x != a:
		L(x)=INFINITE
	T = V(G)
	while (z in T):
		choose v in T for minimum L(v)
		T = T - {v}
		for each x in T adjacent v:
			L(x) = min(L(x),L(v) + w(v,x))
	return L(x)
}
```

- e.g. Dijkstra’s algorithm
    
    ![[/Untitled 14.png|Untitled 14.png]]
    

![[/61_-_Week_6_notes_--_8.4_8.5_8.6.pdf|61_-_Week_6_notes_--_8.4_8.5_8.6.pdf]]

📌

**SUMMARY  
**