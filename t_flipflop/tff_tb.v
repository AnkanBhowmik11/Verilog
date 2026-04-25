// Testbench for T Flip-Flop

module tff_tb;

reg clk;
reg rst;
wire q;

// Instantiate DUT
tff uut (
    .q(q),
    .clk(clk),
    .rst(rst)
);

// Clock generation (10 time units period)
always #5 clk = ~clk;

// GTKWave dump
initial begin
    $dumpfile("tff.vcd");
    $dumpvars(0, tff_tb);
end

// Test stimulus
initial begin
    clk = 0;
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Let T-FF toggle for some clock cycles
    #60;

    // Apply reset again
    rst = 1;
    #10 rst = 0;

    // Run again
    #40;

    $finish;
end

// Monitor signals
initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | q=%b",
              $time, clk, rst, q);
end

endmodule