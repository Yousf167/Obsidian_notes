## PDFs:
1. [[1. IR Lecture 1- Intro to Course - SWE.pdf]]
2. [[2.-Boolean-Retrieval-Model.pdf]]
3. [[3.-The-Term-Vocabulary-and-Postings-Lists.pdf]]
4. [[4,-5.-Scoring-and-Term-Weighting-&-Vector-Space-Model.pdf]]
5. [[6.-Evaluation-in-Information-Retrieval.pdf]]
6. [[7.-Index-Construction.pdf]]
7. [[8.-Dictionaries-and-Tolerant-Retrieval.pdf]]

# Boolean Retrieval Model


Let’s compare **Normalization** and **Stemming** precisely:
##  Normalization
**Goal:** Make words with _the same meaning or form_ consistent so they match during searching.  
**Scope:** Handles _surface variations_ in text (punctuation, case, spelling, format).
### Examples:
- Converting all text to lowercase → `USA`, `Usa`, `usa` → `usa`
- Removing punctuation → `U.S.A.` → `USA`    
- Expanding or standardizing forms → `Dr.` → `Doctor`
- Handling accents → `résumé` → `resume`    

 Normalization focuses on textual uniformity, not on linguistic roots.

##  Stemming
**Goal:** Reduce _morphological variants_ of a word to a common root (called a “stem”).  
**Scope:** Deals with _word morphology_ — prefixes, suffixes, inflections.
### Examples:
- `authorize`, `authorized`, `authorization` → `author`
- `connect`, `connected`, `connection` → `connect`    

Stemming focuses on linguistic reduction, not formatting or representation.

|Aspect|Normalization|Stemming|
|---|---|---|
|Purpose|Make text consistent in form|Reduce words to root/stem|
|Deals with|Case, punctuation, spelling, abbreviations|Inflection, derivation|
|Example|`U.S.A.` → `USA`|`authorization` → `author`|
|Level|Surface/textual|Linguistic/morphological|


You can think of **normalization** as _cleaning and standardizing the text_, and **stemming** as _reducing different word forms to the same base concept_.