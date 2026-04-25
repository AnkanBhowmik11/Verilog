module bcd_to_excess3_tb;

reg a, b, c, d;
wire w, x, y, z;

// Instantiate DUT
bcd_to_excess3 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .w(w),
    .x(x),
    .y(y),
    .z(z)
);

// GTKWave dump
initial begin
    $dumpfile("bcd_to_excess3.vcd");
    $dumpvars(0, bcd_to_excess3_tb);
end

// Apply test vectors
initial begin
    $display("Time | a b c d | w x y z");
    $monitor("%4t | %b %b %b %b | %b %b %b %b",
              $time, a, b, c, d, w, x, y, z);

    // Test all valid BCD inputs (0 to 9)

    a=0; b=0; c=0; d=0; #10; // 0 -> 0011
    a=0; b=0; c=0; d=1; #10; // 1 -> 0100
    a=0; b=0; c=1; d=0; #10; // 2 -> 0101
    a=0; b=0; c=1; d=1; #10; // 3 -> 0110
    a=0; b=1; c=0; d=0; #10; // 4 -> 0111
    a=0; b=1; c=0; d=1; #10; // 5 -> 1000
    a=0; b=1; c=1; d=0; #10; // 6 -> 1001
    a=0; b=1; c=1; d=1; #10; // 7 -> 1010
    a=1; b=0; c=0; d=0; #10; // 8 -> 1011
    a=1; b=0; c=0; d=1; #10; // 9 -> 1100

    $finish;
end

endmodule