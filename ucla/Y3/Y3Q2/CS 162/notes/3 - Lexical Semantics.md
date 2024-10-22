---
area: ucla
quarter: Y3Q1
created: 2024-01-17 08:02
updated: Wednesday 17th January 2024 08:02:21
course: CS M151B
📕 courses:
parent: CS 162

title: 3 - Lexical Semantics

layout: note

---
## Issues with One-Hot
- one-hot encoded vectors are orthogonal across the vocab
- so no dot products to find similarities
- cannot represent out of distribution words and n-grams
## Lexical Semantics
- semantic similarity refers to closeness in meaning in context
### Types of similarity algos
- Thesaurus based - hierarchical word closeness
	- e.g., WordNet
- Distributional-based - similarity in real world usage (on the fly)
### Lemmas and Wordform
- lemmas/citation form - the stem representation or part of speech
	- one lemma can have many meanings (i.e. homonyms)
- wordform - inflected word as used
	- ![[Pasted image 20240122081627.png]]
- sense - discrete representation of a word's meaning - i.e. same semantic word but different context
### Synsets
- the synonym set or set of near-synonyms
- used in WordNet to instantiate senses with a "gloss"
	- ![[Pasted image 20240122082933.png]]
	- ![[Pasted image 20240122082946.png]]
- hypernymy and hierarchy in WordNet
	- ![[Pasted image 20240122083011.png]]
## Linguistics
### Homonyms
- words that share form (spelling or pronunciation) but distinct meanings
- Homographs - homonyms of same spelling
	- ![[Pasted image 20240122081841.png]]
- Homophones - homonyms of same pronunciation
	- ![[Pasted image 20240122081834.png]]
- causes issues in semantic learning especially translation
### Polysemy
- related multi-sense words
- ![[Pasted image 20240122082050.png]]
- checking for this can be difficult - Zeugma test
	- ![[Pasted image 20240122082220.png]]
### Synonyms and Antonyms
- distinct words with similar meaning in context (some or all)
- synonyms are relation between senses more than individual words
	- ![[Pasted image 20240122082401.png]]
- antonyms - opposite senses wrt contextual meaning
	- ![[Pasted image 20240122082505.png]]
### Hyponymy and Hypernymy
- hyponymy - one sense that is a subclass or a specification of another sense/word
- hypernymy - one sense that is a superclass of another sense/word
- ![[Pasted image 20240122082610.png]]
- IS-A hierarchy
### Meronym and Holonym
- part-whole relation between senses
- Meronym - wheel is part of a car
- Holonym - car has a wheel


## Naive Word Similarity
- synonymy as a binary relation of senses - e.g., using distance as similarity (fairly loose metric)
	- ![[Pasted image 20240122083216.png]]
## Thesaurus-Based Similarity Algos
- distance in hypernym hierarchy and similarity in glosses (definitions)
- uses path based distance for similarity of senses/synsets
	- ![[Pasted image 20240122083356.png]]
### Calculations
- ![[Pasted image 20240122083426.png]]
- ![[Pasted image 20240122084323.png]]
### Limitations
- measure only good as resource
	- subject to missing nuances and concepts/senses
- limited in scope
	- hypernymy assumes "is-a" relation
	- works for nouns but not all
- context not accounted, not domain-adaptable, multi-language not accessible