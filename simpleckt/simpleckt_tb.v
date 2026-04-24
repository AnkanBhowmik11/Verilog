`timescale 1ns/1ps

module simpleckt_tb;
  reg a;
  reg b;
  reg c;
  wire x;
  wire y;

  simpleckt dut (
    .x(x),
    .y(y),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(0, simpleckt_tb);

    $monitor("t=%0t a=%b b=%b c=%b | x=%b y=%b", $time, a, b, c, x, y);

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