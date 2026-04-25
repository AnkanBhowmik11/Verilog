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

module rcc(q, clk, rst);
input clk, rst;
output [3:0] q;

tff tff0(q[0], clk, rst);
tff tff1(q[1], q[0], rst);
tff tff2(q[2], q[1], rst);
tff tff3(q[3], q[2], rst);

endmodule