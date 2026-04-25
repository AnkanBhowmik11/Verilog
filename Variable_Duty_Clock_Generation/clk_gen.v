module clk_gen (output reg clk);
  parameter CLK_PERIOD = 10;
  parameter DUTY_CYCLE = 60; // 60% duty cycle (update accordingly)
  parameter TCLK_HI = (CLK_PERIOD * DUTY_CYCLE / 100);
  parameter TCLK_LO = (CLK_PERIOD - TCLK_HI);

  initial
    clk = 0;

  always
  begin
    #TCLK_LO;
    clk = 1'b1;
    #TCLK_HI;
    clk = 1'b0;
  end
endmodule