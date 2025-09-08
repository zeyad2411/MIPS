module main_decoder ( opcode , Branch , ResultSrc , MemWrite , ALUSrc ,ImmSrc , RegWrite , ALUOp ) ;
input [6:0] opcode ;
output Branch , ResultSrc , MemWrite , ALUSrc  , RegWrite ;
output [1:0] ImmSrc ;
output [1:0] ALUOp ;


always @(*) begin
    case (opcode)
        // loadWord = 7'b000_0011
        7'b000_0011: begin
            RegWrite   = 1;
            ImmSrc     = 2'b00;
            ALUSrc     = 1;
            MemWrite   = 0;
            ResultSrc  = 1;
            Branch     = 0;
            ALUOp      = 2'b00;
        end

        // storeWord = 7'b010_0011
        7'b010_0011: begin
            RegWrite   = 0;
            ImmSrc     = 2'b01;
            ALUSrc     = 1;
            MemWrite   = 1;
            ResultSrc  = 1'bx;
            Branch     = 0;
            ALUOp      = 2'b00;
        end

        // R-Type = 7'b011_0011
        7'b011_0011: begin
            RegWrite   = 1;
            ImmSrc     = 2'bxx;  // don't care
            ALUSrc     = 0;
            MemWrite   = 0;
            ResultSrc  = 0;
            Branch     = 0;
            ALUOp      = 2'b10;
        end

        // I-Type = 7'b001_0011
        7'b001_0011: begin
            RegWrite   = 1;
            ImmSrc     = 2'b00;
            ALUSrc     = 1;
            MemWrite   = 0;
            ResultSrc  = 0;
            Branch     = 0;
            ALUOp      = 2'b10;
        end

        // Branch = 7'b110_0011
        7'b110_0011: begin
            RegWrite   = 0;
            ImmSrc     = 2'b10;
            ALUSrc     = 0;
            MemWrite   = 0;
            ResultSrc  = 1'bx;
            Branch     = 1;
            ALUOp      = 2'b01;
        end

        // Default
        default: begin
            RegWrite   = 0;
            ImmSrc     = 2'b00;
            ALUSrc     = 0;
            MemWrite   = 0;
            ResultSrc  = 0;
            Branch     = 0;
            ALUOp      = 2'b00;
        end
    endcase
end


endmodule 

