## PDFs:
1. [[1. IR Lecture 1- Intro to Course - SWE.pdf]]
2. [[2.-Boolean-Retrieval-Model.pdf]]
3. [[3.-The-Term-Vocabulary-and-Postings-Lists.pdf]]
4. [[4,-5.-Scoring-and-Term-Weighting-&-Vector-Space-Model.pdf]]
5. [[6.-Evaluation-in-Information-Retrieval.pdf]]
6. [[7.-Index-Construction.pdf]]
7. [[8.-Dictionaries-and-Tolerant-Retrieval.pdf]]

## Text Processing
In the process of building an inverted index, **tokenization, normalization, stemming, and lemmatization** represent sequential stages of linguistic preprocessing designed to bridge the gap between how a user writes a query and how a document is indexed.

### 1. Tokenization: Defining the Units

**Tokenization** is the initial step of cutting a character sequence into pieces, called **tokens**. A token is an instance of a sequence of characters grouped together as a **useful semantic unit**.

- **The Process**: While often starting with "chopping on white space," it involves complex decisions regarding punctuation, such as handling apostrophes (e.g., "John’s"), hyphens (e.g., "co-education"), and specific formats like phone numbers or dates.
- **Challenges**: In languages like German, noun compounds are not segmented (e.g., _Lebensversicherungsgesellschaftsangestellter_), while Chinese and Japanese have no spaces between words at all, requiring word segmentation heuristics or machine learning.

### 2. Normalization: Creating Equivalence Classes

**Normalization** is the process of **canonicalizing tokens** so that matches occur despite differences in character sequences. It effectively defines **equivalence classes** of terms.

- **Goal**: To ensure that a query for "USA" matches a document containing "U.S.A.".
- **Common Tasks**: This includes removing accents (e.g., "naïve" to "naive"), deleting hyphens, and **case folding** (reducing all letters to lower case). Lower-casing is generally preferred because users typically search in lowercase regardless of correct capitalization.

### 3. Stemming vs. Lemmatization: Reducing to Roots

Both stemming and lemmatization are forms of linguistic normalization that aim to match different forms of a root word, but they differ significantly in their approach and "intelligence".

|Feature|**Stemming**|**Lemmatization**|
|:--|:--|:--|
|**Definition**|Chops off the ends of words to reduce them to "roots".|Reduces inflectional/variant forms to a base dictionary form (lemma).|
|**Method**|Heuristic/Language-dependent (e.g., **Porter’s Algorithm**).|Uses "proper" reduction via **Natural Language Processing (NLP)**.|
|**Example**|"automate(s)", "automatic", "automation" $\rightarrow$ **"automat"**.|"am, are, is" $\rightarrow$ **"be"**; "saw" $\rightarrow$ **"see"** or **"saw"**.|
|**Precision**|Can be crude; may harm precision by over-grouping.|More accurate as it understands the morphological context.|

- **Porter's Algorithm**: This is the most common stemming algorithm for English, applying five sequential phases of word reduction (e.g., mapping "SSES" to "SS").
- **Utility**: Stemming has mixed results for English but is significantly helpful for highly inflected languages like Spanish, German, or Finnish.

To visualize these concepts, imagine you are **sorting a giant pile of mail**.

- **Tokenization** is like taking each letter out of its envelope so you can see the individual words.
- **Normalization** is like deciding that all letters addressed to "The Boss," "the boss," or "Mr. Manager" should go into the same "Management" bin.
- **Stemming** is like a hurried clerk who simply clips the "s" or "ing" off the end of every word to save space.
- **Lemmatization** is like a specialized librarian who looks at the word "mice" and knows it belongs in the "mouse" folder.



## Retrieval Evaluation Metrics

These equations are used to measure the effectiveness of an IR system.

- **Precision (P):** The fraction of retrieved documents that are relevant.
$$\Large P = \frac{tp}{tp + fp}$$
- **Recall (R):** The fraction of relevant documents in the collection that are retrieved.
$$\Large R = \frac{tp}{tp + fn}$$
- **Accuracy:** The fraction of classifications (relevant vs. non-relevant) that are correct.
- $$\Large Accuracy = \frac{tp + tn}{tp + fp + fn + tn}$$
- **F-measure:** A weighted harmonic mean used to assess the tradeoff between precision and recall.
$$\Large F = \frac{1}{\alpha \frac{1}{P} + (1-\alpha) \frac{1}{R}}$$
- The **balanced F1 measure** assumes $$\Large \alpha = 1/2$$

### 2. Scoring and Weighting Equations

These formulas determine how documents are ranked based on their relevance to a query.

- **Weighted Zone Scoring:** Computes a score in the interval based on a linear combination of matches across different document zones (e.g., Title, Author, Body).
$$\Large \text{Score} = \sum_{i=1}^L g_i s_i$$ where $$\Large g_i$$ is the weight of zone $$\Large i$$ and $$\Large s_i$$ is the Boolean match score.
- **Log-frequency Weighting:** Dampens the effect of raw term frequency ($tf$).
$$\Large w_{t,d} = 1 + \log_{10} tf_{t,d}$$ if $$\Large tf_{t,d} > 0$$, otherwise $$\Large 0$$.
- **Inverse Document Frequency (idf):** Measures the informativeness of a term based on its rarity in the collection ($N$ is the total number of documents).
$$\Large idf_t = \log_{10} (N/df_t)$$.
- **tf-idf Weighting:** The product of term frequency weight and idf weight.
$$\Large w_{t,d} = (1 + \log tf_{t,d}) \times \log (N/df_t)$$.
- **Cosine Similarity:** Quantifies similarity by calculating the cosine of the angle between document and query vectors.
$$\Large \text{sim}(d_1, d_2) = \frac{\vec{V}(d_1) \cdot \vec{V}(d_2)}{|\vec{V}(d_1)| |\vec{V}(d_2)|}$$.
- **Euclidean Length:** Used for length-normalization in the vector space model.
$$\Large |\vec{V}| = \sqrt{\sum_{i=1}^M w_i^2}$$.
- **Jaccard Coefficient:** A measure of overlap between two sets (e.g., n-grams in spelling correction).
$$\Large J(X,Y) = \frac{|X \cap Y|}{|X \cup Y|}$$.

### 3. Operational Rules and Heuristics

These rules govern the construction and processing efficiency of the index.

- **Postings Merge Rule:** Merging two sorted postings lists of lengths $x$ and $y$ takes **$O(x + y)$ operations**.
- **Query Optimization Rule:** Process Boolean conjunctions (AND) in order of **increasing frequency** (start with the term that has the smallest postings list).
- **Skip Pointer Heuristic:** For a postings list of length $L$, use **$\sqrt{L}$ evenly-spaced skip pointers** to improve merge speed.
- **Porter’s Stemming Rules:** A set of sequential rules to reduce words to roots:
    - SSES $\rightarrow$ SS; IES $\rightarrow$ I; S $\rightarrow$ delete.
- **Soundex Phonetic Rules:**
    1. Retain the **first letter** of the word.
    2. Change A, E, I, O, U, H, W, Y to **0**.
    3. Assign digits to other letters: **B,F,P,V $\rightarrow$ 1**; **C,G,J,K,Q,S,X,Z $\rightarrow$ 2**; **D,T $\rightarrow$ 3**; **L $\rightarrow$ 4**; **M,N $\rightarrow$ 5**; **R $\rightarrow$ 6**.
    4. Remove consecutive duplicate digits and all zeros; pad with trailing zeros to reach a **4-character code**.
- **Index Construction (BSBI/SPIMI):**
    - **BSBI** requires sorting records by termID and then merging blocks.
    - **SPIMI** accumulates postings directly in memory and generates a separate dictionary for each block to avoid global term-to-termID mapping.

To visualize **tf-idf**, imagine a library: a word that appears many times in one book (high tf) is important, but if that same word appears in almost every book in the building (low idf), it loses its value as a search term.



To correct your understanding of Lectures 4 and 5, it is essential to distinguish between **raw counts** (which you used) and **weighted values** (which the system uses) to prioritize informative words over common ones.

### 1. The Core Measures Defined
- **Term Frequency (tf)**: This is the number of times a term $t$ occurs in a document $d$. However, relevance does not increase proportionally with the raw count; a document with 10 occurrences is not 10 times more relevant than one with a single occurrence. To account for this, we use **Log-frequency weighting**, calculated as $\large 1 + \log_{10} tf_{t,d}$ for all counts greater than zero.
- **Document Frequency (df)**: This is the number of documents in the entire collection that contain the term $t$.
- **Inverse Document Frequency (idf)**: This is a measure of the "informativeness" of a term. Since rare terms are more informative than frequent ones, $idf$ is calculated as $\large \log_{10}(N/df_t)$, where $N$ is the total number of documents in the collection.
- **tf-idf Weighting**: This is the product of the $tf$ weight and the $idf$ weight. It is the **most famous weighting scheme** in IR, ensuring a term has a high weight only when it occurs many times in a small number of documents.

### 2. The Vector Space Model (VSM)
In this model, the set of documents is viewed as a **set of vectors** in a very high-dimensional space. The **terms are the axes** of this space, and the documents are represented as points or vectors. Because most documents only contain a tiny fraction of all possible words, these are **very sparse vectors**.

### 3. Methodology: Steps to Calculate Similarity
To rank a document against a query, the system follows these steps, as illustrated in the "best car insurance" example:

1. **Identify the Terms**: Every unique term in the query and document becomes a dimension in the vector.
2. **Calculate Weights**: For both the query ($q$) and the document ($d$), find the $tf$ weight and multiply it by the term's $idf$.
3. **Vector Representation**: Create a vector where each component is the **tf-idf weight** of that term.
4. **Length Normalization**: This is the step your proposed method was missing. To prevent long documents from outscoring short ones simply because they have more words, each vector is divided by its **Euclidean length** to become a **unit vector**.
5. **Cosine Similarity**: The final score is the **dot product** of the normalized query and document vectors. This measures the cosine of the angle between them; a smaller angle results in a higher similarity score.


To visualize **tf-idf**, imagine a **volume knob**. The **tf** is how loud a word is screaming inside a single document, but the **idf** is a master filter that turns down the volume of "boring" words that are screaming everywhere in the library. **Normalization** then ensures that a giant book and a tiny pamphlet are compared on a fair scale by looking only at the _proportions_ of their sounds.


## Precision and Recall
In Information Retrieval, **Precision** and **Recall** are the primary metrics used to evaluate the **effectiveness** of a system in satisfying a user's **information need**. While they measure different aspects of quality, they are deeply interconnected.

### 1. Defining the Measures

- **Precision (P):** This is the fraction of **retrieved documents that are actually relevant** to the user. It measures the "purity" of the results, answering how many of the documents the user saw were useful. It is calculated as: $$P = \frac{tp}{tp + fp}$$ where $tp$ is true positives (relevant and retrieved) and $fp$ is false positives (not relevant but retrieved).
- **Recall (R):** This is the fraction of **all relevant documents in the collection that the system successfully retrieved**. It measures the "completeness" of the search, answering how many of the available useful documents were found. It is calculated as: $$R = \frac{tp}{tp + fn}$$ where $fn$ is false negatives (relevant but not retrieved).

### 2. The Inverse Relationship (The Trade-off)

There is a fundamental **trade-off** between precision and recall. You can easily achieve **100% recall** by simply retrieving every single document in the collection for every query; however, this results in **extremely low precision** because the user must sift through a massive amount of non-relevant material.

Conversely, in a good system, **precision typically decreases** as the number of retrieved documents (and thus recall) increases. This is because as the system "reaches deeper" into the collection to find more obscure relevant documents, it is more likely to accidentally pull in non-relevant ones. For example, linguistic tools like **stemming** are often used to **improve recall** by matching various word forms (like "automate" and "automation"), but they can simultaneously **harm precision** by creating matches that the user did not intend.

### 3. Balancing and Visualizing the Relation

- **F-measure:** To provide a single score that accounts for both metrics, the **F-measure** (a weighted harmonic mean) is used to assess the tradeoff. Most commonly, researchers use the **balanced F1 measure**, which gives equal importance to both precision and recall.
- **Precision-Recall Curves:** For systems that provide **ranked retrieval**, the relationship is visualized using a curve. This curve is created by calculating precision at various "levels" of recall (e.g., after the top 10, 20, or 100 documents).
- **Accuracy vs. Precision/Recall:** While **Accuracy**—the fraction of all classifications that are correct—is common in machine learning, it is often **avoided in IR**. Because the number of non-relevant documents ($tn$) is so much larger than the number of relevant ones, a system could achieve 99.9% accuracy by simply never retrieving any documents at all, which is useless for the user.

To understand the relationship, imagine you are **fishing with a net**. **Recall** is the percentage of all the fish in the lake that you managed to catch. **Precision** is the percentage of the items in your net that are actually fish (rather than old boots or seaweed). If you use a massive net that covers the whole lake, your **recall** is 100%, but your **precision** will be very low because you'll catch a lot of trash. If you use a tiny, specialized spear, your **precision** might be 100%, but your **recall** will be very low because you'll miss most of the fish in the water.