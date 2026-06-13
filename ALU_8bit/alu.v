module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [3:0] sel,
    input carry_in,
    output [15:0] out,
    output carry_out
);

    wire [8:0] add_c, sub_c;
    wire [15:0] mul_c;
    wire [7:0] div_c, and_c, or_c, not_c, xor_c;
    wire eq, gt, lt;
    wire [7:0] rar_c, ral_c, shl_c, shr_c, inr_c, dcr_c;
    wire rar_co, ral_co, shl_co, shr_co, inr_co, dcr_co;

// ── Instantiate ALL sub-modules (structural, always active) ──
    adder       u_add (a, b, add_c);
    substractor u_sub (a, b, sub_c);
    multiplier   u_mul (a, b, mul_c);
    divider     u_div (a, b, div_c);
    and_op      u_and (a, b, and_c);
    or_op       u_or  (a, b, or_c);
    not_op      u_not (a, not_c);
    xor_op      u_xor (a, b, xor_c);
    compare     u_cmp (a, b, eq, gt, lt);
    rar         u_rar (a, carry_in, rar_c, rar_co);
    ral         u_ral (a, carry_in, ral_c, ral_co);
    shl         u_shl (a, shl_c, shl_co);
    shr         u_shr (a, shr_c, shr_co);
    inr         u_inr (a, inr_c, inr_co);
    dcr         u_dcr (a, dcr_c, dcr_co);

    // ── Behavioral MUX — selects which result becomes `out` ──
    reg [15:0] out_reg;
    reg carry_reg;

    always @(*) begin
        // ── Default values (prevents inferred latches) ──
        out_reg   = 16'h0000;
        carry_reg = 1'b0;

        case (sel)

            4'b0000: begin 
                out_reg = {7'b0, add_c};        
                carry_reg = add_c[8]; 
                end // ADD
            4'b0001: begin 
                out_reg = {7'b0, sub_c};        
                carry_reg = sub_c[8]; 
                end // SUB
            4'b0010: begin 
                out_reg = mul_c;                                       
                end // MUL
            4'b0011: begin 
                out_reg = {8'b0, div_c};                              
                end // DIV
            4'b0100: begin 
                out_reg = {8'b0, and_c};                              
                end // AND
            4'b0101: begin 
                out_reg = {8'b0, or_c};                               
                end // OR
            4'b0110: begin 
                out_reg = {8'b0, not_c};                              
                end // NOT
            4'b0111: begin 
                out_reg = {8'b0, xor_c};                              
                end // XOR
            4'b1000: begin 
                out_reg = {13'b0, eq, gt, lt};                        
                end // CMP
            4'b1001: begin 
                out_reg = {8'b0, rar_c};        
                carry_reg = rar_co;   
                end // RAR
            4'b1010: begin 
                out_reg = {8'b0, ral_c};        
                carry_reg = ral_co;   
                end // RAL
            4'b1011: begin 
                out_reg = {8'b0, shl_c};        
                carry_reg = shl_co;   
                end // SHL
            4'b1100: begin 
                out_reg = {8'b0, shr_c};        
                carry_reg = shr_co;   
                end // SHR
            4'b1101: begin 
                out_reg = {8'b0, inr_c};        
                carry_reg = inr_co;   
                end // INR
            4'b1110: begin 
                out_reg = {8'b0, dcr_c};        
                carry_reg = dcr_co;   
                end // DCR

        endcase
    end

    assign out       = out_reg;
    assign carry_out = carry_reg;
    
endmodule

//Arithmatic operations
//1.adder

module adder(
    input [7:0] a,
    input [7:0] b,
    output [8:0] c
);
    assign c= a + b;
endmodule

//2.substractor

module substractor(
    input [7:0] a,
    input [7:0] b,
    output [8:0] c
);
    assign c= a - b;
endmodule

//3.multiplier

module multiplier(
    input [7:0] a,
    input [7:0] b,
    output [15:0] c
);
    assign c= a * b;
endmodule

//4.divider

module divider(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
);
    assign c= a / b;
endmodule

//Logical operators
//1.AND Operation

module and_op(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
);
    assign c= a & b;
endmodule

//2.OR Operation

module or_op(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
);
    assign c= a | b;
endmodule

//3. NOT Operation

module not_op(
    input [7:0] a,
    output [7:0] c
);
    assign c = ~a;
endmodule

//4.XOR Operation

module xor_op(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
);
    assign c= a ^ b;
endmodule

//5.Compare operation

module compare (
    input [7:0] a,
    input [7:0] b,
    output e, g, l
);
    assign e = (a == b);
    assign g = (a > b);
    assign l = (a < b);
endmodule

//Bitwise operations
//1.RAR - Rotate Right

module rar(
    input [7:0] a,
    input carry_in,
    output [7:0] c,
    output carry_out
);
    assign c = {carry_in, a[7:1]};
    assign carry_out = a[0];
endmodule

//2.RAL - Rotate Left

module ral(
    input [7:0] a,
    input carry_in,
    output [7:0] c,
    output carry_out
);
    assign c = {a[6:0], carry_in};
    assign carry_out = a[7];
endmodule

//3.SHL - Shift Left

module shl(
    input [7:0] a,
    output [7:0] c,
    output carry_out
);
    assign c = {a[6:0], 1'b0};
    assign carry_out = a[7];
endmodule

//4.SHR - Shift Right

module shr(
    input [7:0] a,
    output [7:0] c,
    output carry_out
);
    assign c = {1'b0, a[7:1]};
    assign carry_out = a[0];
endmodule

//5.INR- Increment

module inr(
    input [7:0] a,
    output [7:0] c,
    output carry_out
);
    assign c = a + 1'b1;
    assign carry_out = (a == 8'hFF);
endmodule

//6.DCR — Decrement

module dcr(
    input [7:0] a,
    output [7:0] c,
    output borrow_out
);
    assign c = a - 1'b1;
    assign borrow_out = (a == 8'h00);   // 1 if wraps from 0 → 255
endmodule