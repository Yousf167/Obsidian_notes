## Sources:
1. [[Operating-System-Concepts-10th-2018.pdf]] 

## PDFs:
1. [[ch 1 modified 2025.pdf]]
2. [[ch3 2025.pdf]]
3. [[deadlock.pdf]]
4. [[ch5 2025 modified.pdf]]
5. [[ch9 Update l.pdf]]
6. [[ch13 modified.pdf]]
7. [[ch11 (1).pdf]]
# Notes

## CPU Scheduling

* **Throughput**: # of processes that complete their execution per time unit 
* **Turnaround time**: amount of time to execute a particular process from arrival to completion
* **Waiting time**: amount of time a process has been waiting in the ready queue 
* **Response time**: amount of time it takes from when a request was submitted until the first response is produced

For each algorithm, suppose you are given:

- A table of processes with:
    - Process ID
    - Arrival Time (AT)
    - Burst Time (BT)
    - Priority (if applicable)
    - Time Quantum (if applicable, for RR)

You will calculate:
- **Completion Time (CT)**
- **Turnaround Time (TAT = CT - AT)**
- **Waiting Time (WT = TAT - BT)**
- **Gantt Chart**
## FCFS (First Come First Serve)

### Non-Preemptive:
1. Sort processes by **arrival time**.
2. Execute each process **entirely** in that order.
3. If a process arrives **after CPU is idle**, wait until its arrival.
4. Build Gantt chart accordingly.
5. Calculate CT, TAT, and WT for each process.
### Preemptive:
- **Not applicable**. FCFS is inherently non-preemptive.



## SJF (Shortest Job First)
###  Non-Preemptive:
1. At time `t`, from **available** processes (those that arrived), pick the one with **smallest BT**.
2. Once selected, execute it **to completion**.
3. Repeat step 1 for remaining processes.
4. Build Gantt chart and calculate CT, TAT, WT.
### Preemptive (Shortest Remaining Time First - SRTF):
1. At each time unit, check **available** processes.
2. Select the one with **smallest remaining BT**.
3. If a new process arrives with a smaller BT, **preempt** the current one.
4. Update remaining times continuously.
5. Keep a Gantt chart for each switch.
6. Calculate CT, TAT, WT at the end.



## Priority Scheduling
### Non-Preemptive:
1. At each decision point (`t`), pick the **highest-priority** process from those that have arrived (lower number = higher priority, unless otherwise specified).
2. Execute that process to **completion**.
3. Repeat for remaining.
4. Resolve ties using arrival time.
5. CT, TAT, WT, Gantt chart as usual.
###  Preemptive:
1. At every time unit, check if a newly arrived process has **higher priority** than current.
2. If yes, **preempt** the current and switch.
3. Always run the **highest-priority available** process.
4. Track execution and context switches on Gantt chart.
5. Compute CT, TAT, WT.


## Round-Robin (RR)
### Preemptive (Always preemptive):
1. Use **Time Quantum (TQ)**.
2. Create a **ready queue**.
3. At `t = 0`, add available processes to the queue.
4. Execute the first process for **TQ or less** if it completes early.
5. If not done, push it to the **end of queue**.
6. Repeat:
    - Add new arrivals to the queue as time progresses.
    - Move incomplete processes to the back.
7. Track execution order in Gantt chart.
8. Calculate CT, TAT, WT from final completion times.

### Non-Preemptive:
- **Not applicable**. Round-robin is by definition **preemptive** due to time quantum.
## Priority + Round-Robin
### Preemptive:
1. Group processes by **priority levels**.
2. Within each level, use **Round-Robin**.
3. Always execute the **highest-priority non-empty group**.
4. If a higher-priority process arrives while a lower one is executing, **preempt**.
5. Within a group, apply **TQ rotation**.
6. Track each switch in Gantt chart.
7. Calculate CT, TAT, WT.
### Non-Preemptive:
1. Select **highest-priority** group available at `t`.
2. Within that group, use **RR** (ignore other groups until current group is empty).
3. Once current group is empty, move to next.
4. Continue as usual.
5. Gantt chart + CT, TAT, WT.

## How to Calculate
 * **Completion time (CT)**: CT = time at which the process was completed
 * **Turnaround time (TAT)**: TAT = CT - AT
 * **Waiting time (WT)**: TAT - BT
 * **Response Time (RT)**: RT = Start time - AT
 * **Throughput**: $\large Throughput = \frac{\#\ of\ processes}{Total\ time}$
### Intuitively:


| Processes | BT  | AT  |
| --------- | --- | --- |
| P1        | T1  | T2  |

| P1       | ..... | .... | ...... | ...... | ............ | P1       |
| -------- | ----- | ---- | ------ | ------ | ------------ | -------- |
| T,    t1 |       |      |        |        |              | t2,   t3 |
* CT = t3
* TAT = t3 - T2
* WT = t3 - T2 - T1 **OR** T - T2
* RT = T - T2

## Paging
- m: **Total number of bits in the logical address**. This determines the size of the **logical address space**, which is 2^m bytes.
- n: **Number of bits used for the page offset**. This determines the **page size**, which is 2^n bytes.
- Page size = 2^n
- No. of bits to represent page number = m - n
- NO. of pages = 2^m-n
### Decimal addressing
* Addressing system is a power of 2 (32 bit, 64 bit)
* Frame size is predefined (also a power of 2)
* The number of bits to represent one frame = $\large log_2(frame\ size)$
* Physical memory size = $\large 2^{addressing\ system}$
* No. of frames per page = physical memory size / frame size
* Page number = logical add / frame size
* Page offset = logical address % frame size
* Physical add = frame# * frame size + offset 