module jk_ff_tb;

reg j, k, clk;
wire q;

jk_ff uut (.j(j), .k(k), .clk(clk), .q(q));

// Clock: period = 10
initial clk = 0;
always #5 clk = ~clk;

// VCD dump
initial begin
    $dumpfile("jk_ff_output.vcd");
    $dumpvars(0, jk_ff_tb);
end

// Monitor
initial $monitor("Time=%3t | clk=%b | j=%b k=%b | q=%b", $time, clk, j, k, q);

task apply;
    input tj, tk;
    begin
        j = tj; k = tk;
        @(posedge clk); #1;
    end
endtask

task check;
    input exp_q;
    input [8*16-1:0] label;
    begin
        if (q !== exp_q)
            $display("FAIL: %s | Expected q=%b, Got q=%b", label, exp_q, q);
        else
            $display("PASS: %s | q=%b", label, q);
    end
endtask

initial begin
    j = 0; k = 0;
    #3;

    apply(0, 1); check(0, "RESET J=0,K=1    ");
    apply(1, 0); check(1, "SET   J=1,K=0    ");
    apply(0, 0); check(1, "HOLD  J=0,K=0 Q=1");
    apply(0, 1); check(0, "RESET J=0,K=1    ");
    apply(0, 0); check(0, "HOLD  J=0,K=0 Q=0");
    apply(1, 1); check(1, "TOGGLE 0->1      ");
    apply(1, 1); check(0, "TOGGLE 1->0      ");
    apply(1, 1); check(1, "TOGGLE 0->1      ");

    $display("=== All tests done ===");
    #10; $finish;
end

endmodule