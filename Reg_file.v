module reg_file ( clk , rst_n , WE, A1 , A2 , A3 , WD3 , RD1 , RD2 ) ;
    input clk ;
    input  rst_n; 
    input WE ; 
    input  [4:0] A1 , A2 , A3 ; 
    input  [31:0] WD3 ;
    output [31:0] RD1 , RD2  ;

    

reg  [31:0] regs [31:0] ;


assign RD1 = regs [A1] ;
assign RD2 = regs [A2] ;

always @(posedge clk or negedge rst_n) begin
    
    if (!rst_n) begin
         regs [0] <= 32'b0 ;
         regs [1] <= 32'b0 ;
         regs [2] <= 32'b0 ;
         regs [3] <= 32'b0 ;
         regs [4] <= 32'b0 ;
         regs [5] <= 32'b0 ;
         regs [6] <= 32'b0 ;
         regs [7] <= 32'b0 ;
         regs [8] <= 32'b0 ;
         regs [9] <= 32'b0 ;
         regs [10] <= 32'b0 ;
         regs [11] <= 32'b0 ;
         regs [12] <= 32'b0 ;
         regs [13] <= 32'b0 ;
         regs [14] <= 32'b0 ;
         regs [15] <= 32'b0 ;
         regs [16] <= 32'b0 ;
         regs [17] <= 32'b0 ;
         regs [18] <= 32'b0 ;
         regs [19] <= 32'b0 ;
         regs [20] <= 32'b0 ;
         regs [21] <= 32'b0 ;
         regs [22] <= 32'b0 ;
         regs [23] <= 32'b0 ;
         regs [24] <= 32'b0 ;
         regs [25] <= 32'b0 ;
         regs [26] <= 32'b0 ;
         regs [27] <= 32'b0 ;
         regs [28] <= 32'b0 ;
         regs [29] <= 32'b0 ;
         regs [30] <= 32'b0 ;
         regs [31] <= 32'b0 ;
         
    end else if (WE) begin 
        regs [A3] <= WD3 ;
    end 
    
end


endmodule