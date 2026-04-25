// Testbench for 4-bit Ripple Counter using T Flip-Flops

module rcc_tb;

reg clk;
reg rst;
wire [3:0] q;

// Instantiate DUT
rcc uut (
    .q(q),
    .clk(clk),
    .rst(rst)
);

// Clock generation (10 time units period)
always #5 clk = ~clk;

// GTKWave dump
initial begin
    $dumpfile("rcc.vcd");
    $dumpvars(0, rcc_tb);
end

// Test stimulus
initial begin
    clk = 0;
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Let counter run
    #100;

    // Apply reset again
    rst = 1;
    #10 rst = 0;

    // Run again
    #50;

    $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0t | rst=%b | q=%b",
              $time, rst, q);
end

endmodule