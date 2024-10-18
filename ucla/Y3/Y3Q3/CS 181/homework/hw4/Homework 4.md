### Tejas Kamtam, 305749402
---

## 1.21
### Part a
$$(a^*\cup ba^*b)\oplus ba^*=a^*ba^*\cup ba^*bba^*$$
### Part b
$$(((a\cup b)a^*b)\oplus ((a(a\cup b)\cup b)a^*b)^*\oplus(a\cup\varepsilon))\cup\varepsilon$$
$$=((aa^*b\cup ba^*b)\oplus (aaa^*b\cup aba^*b\cup ba^*b)^*\oplus(a\cup\varepsilon))\cup\varepsilon$$

## 1.28
### Part a
$$a(abb)^*\cup b=$$
where $e=\varepsilon$: ![[Pasted image 20240428152506.png]]
### Part b
$$a^+\cup(ab)^+$$

where $e=\varepsilon$: ![[Pasted image 20240428153028.png]]
### Part c
$$(a\cup b^+)a^+b^+=aa^+b^+\cup b^+a^+b^+$$
where $e=\varepsilon$: ![[Pasted image 20240428153610.png]]

## 1.47
Consider the string $$w=1^p\#1^{p!}\in L$$
For this string any choice of substring $xy$ lies within $1^p$ so **pumping up** s.t. $$w'=xyy^{\frac{p!-|y|}{|y|}}z\notin L$$
This is because $0\lt|y|\le p$ so $\frac{p!}{|y|}\in \mathbb{Z^+}$ and $|y|+|y|(\frac{p!-|y|}{|y|})=p!$ so  the string is not in the language. Thus, by the contrapositive corollary to the Pumping Lemma, $L$ is nonregular.
## 1.49
### Part a
The language $B$ can be described by the regular expression: $$10^*1\oplus\Sigma^*$$
Thus, the language is regular. An equivalent NFA that recognizes $B$ is shown below:
![[Pasted image 20240429113611.png]]

### Part b
Consider the string $w=1^p01^p\in C$.
Then we can express the string as $w=xyz$ s.t. $xy\in 1^p$ and $|xy|\le p$
Pumping down, such that we get a new string $w'=xz$ reduces the $\#_1$s by $|y|$ so the new string can be expressed as $1^{p-|y|}01^p$.
Now, based on the definition of the language $C$, $k=p-|y|$ and now (after pumping down) $\#_1(z)=p$
For the pumped string to be in the language, the following must be true: $p\le k$
But because of pumping down: $p\not{\le} k=p-|y|\because |y|\ge 1$
Thus, the new string $w'\notin C$. And, by the contrapositive of the P.L., $C$ is nonregular.

## 1.53
Consider the string $$w:xyz:1^p=1^p+0^p\in ADD$$
However, choosing any $xy\in 1^p$ and pumping down, that is constructing the new string: $$w':xz\notin ADD$$
Because pumping down is equivalent to shifting right by some $|y|$ integers. So, the sum does not hold after pumping down. Thus, the language $ADD$ is nonregular by the contrapositive to the P.L.

## 6
We have shown before that the language $A=0^*1^*$ is regular. So, $$A\cup B\text{ is nonregular }\iff B\text{ is non regular }\because A\text{ is regular}$$
By the closure principle of regular languages under union. So, to show the union is nonregular, we must show $B$ is nonregular.
Consider the string $$w=xyz=0^p1^p\in B$$
for some any choice of $xy\in 0^p$ s.t. $|xy|\le p$, pumping down result in the new string: $$w'=xz=0^{p-|y|}1^p\notin B$$
because $|y|\ge 1$ so $|0^{p-|y|}|\neq |1^p|$. So, this pumped-down string is not in the language. Thus, $B$ is nonregular by the contrapositive of the P.L.

And, since we've shown $B$ to be nonregular, the union $A\cup B$ must also be nonregular by closure principles.


