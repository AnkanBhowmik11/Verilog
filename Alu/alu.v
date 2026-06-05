//alu code

module alu (
input [7:0] A,
input [7:0] B,
input [1:0] S,
output reg [7:0] R
);

wire [7:0] add_out;
wire [7:0] sub_out;
wire [7:0] and_out;
wire [7:0] or_out;

assign add_out= A + B;
assign sub_out= A - B;
assign and_out= A & B;
assign or_out= A | B;

always @(*) begin

if (S== 2'b00)
R = add_out;

else if (S== 2'b01)
R = sub_out;

else if (S== 2'b10)
R = and_out;

else
R = or_out;
end

endmodule