# Practice 4: Password FSM

## Description
This project implements a Finite State Machine (FSM) that detects a specific sequence of inputs. The system transitions through states based on the input signal, effectively acting as a password or sequence detector. When the correct sequence is detected, the output signal is asserted.

## Modules
*   **pract4.v**: The core FSM logic.
    *   **Inputs**: `rst`, `clk`, `in`
    *   **Outputs**: `out`
    *   **States**: `idle`, `S1`, `S2`, `S3`, `S4`, `bad`, `gut`
*   **main.v**: Top-level module connecting the FSM to the MAX10 Lite peripherals.
*   **BCD_4display.v**: Helper module for 7-segment displays (if used for state visualization).

## Inputs & Outputs (MAX10 Lite)
*   **Clock**: 50 MHz System Clock
*   **Reset**: KEY[0] (or similar)
*   **Input**: Switch/Button for sequence entry.
*   **Output**: LED or 7-Segment Display indicating success (`gut` state) or failure (`bad` state).

## How to Run
1.  Open the project in Quartus Prime.
2.  Compile the design.
3.  Program the MAX10 Lite FPGA.
4.  Input the sequence using the designated switch/button.
5.  Observe the output (LED/Display) to verify sequence detection.
