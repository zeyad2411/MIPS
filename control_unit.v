module control_unit ( sign_flag , opcode , Zero , funct3 , funct7 , ResultSrc ,
 MemWrite , ALUSrc ,ImmSrc , RegWrite  , PCSrc , ALUControl );
input sign_flag ;
input [6:0] opcode ;
input Zero , funct7 ; 
input [2:0] funct3 ;
output  ResultSrc , MemWrite , ALUSrc  , RegWrite ;
output [1:0] ImmSrc ;

output PCSrc ;
output [2:0] ALUControl;


//internal signals 
wire Branch ;
wire [1:0] ALUOp ;
wire  OP5 ;
wire beq ; 
wire bnq ; 
wire blt ; 
wire ALUControl_int ;
reg PCSrc_in ; 




// main decoder 
main_decoder m_d ( opcode , Branch , ResultSrc ,
 MemWrite , ALUSrc ,ImmSrc , RegWrite , ALUOp ) ;

 //alu decoder 
 ALU_Dec (
 OP5,
 funct7,
 ALUOp,
 funct3,
 ALUControl_int
);



// connections 
 assign beq = Branch  & Zero ;
 assign bnq = Branch  & (~Zero) ;
 assign blt = Branch  & sign_flag ;
 assign  OP5 = opcode [5] ;
 assign ALUControl = ALUControl_int ;
 assign PCSrc =  PCSrc_in ; 



always @(*) begin

    case ( funct3 )

    3'b000 : PCSrc_in = beq ;
    3'b001 : PCSrc_in = bnq ;
    3'b100 : PCSrc_in = blt ;
    default : PCSrc_in = 0 ;
    endcase 
end


endmodule