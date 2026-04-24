module mux(i0,i1,i2,i3,s1,s0,y);

input i0,i1,i2,i3,s1,s0;
output y;

wire y0,y1,y2,y3;

assign y0= (i0 & ~s1 & ~s0);
assign y1= (i1 & ~s1 & s0);
assign y2= (i2 & s1 & ~s0);
assign y3= (i3 & s1 & s0);

assign y= (y0 | y1 | y2 | y3);

endmodule