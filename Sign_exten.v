module Sign_exten(
input [31:0] Instr,
input [1:0] ImmSrc,
output reg [31:0] ImmExt
);

always@(*) begin
    ImmExt = 32'b0;
    case (ImmSrc) 
    2'b00: ImmExt = {{20{Instr[31]}},Instr[31:20]}; 
    2'b01:
    2'b10:
    endcase
    
end

endmodule