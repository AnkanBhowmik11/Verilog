// Testbench for function using 8:1 MUX

module func_tb;

reg a, b, c, d;
wire out;

// Instantiate DUT
func uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .out(out)
);

// GTKWave dump
initial begin
    $dumpfile("func.vcd");
    $dumpvars(0, func_tb);
end

// Apply all input combinations
initial begin
    $display("Time | a b c d | out");
    $monitor("%4t | %b %b %b %b | %b",
              $time, a, b, c, d, out);

    a=0; b=0; c=0; d=0; #10;
    a=0; b=0; c=0; d=1; #10;
    a=0; b=0; c=1; d=0; #10;
    a=0; b=0; c=1; d=1; #10;

    a=0; b=1; c=0; d=0; #10;
    a=0; b=1; c=0; d=1; #10;
    a=0; b=1; c=1; d=0; #10;
    a=0; b=1; c=1; d=1; #10;

    a=1; b=0; c=0; d=0; #10;
    a=1; b=0; c=0; d=1; #10;
    a=1; b=0; c=1; d=0; #10;
    a=1; b=0; c=1; d=1; #10;

    a=1; b=1; c=0; d=0; #10;
    a=1; b=1; c=0; d=1; #10;
    a=1; b=1; c=1; d=0; #10;
    a=1; b=1; c=1; d=1; #10;

    $finish;
end

endmodule