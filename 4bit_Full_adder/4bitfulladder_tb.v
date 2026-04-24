module fourbitfulladder_tb;

  reg [3:0] a, b;
  reg c0;
  wire [3:0] s;
  wire c4;

  // instantiate your 4-bit adder
  fourbitfulladder uut (
    .a(a),
    .b(b),
    .c0(c0),
    .s(s),
    .c4(c4)
  );

  initial begin
    // VCD dump
    $dumpfile("fourbitfulladder.vcd");
    $dumpvars(0, fourbitfulladder_tb);

    $monitor("t=%0t | a=%b b=%b c0=%b | sum=%b carry=%b",
              $time, a, b, c0, s, c4);

    // test cases
    a=4'b0000; b=4'b0000; c0=0; #10;
    a=4'b0001; b=4'b0010; c0=0; #10;
    a=4'b0101; b=4'b0011; c0=0; #10;
    a=4'b1111; b=4'b0001; c0=0; #10;
    a=4'b1010; b=4'b0101; c0=1; #10;
    a=4'b1111; b=4'b1111; c0=1; #10;

    $finish;
  end

endmodule