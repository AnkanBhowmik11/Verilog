// Testbench for 4-bit CLA Adder

module claAdder_tb;

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

// Instantiate DUT
claAdder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("claAdder.vcd");
    $dumpvars(0, claAdder_tb);
end

// Apply test vectors
initial begin
    $display("Time |   a   |   b   | cin |  sum  | cout");
    $monitor("%4t | %4b | %4b |  %b  | %4b |  %b",
              $time, a, b, cin, sum, cout);

    // Test cases

    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    a = 4'b0001; b = 4'b0010; cin = 0; #10;
    a = 4'b0101; b = 4'b0011; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1010; b = 4'b0101; cin = 1; #10;
    a = 4'b1111; b = 4'b1111; cin = 1; #10;
    a = 4'b1001; b = 4'b0110; cin = 0; #10;
    a = 4'b0111; b = 4'b1000; cin = 1; #10;

    $finish;
end

endmodule