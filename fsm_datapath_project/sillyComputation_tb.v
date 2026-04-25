// Testbench for sillyComputation (FSM + Datapath)

module sillyComputation_tb;

parameter W = 8;

reg clk;
reg reset;
reg [W-1:0] yIn;

wire [W-1:0] x;
wire [W-1:0] y;

// Instantiate DUT
sillyComputation #(W) uut (
    .clk(clk),
    .reset(reset),
    .yIn(yIn),
    .x(x),
    .y(y)
);

// Clock generation (10 time unit period)
always #5 clk = ~clk;

// GTKWave dump
initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, sillyComputation_tb);
end

// Test stimulus
initial begin
    clk = 0;
    reset = 1;
    yIn = 8'd5;   // Example input value for y

    // Apply reset
    #10;
    reset = 0;

    // Let FSM run
    #200;

    // Change input and test again
    reset = 1;
    #10;
    reset = 0;
    yIn = 8'd3;

    #200;

    $finish;
end

// Monitor signals
initial begin
    $monitor("Time=%0t | reset=%b | yIn=%d | x=%d | y=%d",
              $time, reset, yIn, x, y);
end

endmodule