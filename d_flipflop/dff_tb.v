// Testbench for D Flip-Flop

module dff_tb;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the DUT (Device Under Test)
dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation: 10 time units period
always #5 clk = ~clk;

initial begin
    $dumpfile("dff.vcd");   // VCD file for GTKWave
    $dumpvars(0, dff_tb);   // Dump all signals
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    d = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test case 1
    #10 d = 1;

    // Test case 2
    #10 d = 0;

    // Test case 3
    #10 d = 1;

    // Apply reset again
    #10 rst = 1;

    #10 rst = 0;
    d = 0;

    #20 d = 1;

    // Finish simulation
    #20;
    $finish;
end

// Monitor signals
initial begin
    $monitor("Time = %0t | clk = %b | rst = %b | d = %b | q = %b",
              $time, clk, rst, d, q);
end

endmodule