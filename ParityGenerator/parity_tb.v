// Testbench for 4-bit Parity Generator

module parity_tb;

reg a, b, c, d;
wire p;

// Instantiate DUT
four_bit_parity uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .p(p)
);

// GTKWave dump
initial begin
    $dumpfile("parity.vcd");
    $dumpvars(0, parity_tb);
end

// Apply test vectors
initial begin
    $display("Time | a b c d | p");
    $monitor("%4t | %b %b %b %b | %b",
              $time, a, b, c, d, p);

    // Test all 16 input combinations

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