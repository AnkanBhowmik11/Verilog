module mux4x1_tb;

  reg i0, i1, i2, i3;
  reg s1, s0;
  wire y;

  // instantiate your mux
  mux uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s1(s1),
    .s0(s0),
    .y(y)
  );

  initial begin
    // VCD dump
    $dumpfile("mux4x1.vcd");
    $dumpvars(0, mux4x1_tb);

    $monitor("t=%0t | s1=%b s0=%b | y=%b", $time, s1, s0, y);

    // set inputs (you can change these)
    i0=0; i1=1; i2=0; i3=1;

    // test all select combinations
    s1=0; s0=0; #10;  // expect y = i0
    s1=0; s0=1; #10;  // expect y = i1
    s1=1; s0=0; #10;  // expect y = i2
    s1=1; s0=1; #10;  // expect y = i3

    $finish;
  end

endmodule