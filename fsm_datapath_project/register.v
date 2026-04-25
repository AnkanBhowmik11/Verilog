module register #(parameter W = 8)(
    output reg [W-1:0] out,
    input [W-1:0] in,
    input clear,
    input load,
    input clk
);

always @(posedge clk) begin
    if (clear)
        out <= 0;
    else if (load)
        out <= in;
end

endmodule