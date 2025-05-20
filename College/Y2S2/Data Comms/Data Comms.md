
## PDFs:
1. [[DC_Lec_1.pdf]]
2. [[DC_Lec_2.pdf]]
3. [[DC_Lec_3.pdf]]
4. [[DC_Lec_4.pdf]]
5. [[DC_Lec_5.pdf]]
6. [[DC_Lec_6.pdf]]
7. [[DC_Lec_7.pdf]]
8. [[DC_Lec_8.pdf]]
9. [[DC_Lec_9.pdf]]

## Rules and methods

* Nyquist Bandwidth
$$\large \bullet\ C = 2B\ log_2L$$
* C: Bit rate or capacity
* B: Bandwidth
* L: number of signal levels
* used when there is no noise
---
* Shannon Capacity
$$\large \bullet\ C = B\ log_2(1 + SNR)$$
$$\large \bullet\ SNR_{db} = 10 log_{10}(\frac{signal}{noise})$$
$$\large \bullet\ SNR = \frac{AVG(signal\ PWR)}{AVG(noise\ PWR)}$$
* SNR: Signal to Noise Ratio

---
## Digital Encoding

### NRZ-I
* start at high
* 0: Do Nothing
* 1: flip to the other side
### NRZ-L
* 0: HIGH
* 1: LOW
### Manchester
* 0: HIGH to LOW
* 1: LOW to HIGH
as represented in the images, just draw the curves that represent the number and connect them later
![[a2bb74ef3710c5b31fcdbdad0af95153_MD5.jpeg|center]]

![[60e855588926b08e0e2f194b46c62c44_MD5.jpeg|center]]
### Differential Manchester
* Start HIGH
* Same idea as Manchester
![[6724f00958b9efe40e2ecf589a6dcb7c_MD5.jpeg|center]]

### RZ
* 0: LOW
* 1: HIGH
* at the start of the bit, the signal is either HIGH or LOW depending on the number
* when we reach the middle, we return to Zero
* when the new bit is reached, we start all over again
![[0313b1b7975b7809b8efebafe9565021_MD5.jpeg|center]]

### Bipolar AMI
* 0: NEUTRAL
* 1: HIGH or LOW depending on the last 1; the current 1 is the opposite of the previous
![[0e7f7d2aa22e26885f97779707cd1222_MD5.jpeg|center]]


### Pseudoternary
* same as Bipolar AMI but 0's are the ones that change
![[f3b4236c007b1ac3f9e16566deab3419_MD5.jpeg|center]]