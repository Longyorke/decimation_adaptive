//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/30 20:47:14
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
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_To_Physical_Conversion (
    input  wire               clk,              // 50 MHz clock
    input  wire               rst_n,            // Active low reset
    input  wire               data_tvalid,      // Trigger signal for valid input
    input  signed [15:0]      in_digital,       // Input digital quantity
    output reg  signed [15:0] out_physical,     // Output sfix16_En13 (fixed-point)
    output reg                conversion_valid  // Output conversion completion flag
);

    // 内部寄存器
    reg signed [15:0] in_digital_reg;
    reg signed [31:0] mult_result;

    // 用于检测 data_tvalid 的上升沿
    reg data_tvalid_d;

    wire data_tvalid_rising;
    assign data_tvalid_rising = (data_tvalid == 1'b1) && (data_tvalid_d == 1'b0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_tvalid_d     <= 1'b0;
            in_digital_reg    <= 16'sd0;
            mult_result       <= 32'sd0;
            out_physical      <= 16'sd0;
            conversion_valid  <= 1'b0;
        end else begin
            data_tvalid_d <= data_tvalid;

            if (data_tvalid_rising) begin
                // 采样输入并启动计算
                in_digital_reg   <= in_digital;
                mult_result      <= in_digital * 10240;  // 等效于乘以1.25
                out_physical     <= (in_digital * 10240) >>> 13;
                conversion_valid <= 1'b1;
            end else begin
                conversion_valid <= 1'b0;
            end
        end
    end

endmodule

