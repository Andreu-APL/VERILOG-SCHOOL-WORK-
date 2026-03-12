# Practice 7: VGA Chessboard

## Description
This project demonstrates basic VGA signal generation by displaying a checkerboard pattern on a monitor. It generates the necessary Horizontal Sync (HS) and Vertical Sync (VS) signals along with RGB color data.

## Modules
*   **vga.v**: VGA Controller that generates synchronization signals and pixel coordinates (X, Y).
*   **vga_demo.v**: Top-level module that uses the VGA controller and generates the checkerboard pattern based on pixel coordinates.

## Inputs & Outputs (MAX10 Lite)
*   **Clock**: 50 MHz System Clock.
*   **VGA_HS**: Horizontal Sync Output.
*   **VGA_VS**: Vertical Sync Output.
*   **VGA_R, VGA_G, VGA_B**: Red, Green, Blue color signals (4-bit each).

## How to Run
1.  Open the project in Quartus Prime.
2.  Compile the design.
3.  Program the MAX10 Lite FPGA.
4.  Connect a VGA monitor to the VGA port on the MAX10 Lite board.
5.  Observe the checkerboard pattern on the screen.
