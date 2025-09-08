module prog_counter(
input clk,
input areset,
input load,
input [31:0] PCNext,
output reg [31:0] PC
);

always @(posedge clk or negedge areset) begin
 if (!areset) begin
    PC <= 32'b0;
 end
 else begin
    if (load) begin
        PC <= PCNext;
    end
 end
end
endmodule