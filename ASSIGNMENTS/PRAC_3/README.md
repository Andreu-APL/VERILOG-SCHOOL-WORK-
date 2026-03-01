# PRAC_3: Up/Down Counter with Load and 7-Segment Display

## Objective
This project implements a complete digital counter system on an FPGA. It features an adjustable up/down counter limited to a 0–100 range, a clock divider to make the counting visible to the human eye, a load function to force a specific starting value, and a 4-digit BCD to 7-segment display output.



## Module Structure

The project is broken down into modular components:

* **`clk_divide.v`**: Generates a slow clock (`clk_div`) from the FPGA's main high-speed clock. 
    * *Default:* Divides a 50 MHz base clock down to approximately 5 Hz.
* **`count.v`**: An 8-bit counter with the following behaviors:
    * **Reset:** Forces the counter to `0`.
    * **Load (Active-Low):** Loads the value from `data_in`. If `data_in > 100`, it caps the load value at `100`.
    * **Up/Down:** If `0`, increments. If `1`, decrements.
    * **Wrap-around:** Counting up past `100` wraps to `0`. Counting down below `0` wraps to `100`.
* **`BCD_4display.v` & `BCD.v`**: Converts the binary counter value into 4 distinct BCD digits (Units, Tens, Hundreds, Thousands) and decodes them for the 7-segment displays.
* **`main.v`**: The core integration module that wires the clock divider, counter, and displays together.
* **`main_w.v` (Wrapper):** The top-level module that maps the internal `main.v` logic to the physical pins of the FPGA board.

## I/O Pin Mapping
This project is mapped for the **DE10-Lite** (Intel MAX 10) and is easily adaptable for the **DE10-Standard**.

| Signal | Type | Hardware Component | Description |
| :--- | :--- | :--- | :--- |
| **`clk`** | `Input` | **MAX10_CLK1_50** | 50 MHz base clock. |
| **`rst`** | `Input` | **Push Button (KEY[0])** | Active-low reset (forces count to 0). |
| **`load`** | `Input` | **Push Button (KEY[1])** | Active-low load (sets count to `data_in`). |
| **`up_down`**| `Input` | **Switch (SW[9])** | `0` = Count Up, `1` = Count Down. |
| **`data_in`**| `Input` | **Switches (SW[6:0])** | 7-bit binary input for the load function. |
| **`HEX0`** | `Output` | **7-Segment Display** | Units digit. |
| **`HEX1`** | `Output` | **7-Segment Display** | Tens digit. |
| **`HEX2`** | `Output` | **7-Segment Display** | Hundreds digit. |
| **`HEX3`** | `Output` | **7-Segment Display** | Thousands digit. |

## Hardware & Software
* **Boards:** Terasic DE10-Lite (`10M50DAF484C7G`) / DE10-Standard (`5CSXFC6D6F31C6N`)
* **Synthesis:** Intel Quartus Prime 25.1
* **Simulation (macOS):** Icarus Verilog (OSS CAD Suite) & GTKWave
* **Simulation (Windows/Linux):** Questa Intel FPGA Edition

## Simulation Instructions (macOS / OSS CAD Suite)
To verify the counter logic before flashing it to the board, you will need to compile all interconnected modules alongside the testbench file (`main_tb.v`).

```bash
# Compile all design modules and the testbench
iverilog -o a.out main_tb.v main.v clk_divide.v count.v BCD_4display.v BCD.v

# Run the simulation executable
./a.out

# Open the generated waveform in GTKWave
gtkwave main_tb.vcd
