module alu_tb  ; 

reg [31:0] a,b ; 
reg [2:0] opc ;
wire [31:0] out ; 
wire z_f , s_f ; 


alu dut (

    a ,
    b, 
    opc,
    out ,
    s_f ,
    z_f 

);



initial begin 
    
    repeat (20) begin 

        a = $urandom_range (20 , 50) ;
        b = $urandom_range (1 , 20)  ;
        opc  =  $random ; 
        
        #5 ;
        $display ("a= %0d , b= %0d  ,  opc = %0d , out = %0d , z_f = %0d s_f = %0d "  , a , b, opc , out , z_f , s_f); 

    end 


end 

endmodule 
