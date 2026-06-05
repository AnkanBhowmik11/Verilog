`timescale 1ns/1ps

module graycode_tb();

reg [3:0] a;
wire [3:0] g;

graycode_converter DUT(a,g);

initial begin
    $dumpfile("graycode.vcd");
    $dumpvars(0, graycode_tb);
    $monitor($time, " a=%b, g=%b", a, g);

    //test cases
    a = 4'b0000; #10;
    a = 4'b0001; #10;
    a = 4'b0010; #10;
    a = 4'b0011; #10;
    a = 4'b0100; #10;
    a = 4'b0101; #10;
    a = 4'b0110; #10;
    a = 4'b0111; #10;
    a = 4'b1000; #10;
    a = 4'b1001; #10;
    a = 4'b1010; #10;
    a = 4'b1011; #10;
    a = 4'b1100; #10;
    a = 4'b1101; #10;
    a = 4'b1110; #10;
    a = 4'b1111; #10;

    $finish;
    end
endmodule