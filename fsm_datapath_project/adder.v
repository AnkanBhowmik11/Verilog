module adder #(parameter W = 8)(
    output [W-1:0] sum,
    input [W-1:0] a,
    input [W-1:0] b
);

assign sum = a + b;

endmodule