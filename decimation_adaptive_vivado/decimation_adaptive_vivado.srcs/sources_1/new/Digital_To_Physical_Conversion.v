//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/27 07:05:20
// Design Name: 
// Module Name: Digital_To_Physical_Conversion
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This is the simplest example. 
//              It should be noted that this is relatively low-frequency data. 
//              In scenarios such as ground-penetrating radar, where high-throughput 
//              and real-time processing are critical, the use of pipelined multipliers
//              or dedicated multiplication IP cores would be more appropriate to ensure 
//              computational efficiency and timing closure.
// 
// Dependencies: 
// 
// Revision:
// Revision Date: 2025/04/29 17:18:38
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_To_Physical_Conversion (
    input  wire               clk,              // 50 MHz clock
    input  wire               rst_n,            // Active low reset
    input  wire               data_tvalid,      // Trigger signal for valid input
    input  signed [15:0]      in_digital,       // Input digital quantity (signed integer)
    output reg  signed [23:0] out_physical,     // Output sfix24_En13 (fixed-point)
    output reg                conversion_valid  // Output conversion completion flag
);

    // Internal registers
    reg signed [15:0]  in_digital_reg;
    reg signed [31:0]  scaled_result;  // Result of in_digital * scaling factor (before shift)
    reg                data_tvalid_d;

    // Rising edge detection for data_tvalid
    wire data_tvalid_rising;
    assign data_tvalid_rising = (data_tvalid == 1'b1) && (data_tvalid_d == 1'b0);

    // Scaling factor: 1.25 = 10240 / 8192 = (in_digital * 10240) >> 13
    localparam signed [13:0] SCALING_MULT = 14'd10240;  // 1.25 in Q13 (13 fractional bits)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_tvalid_d     <= 1'b0;
            in_digital_reg    <= 16'sd0;
            scaled_result     <= 32'sd0;
            out_physical      <= 24'sd0;
            conversion_valid  <= 1'b0;
        end else begin
            data_tvalid_d <= data_tvalid;

            if (data_tvalid_rising) begin
                // Sample input and perform fixed-point multiplication
                in_digital_reg <= in_digital;
                // Fixed-point multiply (Q0 * Q13 => Q13)
                scaled_result <= in_digital * SCALING_MULT;
                // Convert to sfix24_En13: scaled_result is already in Q13 format
                out_physical <= scaled_result[25:2];  // Take middle 24 bits, sign-preserved
                conversion_valid <= 1'b1;
            end else begin
                conversion_valid <= 1'b0;
            end
        end
    end

endmodule


