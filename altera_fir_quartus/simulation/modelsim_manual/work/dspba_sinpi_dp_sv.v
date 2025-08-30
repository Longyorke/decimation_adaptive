// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
// Latency = 42 cycles
module dspba_sinpi_dp_sv(
  input logic clock,
  input logic [63:0] dataa,
  input logic enable,     // not used!!
  output logic [63:0] result
);
  reg areset;
  
  initial
  begin
    #0 areset = 1'b1;
    #5 areset = 1'b0;
  end
  
  SinPiDPStratixVf400 inst(
    .xIn_0(dataa),
    .xOut_0(result),
    .clk(clock),
    .areset(areset)
  );
endmodule

