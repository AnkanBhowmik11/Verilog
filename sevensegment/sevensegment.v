module sevensegment (digit,segment);

input [3:0] digit;
output reg [6:0] segment;

always @(*) begin
    
    case (digit)
        4'd0: segment = 7'b1111110;
        4'd1: segment = 7'b0110000;
        4'd2: segment = 7'b1101101;
        4'd3: segment = 7'b1111001;
        4'd4: segment = 7'b0110011;
        4'd5: segment = 7'b1011011;
        4'd6: segment = 7'b1011111;
        4'd7: segment = 7'b1110000;
        4'd8: segment = 7'b1111111;
        4'd9: segment = 7'b1111011;
        default: segment = 7'b0000000;
    endcase
end 
endmodule