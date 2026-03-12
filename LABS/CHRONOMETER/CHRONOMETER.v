module CHRONOMETER(
    input CLK, // 50 MHz
    input [9:0] SW, // SW[0] Start/Stop
    input [1:0] KEY, // KEY[0] Reset
    output [9:0] LEDR,
    output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

    // Signals
    wire start = SW[0]; // High = Run, Low = Stop
    wire rst = !KEY[0]; // Active Low Key -> Active High Reset
    
    reg [9:0] ms_count; // 0-999
    reg [5:0] s_count;  // 0-59
    reg [5:0] m_count;  // 0-59 (Optional Minutes)

    // Clock Divider for 1ms tick
    // 50 MHz / 1000 = 50,000 counts per ms
    reg [15:0] clk_cnt;
    wire tick_1ms = (clk_cnt == 49999);

    always @(posedge CLK or posedge rst) begin
        if (rst) begin
            clk_cnt <= 0;
            ms_count <= 0;
            s_count <= 0;
            m_count <= 0;
        end else if (start) begin
            if (tick_1ms) begin
                clk_cnt <= 0;
                // Increment Time
                if (ms_count == 999) begin
                    ms_count <= 0;
                    if (s_count == 59) begin
                        s_count <= 0;
                        if (m_count == 59) 
                            m_count <= 0;
                        else 
                            m_count <= m_count + 1;
                    end else begin
                        s_count <= s_count + 1;
                    end
                end else begin
                    ms_count <= ms_count + 1;
                end
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end
        // If not start, hold values (Stop)
    end

    // Display Logic
    // HEX0, HEX1, HEX2 -> Milliseconds (000-999)
    // HEX3, HEX4 -> Seconds (00-59)
    // HEX5 -> Minutes (0-9) (Since only 1 HEX left)
    
    // Decompose ms_count (0-999)
    wire [3:0] ms_u = ms_count % 10;
    wire [3:0] ms_t = (ms_count / 10) % 10;
    wire [3:0] ms_h = (ms_count / 100) % 10;
    
    // Decompose s_count (0-59)
    wire [3:0] s_u = s_count % 10;
    wire [3:0] s_t = (s_count / 10) % 10;
    
    // Decompose m_count (0-9)
    wire [3:0] m_u = m_count % 10;

    BCD u_ms_u (.BCD_in(ms_u), .BCD_out(HEX0));
    BCD u_ms_t (.BCD_in(ms_t), .BCD_out(HEX1));
    BCD u_ms_h (.BCD_in(ms_h), .BCD_out(HEX2));
    
    BCD u_s_u  (.BCD_in(s_u),  .BCD_out(HEX3));
    BCD u_s_t  (.BCD_in(s_t),  .BCD_out(HEX4));
    
    BCD u_m_u  (.BCD_in(m_u),  .BCD_out(HEX5)); // Minutes

    // Status LEDs
    assign LEDR[0] = start; // LED0 ON when Running
    assign LEDR[9:1] = 0;

endmodule
