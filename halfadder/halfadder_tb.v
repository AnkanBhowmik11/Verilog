`timescale 1ns/1ps

module halfadder_tb;

  reg a, b;
  wire sum, carry;

  halfadder uut (
    .x(a),
    .y(b),
    .s(sum),
    .c(carry)
  );

  initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0, halfadder_tb);

    $monitor("A=%b B=%b | SUM=%b CARRY=%b", a, b, sum, carry);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;
  end

endmodule