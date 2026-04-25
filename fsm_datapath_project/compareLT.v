module compareLT #(parameter W = 8)(
    output lt,
    input [W-1:0] a,
    input [W-1:0] b
);

assign lt = (a < b);

endmodule