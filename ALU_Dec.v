module ALU_Dec (
input OP5,
input funct7,
input [1:0] ALUOp,
input [2:0] funct3,
output reg [2:0] ALUControl
);
always@(*) begin
case(ALUOp)
2'b00:ALUControl = 3'b000; //add

2'b01: begin
case (funct3)
   3'b000 : ALUControl = 3'b010; //beq
   3'b001 : ALUControl = 3'b010; //bnq
   3'b100 : ALUControl = 3'b010; //blt
endcase
end

2'b10: begin
    case (funct3)
   3'b000 : begin
    case ({OP5 , funct7}) 
    2'b00:ALUControl = 3'b000;
    2'b01:ALUControl = 3'b000;
    2'b10:ALUControl = 3'b000;
    2'b11:ALUControl = 3'b010;
    endcase
   end
   3'b001 : ALUControl = 3'b001; 
   3'b100 : ALUControl = 3'b100; 
   3'b101 : ALUControl = 3'b101; 
   3'b110 : ALUControl = 3'b110; 
   3'b111 : ALUControl = 3'b111; 
endcase
end
default: ALUControl = 3'b000;
endcase
end
endmodule