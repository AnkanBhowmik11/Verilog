module simpleckt(x,y,a,b,c);
input a,b,c;
wire e;
output x,y;

and g1(e,a,b);
not g2(y,c);
or g3 (x,e,y);
endmodule