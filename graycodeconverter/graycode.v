module graycode_converter(
    input [3:0] a,
    output [3:0] g);

assign g = a ^ (a >> 1);

endmodule
