module Wrapper();

wire clk;
wire areset; //reset of the PC
wire load; //load of the PC 
wire [31:0] PCPlus4 ,PCTarget , PCNext , PC , Instr;
wire [6:0] OP;
wire [2:0] funct3;
wire funct7;
wire zero_f;
wire sign_f;
wire PCSrc;
wire ResultSrc;
wire MemWrite;
wire [2:0] ALUControl;
wire ALUSrc;
wire [1:0] ImmSrc;
wire RegWrite;
wire [4:0] A1 , A2 , A3;
wire [31:0] Result;
wire [31:0] SrcA , SrcB , ALUResult;
wire [31:0] WriteData;
wire [31:0] ImmExt;
wire [31:0] ReadData;
wire [31:0] RD1 , RD2;

// Implmenting MUX's
assign PCNext = (PCSrc)? PCTarget: PCPlus4;
assign Result = (ResultSrc)? ReadData: ALUResult;
assign SrcB   = (ALUSrc)? ImmExt:RD2;

// PC instantiation
prog_counter PC(
.clk(clk),
.areset(areset),
.load(load),
.PCNext(PCNext),
.PC(PC)
);

// Instruction memory instantiation
Instruction_memory IM (
    .A(PC),       // Address from PC
    .RD(Instr)       // Instruction
);

//






assign OP = Innstr[6:0];
assign funct3 = Instr[14:12];
assign funct7 = Instr[30];
assign A1 = Instr[19:15];
assign A2 = Instr[24:20];
assign A3 = Instr[11:7];
assign SrcA = RD1;
assign WriteData = RD2; 
endmodule