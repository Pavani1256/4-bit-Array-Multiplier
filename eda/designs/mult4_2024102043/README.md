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
