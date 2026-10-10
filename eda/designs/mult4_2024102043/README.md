To start the container in wsl use (in assignmrnt directory) :
docker start -ai iic-osic-tools

To go inside cntainer : docker exec -it iic-osic-tools bash
### Part B — Logic Synthesis with Yosys

| Metric | Result |
|:---|:---|
| Total number of cells | 67 |
| Number of flip-flops | 16 |
| Total cell area | 746.9664 µm² |
| Flip-flop area | 400.3840 µm² |
| Flip-flop area (% of total) | 53.60% |
| 3 most-used cell types | `dfrtp_1`: 16, `nand2_1`: 12, `xnor2_1`: 7 |
| Netlist simulation | PASS: 256 vectors checked, 0 errors |


### Part C - Static Timing Analysis

| Metric | Value |
| :--- | :--- |
| Worst slack at $T = 10\text{ ns}$ (ns) | 7.4ns |
| $T_{\text{min}}$ (ns) |10 - 7.4 = 2.6ns|
| $F_{\text{max}}$ (MHz) | 1000/2.6 = 384.62 MHz |
| Slack at $T = T_{\text{min}}$ (ns) |0.004ns(VIOLATED)|
| Critical path start point |106|
| Critical path end point |100 |
| Number of cells on the critical path | 8|
| Latency (ns) = $2 \times T_{\text{min}}$ |2 x 2.6 = 5.2ns |
| Throughput (million results per second) |384.62 |