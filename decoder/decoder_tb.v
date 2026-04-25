// Testbench for 3:8 Decoder

module decoder_tb;

reg a, b, c;
wire [7:0] out;   

// Instantiate DUT
decoder uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, decoder_tb);
end

// Apply all input combinations
initial begin
    $display("Time | a b c | out");
    $monitor("%4t | %b %b %b | %b",
              $time, a, b, c, out);

    a = 0; b = 0; c = 0; #10;
    a = 0; b = 0; c = 1; #10;
    a = 0; b = 1; c = 0; #10;
    a = 0; b = 1; c = 1; #10;
    a = 1; b = 0; c = 0; #10;
    a = 1; b = 0; c = 1; #10;
    a = 1; b = 1; c = 0; #10;
    a = 1; b = 1; c = 1; #10;

    $finish;
end

endmodule