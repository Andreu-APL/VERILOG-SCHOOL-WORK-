`timescale 1ns/1ps

module CHRONOMETER_TB;

    reg CLK;
    reg [9:0] SW;
    reg [1:0] KEY;
    wire [9:0] LEDR;
    wire [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

    CHRONOMETER uut (
        .CLK(CLK),
        .SW(SW),
        .KEY(KEY),
        .LEDR(LEDR),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5)
    );

    initial CLK = 0;
    always #10 CLK = ~CLK; // 50 MHz

    initial begin
        $dumpfile("CHRONOMETER_TB.vcd");
        $dumpvars(0, CHRONOMETER_TB);

        // Reset
        SW = 0;
        KEY = 2'b10; // Reset (KEY[0]=0)
        #100;
        KEY = 2'b11; // Release
        #100;

        // Start
        SW[0] = 1;
        #2000000; // Run for a bit (simulating ms takes many cycles, we can check a few)
        // Since 50,000 cycles = 1ms.
        // 2,000,000 cycles / 50,000 = 40ms.
        // HEX0/1/2 should show ~040.

        // Stop
        SW[0] = 0;
        #1000;

        // Resume
        SW[0] = 1;
        #1000000;

        // Reset while running?
        KEY[0] = 0;
        #100;
        KEY[0] = 1;
        #1000000;

        $finish;
    end

endmodule
