---
area: ucla
quarter: Y3Q1
created: 2024-02-06 13:16
updated: Tuesday 6th February 2024 13:16:58
course: CS 162
📕 courses:
---
## RNNs
- use sequential information to make preds
	- ![[Pasted image 20240207021904.png]]
- don't make independence assumption (unmlike FFNNs)
- perform same task at each step of a seq and inputs of next step req prev step outputs -> memory
- this is better than n-gram because we can generate probs conditioned on the WHOLE context $[1:t-1]$ while n-grams are usually constrained b/w $[t-n+1:t-1]$
- ![[Pasted image 20240207021937.png]]![[Pasted image 20240207021723.png]]
### Long-Term Dependency Limitation
- RNNs are theoretically capable of handling long term memory that generates outputs that are dependent on tokens much much earlier in a long context ![[Pasted image 20240207022522.png]]
- but irl they are not do to vanishing gradients of context from very far back in the context
## LSTMs
- designed to mitigate long-term dependency issue w/ RNNs ![[Pasted image 20240207022615.png]]
- the key is **memory cell state** that add or remove info as seq progresses by changing cascading multiplications to additions of probs
- this is done using 3 gates to control memory (input, forget, and NS/FS)
- NOTE: different weights across each gate (look at subscript)
### Input Gate
- decides what info from current input to capture in cell state ![[Pasted image 20240207023108.png]]
- consists of 2 parts
	- sigmoid (input gate layer) - decides what values to update b/w/ 0 to 1
	- tanh - creates a vector of new candidate values (contextualized seqs) $\tilde C_t$
- e.g., adding gender context of new subject to cell state and replace old context
### Forget Gate
- decides what info to remove through sigmoid layer
- looks at prev hidden state $h_{t-1}$ and current input $x_t$ and outptus vec bw 0 to 1 (1 = keep completely and v.v.) ![[Pasted image 20240207023349.png]]
- e.g., forget gender of old subject when we see new subject
### Next Step Context (Cell State)
- update old state $C_{t-1}$ into new cell state ![[Pasted image 20240207023711.png]]
- multiply old state by the forget gate $f_t$
- add in input gate $i_t *\tilde C_t$ (element-wise multiplication)
### Output Gate
- decide outputs by computing output gate then multiply into cell state to get outputs and propagate to next cell ![[Pasted image 20240207023848.png]]
### Complete Structure
- add bias to each of the below params
![[Pasted image 20240207023948.png]]

## Learning Neural LMs (Recap)
![[Pasted image 20240207024130.png]]