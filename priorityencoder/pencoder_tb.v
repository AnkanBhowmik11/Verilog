module pencoder_tb;

  reg [7:0] p;
  wire z1, z2, z4;

  // connect bits
  priorityencoder uut (
    .p0(p[0]), .p1(p[1]), .p2(p[2]), .p3(p[3]),
    .p4(p[4]), .p5(p[5]), .p6(p[6]), .p7(p[7]),
    .z1(z1), .z2(z2), .z4(z4)
  );

  initial begin
    $dumpfile("pencoder.vcd");
    $dumpvars(0, pencoder_tb);

    $monitor("t=%0t p=%b | z=%b%b%b", $time, p, z4, z2, z1);

    p=8'b00000001; #10; // p0
    p=8'b00000010; #10; // p1
    p=8'b00000100; #10; // p2
    p=8'b00001000; #10; // p3
    p=8'b00010000; #10; // p4
    p=8'b00100000; #10; // p5
    p=8'b01000000; #10; // p6
    p=8'b10000000; #10; // p7

    // multiple inputs (priority check)
    p=8'b10101010; #10; // should pick p7
    p=8'b00110000; #10; // should pick p5

    #10 $finish;
  end

endmodule