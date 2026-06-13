`timescale 1ns/1ps

module alu_tb();

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] sel;
    reg carry_in;
    wire [15:0] out;
    wire carry_out;

    alu_8bit dut (a,b,sel,carry_in,out,carry_out);

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $monitor("time=%0t | sel=%b | a=%d b=%d | out=%d (%b) | carry_out=%b",
                  $time, sel, a, b, out, out, carry_out);

        // Common operands
        a = 8'd170;   // 8'b10101010
        b = 8'd85;    // 8'b01010101
        carry_in = 1'b1;

        sel = 4'b0000; #10; // ADD
        sel = 4'b0001; #10; // SUB
        sel = 4'b0010; #10; // MUL
        a = 8'd100; b = 8'd5;
        sel = 4'b0011; #10; // DIV

        a = 8'hAA; b = 8'h55;
        sel = 4'b0100; #10; // AND
        sel = 4'b0101; #10; // OR
        sel = 4'b0110; #10; // NOT
        sel = 4'b0111; #10; // XOR

        a = 8'd50; b = 8'd50;
        sel = 4'b1000; #10; // CMP (equal)
        a = 8'd80; b = 8'd30;
        sel = 4'b1000; #10; // CMP (a>b)
        a = 8'd10; b = 8'd99;
        sel = 4'b1000; #10; // CMP (a<b)

        a = 8'b10110011;
        sel = 4'b1001; #10; // RAR
        sel = 4'b1010; #10; // RAL
        sel = 4'b1011; #10; // SHL
        sel = 4'b1100; #10; // SHR

        a = 8'd254;
        sel = 4'b1101; #10; // INR

        a = 8'd1;
        sel = 4'b1110; #10; // DCR

        $finish;
    end

endmodule