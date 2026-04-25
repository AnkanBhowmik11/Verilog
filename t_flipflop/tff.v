module dff(
    input clk,
    input rst, 
    input d,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 0;
    end else begin
        q <= d;
    end
end
endmodule

module tff(q, clk, rst);

input clk, rst;
output q;
wire d;
dff dff0(clk, rst, d, q);

assign d= ~q;

endmodule