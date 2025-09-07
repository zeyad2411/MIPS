module Data_mem(
input clk,
input WE,
input [31:0] A,
input [31:0] WD,
output reg [31:0] RD
);
reg [31:0] Data_mem [0:63]; // 64 x 32-bit Data memory
always @(posedge clk) begin
    if (WE) begin
     Data_mem[A[31:2]] <= WD;
    end
end

always @(*) begin
    RD = Data_mem[A[31:2]];
end
endmodule