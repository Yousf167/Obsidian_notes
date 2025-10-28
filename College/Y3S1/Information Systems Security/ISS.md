## PDFs

Lectures:
1. [[CHAPTER 1 Accountability and Access Control .pdf]]]
2. [[CHAPTER-2-Attacks-and-Monitoring.pdf]]
3. [[CHAPTER-3-Security-Management-Concepts-and-Principles.pdf]]
4. [[CHAPTER-4-Data-and-Application-Security-Issues-Part-1.pdf]]
5. [[CHAPTER-4-Data-and-Application-Security-Issues-Part-2.pdf]]

Sections:
1. [[Section 1.pdf]]
2. [[Section 2.pdf]]
3. [[Advanced Encryption Standard-1.pdf]]

# Chapter 1: Accountability and Access Control
* **Access controls** are security features that control how users and systems communicate and interact with other systems and resources. They protect the systems and resources from unauthorized access and can be components that participate in determining the level of authorization after an authentication procedure has successfully completed.
* **Access**: The flow of data between the *Subject* and the *Object*
* **Subject**: Active entity that that requests access to an object or the data within an object
* **Object**: Passive entity that contains data
* Access controls give organizations the ability to **control**, **restrict**, **monitor**, and **protect** *resource* *availability*, *integrity*, and *confidentiality*
## Availability
* Information, systems, and resources must be **available** to users in a timely manner *so productivity will not be affected*. Accessing information does not seem that important until it is inaccessible.
* **Fault tolerance** and **recovery mechanisms** are put into place to ensure the *continuity of the availability of resources*. User productivity can be greatly affected if requested data is not readily available.
* Information has various attributes, such as *accuracy*, *relevance*, *timeliness*, and *privacy*. The strength of each attribute depends on the the business that needs the info. (A stock broker needs *timely* and *relevant* data. a trade secret needs to be *private*)
## Integrity
* Information must be *accurate*, *complete*, and *protected* from unauthorized modification.
* When a security mechanism provides integrity, it *protects* data, or a *resource*, from *being altered in an unauthorized fashion*. If any type of illegitimate modification does occur, the *security mechanism must alert the user or administrator in some manner*.
## Confidentiality
* Confidentiality is the assurance that information is *not disclosed to unauthorized individuals, programs, or processes*.
* **Control mechanisms** need to be in place to dictate who can access data and what the subject can do with it once they have accessed it. These **activities** need to be *controlled, audited, and monitored*. 
* Some security mechanisms that would provide confidentiality are *encryption*, *logical* and *physical access controls*, *transmission protocols*, *database views*, and *controlled traffic flow*.


# Authentication and Identification
**Identification** describes a method of *ensuring that a subject (user, program, or process) is the entity it claims to be*. Identification can be provided with the use of a username or account number.

To be properly authenticated, the subject is usually required to provide a second piece to the credential set. This piece could be a password, passphrase, cryptographic key, personal identification number (PIN), or token. These two credential items are compared to information that has been previously stored for this subject. If these credentials match the stored information, the subject is authenticated. But we are not done yet.

The most common form of authentication is a password, which falls under the first of three types of information that can be used for authentication:
* **Type 1 authentication factor**: **something you know** . It is any string of characters that you have memorized and can reproduce on a keyboard when prompted. Examples include a password, PIN, passphrase, mother’s maiden name, favorite color, and so on.
* **Type 2 authentication factor**: **something you have**. It is a physical device that you possess and must have on your person at the time of authentication. Examples of this factor include a smart card, token device, memory card, USB drive, and so on. This can also include your physical location, referred to as the somewhere you are factor.
* **Type 3 authentication factor**: **something you are**. It is a body part or a physical characteristic of your person. Examples of this factor include fingerprints, voice prints, retina patterns, iris patterns, face shapes, palm topology, hand geometry, and so on. This factor is often labeled as a bio-metric , or a bio-metric factor. 

As you can see, a *Type 3* factor is *slightly more secure* than a *Type 2* factor, which is in turn *more secure* than a *Type 1* factor.

In addition to these three commonly recognized factors, there are at least two others. One is **something you do** , such as *writing a signature, typing a passphrase (keyboard dynamics), or speaking a phrase.* Something you do is *often included in the “something you are,” or Type 3, category*. Another factor, mentioned earlier, is **somewhere you are** , such as the computer terminal from which you log in or the phone number (identified by caller ID) or country (identified by your IP address) from whence you connect.

# Two-Factor Authentication
Two-factor authentication occurs when two different factors are required to provide authentication. For example, when cashing a check at the grocery store, you often have to provide your driver’s license (“something you have”) and your phone number (“something you know”). Strong authentication is simply any authentication that requires two or more factors but not necessarily factors of different types. However, as a general rule, when factors of different types are combined, the resultant authentication is more secure

# Auditing
process by which online activities of user accounts and processes are *tracked* and *recorded*. Auditing produces *audit trails*. Audit trails can be used to *reconstruct events and to verify whether a security policy or authorization was violated*

According to the National Institute of Standards and Technology’s “Minimum Security Requirements (MSR) for Multi-User Operating Systems,” document (NISTIR 5153) audit data recording must comply with the following requirements:
1. The system shall provide a mechanism for generating a security audit trail that contains information to support after-the-fact investigation of loss or impropriety and appropriate management response.
2. The system shall provide end-to-end user accountability for all security-relevant events.
3. The system shall protect the security audit trail from unauthorized access.
4. The system shall provide a mechanism to dynamically control, during normal system operation, the types of events recorded.
5. The system shall protect the audit control mechanisms from unauthorized access.