module four_bit_parity(a,b,c,d,p);

input a,b,c,d;
output p;

assign p=(a^b)^(c^d);

endmodule