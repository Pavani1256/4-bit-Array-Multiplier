`timescale 1ns/1ps

module tb_mult;

    // Testbench signals
    reg        clk;
    reg        rst_n;
    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] p;

    integer i;
    integer j;
    integer errors;
    reg [7:0] expected;

    // ------------------------------------------------
    // Instantiate the multiplier
    // ------------------------------------------------
    mult_array dut (
        .clk  (clk),
        .rst_n(rst_n),
        .a    (a),
        .b    (b),
        .p    (p)
    );

    // ------------------------------------------------
    // 10 ns clock
    // ------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // ------------------------------------------------
    // Waveform generation
    // ------------------------------------------------
    initial begin
        $dumpfile("mult.vcd");
        $dumpvars(0, tb_mult);
    end

    // ------------------------------------------------
    // Test
    // ------------------------------------------------
    initial begin
        errors = 0;
        a = 4'b0000;
        b = 4'b0000;
        rst_n = 1'b0;

        // Hold reset low for 2 clock cycles
        repeat (2) @(posedge clk);

        // Release reset
        rst_n = 1'b1;

        // Test all 256 input combinations
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin

                // Apply inputs
                a = i;
                b = j;

                // Expected result
                expected = i * j;

                // Wait for 2-cycle latency
                @(posedge clk);
                @(posedge clk);
                @(negedge clk);   // Sample after the registered output has updated

                if (p !== expected) begin
                    $display(
                        "MISMATCH: a=%0d b=%0d expected=%0d got=%0d",
                        i, j, expected, p
                    );
                    errors = errors + 1;
                end
            end
        end

        // Exactly one summary line
        if (errors == 0)
            $display("PASS: 256 vectors checked, 0 errors");
        else
            $display("FAIL: 256 vectors checked, %0d errors", errors);

        $finish;
    end

endmodule