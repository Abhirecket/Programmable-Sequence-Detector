`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 19.03.2024 14:12:13
// Design Name: 
// Module Name: programmable_sequence_detector
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


module programmable_sequence_detector #(
parameter PROG_SEQUENCE = 6'b110011,
parameter WIDTH = 6)
(
    input clk, rst, data_i,
    output detect_o
    );
reg [WIDTH-1 :0] shift_q;
wire [WIDTH-1 :0] shift_nxt;


always@(posedge clk or posedge rst)
begin
    if(rst)
        shift_q <= {WIDTH{1'b0}};
    else
        shift_q <= {shift_nxt[WIDTH-2:0] , data_i};
end
 assign shift_nxt = shift_q;
 assign detect_o = (shift_nxt == PROG_SEQUENCE);

endmodule
