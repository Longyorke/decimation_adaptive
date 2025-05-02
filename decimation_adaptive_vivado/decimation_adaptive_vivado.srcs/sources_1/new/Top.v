//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Yu Long
// 
// Create Date: 2023/12/27 12:13:14
// Module Name: Top
// Project Name: decimation_adaptive_vivado
// Target Devices: xc7a200tfbg484
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision Date: 2025/04/30 10:33:35
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
    sys_clk_p,
    sys_clk_n,
	rst_n,
    acc_data,
	adc_data,
	adc_data_valid,
	all_frame_data,
	all_frame_valid				
    );
    
    input                       sys_clk_p;
	input                       sys_clk_n;
    wire 		                Clk;//200M single-ended input
    wire 		                Clk_50MHz;
	wire 		                Clk_100MHz;
	input   wire             	rst_n;
    input	wire [15:0]         acc_data;
    input	wire [15:0]         adc_data;
	input   wire             	adc_data_valid;
	output	wire [15:0]         all_frame_data;
	output	wire                all_frame_valid;
	
	wire [15:0]                 data_decimation_out;
	wire [15:0]                 physical_signal;
	wire                        conversion_valid;
	wire                        data_tvalid;
	
	
	//Differential crystal oscillator signal conversion to single-ended buffering
	IBUFDS sys_clk_ibufgds
    (
        .O                          (Clk                  ),
        .I                          (sys_clk_p                ),
        .IB                         (sys_clk_n                )
    );
        
  clk_wiz_0 clk_200M_to_50M_and_100M
   (
    // Clock out ports
    .clk_out_50M(Clk_50MHz),     // output clk_out_50M
//    .clk_out_100M(Clk_100MHz),     // output clk_out_100M
    // Status and control signals
    .resetn(rst_n), // input resetn
    .locked(),       // output locked
   // Clock in ports
    .clk_in_200M(Clk));      // input clk_in_200M

  decimation_1ch_d128_20 u_decimation_1ch_d128_20 (
    .rst_n(rst_n),
    .sig_in1(adc_data),
    .start_filtering(adc_data_valid),
    .clk(Clk_50MHz),
    .data_tvalid2(data_tvalid),//The wave module completes the filtering reminder signal
    .sig_out7(data_decimation_out)//D128*20 
  );
  
  // Convert a digital quantity into the corresponding voltage, electric field component, or other parameters.
  Digital_To_Physical_Conversion u_Digital_To_Physical_Conversion(
    .clk(Clk_50MHz),
    .rst_n(rst_n),
    .in_digital(data_decimation_out),        // Input digital quantity
    .data_tvalid(data_tvalid),               // Trigger signal for valid input
    .out_physical(physical_signal),           // sfix24_En13 
    .conversion_valid(conversion_valid)      // Output conversion completion flag
    );

  MDV_LMS_Algorithm u_MDV_LMS_Algorithm (
    .clk(Clk_50MHz),
    .reset(!rst_n),
    .clk_enable(1),
    .observedSignal(acc_data),  // sfix24_En13
    .desiredSignal(physical_signal),  // sfix24_En13
    .valid(conversion_valid),
    .stepSize(stepSize),  // sfix18_En18 
    .adapt(1), // When should the coefficients be modified
    .reset_1(!rst_n),
    .filterError_signal1(all_frame_data),  // sfix31_En16
    .ready(all_frame_valid)
  );
           
           
endmodule
