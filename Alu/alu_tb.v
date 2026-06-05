//testbench code
module alu_tb;

reg [7:0] A;
reg [7:0] B;
reg [1:0] S;

wire [7:0] R;

// Instantiate DUT
alu uut (
.A(A),
.B(B),
.S(S),
.R(R)
);

initial begin
$dumpfile("alu.vcd");
$dumpvars(0, alu_tb);
end

initial begin

// Test Case 1
A = 8'd10;
B = 8'd5;

S = 2'b00; // ADD
#10;

S = 2'b01; // SUB
#10;

S = 2'b10; // AND
#10;

S = 2'b11; // OR
#10;

// Test Case 2
A = 8'd12;
B = 8'd3;

S = 2'b00;
#10;

S = 2'b01;
#10;

S = 2'b10;
#10;

S = 2'b11;
#10;

// Test Case 3
A = 8'd15;
B = 8'd15;

S = 2'b00;
#10;

S = 2'b01;
#10;

S = 2'b10;
#10;

S = 2'b11;
#10;

$finish;

end

initial begin
$monitor("Time=%0t | A=%d | B=%d | S=%b | R=%d",
$time, A, B, S, R);
end

endmodule