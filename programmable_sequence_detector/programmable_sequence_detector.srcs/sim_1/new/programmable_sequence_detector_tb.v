`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 19.03.2024 14:12:32
// Design Name: 
// Module Name: programmable_sequence_detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module programmable_sequence_detector_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk, rst, data_i;

    // Outputs
    wire detect_o;

    // Instantiate the module under test
    programmable_sequence_detector #(
        .PROG_SEQUENCE(6'b110011),  // Example sequence
        .WIDTH(6)                   // Example width
    ) dut (
        .clk(clk),
        .rst(rst),
        .data_i(data_i),
        .detect_o(detect_o)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initializations
    initial begin
        // Initialize inputs
        clk = 1;
        rst = 1;
        data_i = 0;

        // Reset sequence
        #100 rst = 0;

        // Test scenario 1: Sequence detected
        #10 data_i = 1;
        #10 data_i = 1;
        #10 data_i = 0;
        #10 data_i = 0;
        #10 data_i = 1;
        #10 data_i = 1;

        // Test scenario 2: Sequence not detected
        #10 data_i = 0;
        #10 data_i = 0;
        #10 data_i = 1;
        #10 data_i = 1;
        #10 data_i = 1;
        #10 data_i = 1;

        // Finish simulation
        #100 $finish;
    end

endmodule

