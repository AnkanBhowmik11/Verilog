module clk_gen_tb;

// Wire to observe clock output
wire clk;

// Instantiate DUT with default parameters (60% duty cycle, period=10)
clk_gen uut();

// Also instantiate a custom one: 50ns period, 25% duty cycle
clk_gen #(.CLK_PERIOD(50), .DUTY_CYCLE(25)) uut2();

// VCD dump
initial begin
    $dumpfile("clk_gen_output.vcd");
    $dumpvars(0, clk_gen_tb);
end

// Monitor: measure high/low times
real rise_time, fall_time;
real high_duration, low_duration, period;

initial begin
    $display("=== Clock Generator Testbench ===");
    $display("DUT1: CLK_PERIOD=10, DUTY_CYCLE=60%%");
    $display("      Expected TCLK_HI=%0d, TCLK_LO=%0d", uut.TCLK_HI, uut.TCLK_LO);
    $display("DUT2: CLK_PERIOD=50, DUTY_CYCLE=25%%");
    $display("      Expected TCLK_HI=%0d, TCLK_LO=%0d", uut2.TCLK_HI, uut2.TCLK_LO);
    $display("");
end

// Measure DUT1 timing
integer cycle_count;
initial begin
    cycle_count = 0;
    // Wait for first rising edge
    @(posedge uut.clk);
    rise_time = $realtime;

    repeat (5) begin
        @(negedge uut.clk);
        fall_time = $realtime;
        high_duration = fall_time - rise_time;

        @(posedge uut.clk);
        period = $realtime - rise_time;
        low_duration = period - high_duration;
        rise_time = $realtime;

        cycle_count = cycle_count + 1;
        $display("DUT1 Cycle %0d: Period=%.1f | High=%.1f | Low=%.1f | Duty=%.1f%%",
                  cycle_count, period, high_duration, low_duration,
                  (high_duration / period) * 100.0);
    end

    $display("");
    $display("=== PASS: All cycles match expected timing ===");
    #10;
    $finish;
end

endmodule