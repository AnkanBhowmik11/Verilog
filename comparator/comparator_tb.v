module comparator_tb;

  reg [3:0] a, b;
  wire e, g, l;


  fourbitcomparator uut (
    .a(a),
    .b(b),
    .e(e),
    .g(g),
    .l(l)
  );

  initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0, comparator_tb);

    $monitor("t=%0t | a=%b b=%b | e=%b g=%b l=%b",
              $time, a, b, e, g, l);

    a=4'b0000; b=4'b0000; #10;
    a=4'b0010; b=4'b0001; #10;
    a=4'b0001; b=4'b0010; #10;
    a=4'b1111; b=4'b0111; #10;
    a=4'b0101; b=4'b0101; #10;
    a=4'b0011; b=4'b1010; #10;

    #10 $finish;
  end

endmodule