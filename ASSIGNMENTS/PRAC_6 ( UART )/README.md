# Practice 6: UART Communication

## Description
This project implements a Universal Asynchronous Receiver-Transmitter (UART) interface. It includes both Transmitter (Tx) and Receiver (Rx) modules to enable serial communication between the FPGA and another device (like a PC or another FPGA).

## Modules
*   **UART_Rx.v**: Receiver module that deserializes incoming bits.
*   **UART_Tx.v**: Transmitter module that serializes parallel data for transmission.
*   **top_rx.v / top_tx.v**: Top-level modules for testing Rx and Tx functionality separately or together.
*   **BCD_4display.v**: Used to display received data on the 7-segment displays.

## Inputs & Outputs (MAX10 Lite)
*   **UART_RXD**: Serial Input (Receive).
*   **UART_TXD**: Serial Output (Transmit).
*   **Switches**: Data input for transmission.
*   **Buttons**: Trigger transmission.
*   **7-Segment Displays**: Show received data bytes.

## How to Run
1.  Open the project in Quartus Prime.
2.  Compile the design.
3.  Program the MAX10 Lite FPGA.
4.  Connect the UART pins to a USB-TTL adapter or another UART device.
5.  Use a serial terminal (like Putty or TeraTerm) on your PC to send/receive characters.
