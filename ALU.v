module alu (

  input [31:0] A ,
  input [31:0] B ,
  input [2:0] opcode ,

  output reg [31:0] out ,
  output  sign_f,
  output zero_f

);


assign zero_f = ~|out  ;
assign sign_f = out [31] ; 

always @(*) begin
    case (opcode)

    3'b000 : out = A + B ;
    3'b001 : out =  A << B ; 
    3'b010 : out = A - B ; 
    3'b100 : out = A ^ B ;
    3'b101 : out = A >> B ; 
    3'b110 : out = A | B ; 
    3'b111 : out = A & B ; 
    default  : out = 32'b0 ;

    endcase 
end 

endmodule 
        


      