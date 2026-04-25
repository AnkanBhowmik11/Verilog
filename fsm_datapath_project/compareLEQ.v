module compareLEQ #(parameter W = 8)(
    output leq,
    input [W-1:0] a,
    input [W-1:0] b
);

assign leq = (a <= b);

endmodule