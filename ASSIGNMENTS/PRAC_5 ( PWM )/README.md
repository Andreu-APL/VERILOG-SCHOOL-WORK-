# Practice 5: PWM Signal Generator

## Description
This project generates a Pulse Width Modulation (PWM) signal to control a servo motor or LED brightness. The duty cycle of the PWM signal is adjusted based on the input switches, corresponding to specific angles (0°, 90°, 180°).

## Modules
*   **PWM_W.v**: Top-level wrapper connecting switches and displays to the PWM logic.
*   **comparator.v**: Logic to generate the PWM pulse based on a counter and input value.
*   **clk_divide.v**: Clock divider to generate the required frequency for PWM.
*   **BCD_4display.v**: Displays the current angle (0, 90, 180) on the 7-segment displays.

## Inputs & Outputs (MAX10 Lite)
*   **Switches (SW)**: Select the target angle/duty cycle.
    *   `SW[0]`: 0°
    *   `SW[1]`: 90°
    *   `SW[2]`: 180°
*   **ARDUINO_IO[0]**: PWM Output signal.
*   **7-Segment Displays**: Show the selected angle in decimal.

## How to Run
1.  Open the project in Quartus Prime.
2.  Compile the design.
3.  Program the MAX10 Lite FPGA.
4.  Connect a Servo Motor or LED to `ARDUINO_IO[0]`.
5.  Toggle switches to change the PWM duty cycle and observe the motor position or LED brightness.
