# Verilog Class Work

This repository contains my Verilog HDL assignments and practice exercises for my university coursework ( TE2002B ). The projects are designed to run on Intel/Altera FPGA development boards using Quartus Prime and Questa.

## Repository Structure

The repository is organized into assignment folders. Each folder contains the Verilog source code, testbenches, and simulation outputs.

* **`ASSIGNMENTS/`**
    * **`PRAC_1/`** - **Primitive Logic / Practice 1**
        * `Prim4.V`: Main Verilog source module.
        * `Prim4_tb.v`: Testbench file for simulation.
        * `Prim4_tb.vcd`: Value Change Dump file (waveform data).
        * `a.out`: Compiled executable (simulation output).

## Hardware Setup

* **Terasic DE10-Lite** (Intel MAX 10: `10M50DAF484C7G`)
* **Terasic DE10-Standard** (Cyclone V SoC: `5CSXFC6D6F31C6N`)

## Software & Tools

* **IDE:** Intel Quartus Prime 25.1
* **Simulation:** Questa Intel FPGA Edition / ModelSim
* **Waveform Viewing:** GTKWave (for `.vcd` files) or Questa

## How to Run a Practice Module

### 1. Open in Quartus
1.  Launch **Quartus Prime**.
2.  Create a new project and add the `.V` file (e.g., `ASSIGNMENTS/PRAC_1/Prim4.V`) as the top-level entity.
3.  Assign pins according to your specific board (DE10-Lite or DE10-Standard).
4.  Compile the design.

### 2. Simulation (Testbench)
To run the testbench (e.g., `Prim4_tb.v`):
1.  Open **Questa** or your preferred simulator.
2.  Compile `Prim4.V` and `Prim4_tb.v`.
3.  Run the simulation to generate the waveform.
    * *Note: The `.vcd` file included in the folders contains the recorded simulation output.*

### 3. Program the Board
1.  Connect the DE10 board via USB.
2.  Open the **Programmer** in Quartus.
3.  Upload the generated `.sof` file to the FPGA.

---
