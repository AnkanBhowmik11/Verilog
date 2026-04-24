module fulladder_tb;

  reg x, y, z;     // inputs
  wire s, c;       // outputs

  // instantiate full adder
  fulladder uut (
    .x(x),
    .y(y),
    .z(z),
    .s(s),
    .c(c)
  );

  initial begin
    // VCD dump for waveform
    $dumpfile("fulladder.vcd");
    $dumpvars(0, fulladder_tb);

    // monitor values
    $monitor("t=%0t x=%b y=%b z=%b | sum=%b carry=%b", $time, x, y, z, s, c);

    // test all combinations
    x=0; y=0; z=0; #10;
    x=0; y=0; z=1; #10;
    x=0; y=1; z=0; #10;
    x=0; y=1; z=1; #10;
    x=1; y=0; z=0; #10;
    x=1; y=0; z=1; #10;
    x=1; y=1; z=0; #10;
    x=1; y=1; z=1; #10;

    $finish;
  end

endmodule