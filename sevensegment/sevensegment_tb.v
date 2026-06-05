`timescale 1ns/1ps

module sevensegment_tb();

reg [3:0] digit;
wire [6:0] segment;

sevensegment DUT(digit, segment);
integer i;

initial begin

    $dumpfile ("sevensegment.vcd");
    $dumpvars (0, sevensegment_tb);
    $monitor ($time , " digit = %d, segment= %b", digit, segment); 

    for(i=0;i<10;i=i+1) begin
        digit=i; #10;
    end

    $finish;

end

endmodule