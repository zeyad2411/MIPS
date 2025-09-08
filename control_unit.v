module control_unit ( opcode , Zero , funct3 , funct7 , ResultSrc ,
 MemWrite , ALUSrc ,ImmSrc , RegWrite  , PCSrc , ALUControl );

input [6:0] opcode ;
input Zero , funct7 ; 
input [2:0] funct7 ;
output  ResultSrc , MemWrite , ALUSrc  , RegWrite ;
output [1:0] ImmSrc ;

output PCSrc ;
output [2:0] ALUControl;


//internal signals 
wire Branch ;
wire [1:0] ALUOp ;

// main decoder 
main_decoder m_d ( opcode , Branch , ResultSrc ,
 MemWrite , ALUSrc ,ImmSrc , RegWrite , ALUOp ) ;

 //alu decoder 
 



// connections 
 assign PCSrc = Branch  & Zero ;
