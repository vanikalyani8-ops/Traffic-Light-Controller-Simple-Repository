# Traffic Light Controller (Verilog)

A simple three-state FSM traffic-light simulation.

## Files
- `traffic_light_controller.v` — controller module
- `tb_traffic_light_controller.v` — testbench (checks one-hot outputs and creates VCD)

## Run (Windows PowerShell)
Open PowerShell in this folder:
```powershell
iverilog -g2012 -o traffic_sim traffic_light_controller.v tb_traffic_light_controller.v
vvp traffic_sim
gtkwave traffic_light.vcd
```
Expected console message: `PASS: traffic-light outputs are one-hot during the test.`

This is a classroom simulation only. It is not a real traffic signal controller.
