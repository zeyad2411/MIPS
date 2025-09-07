module instruction_memory (
    input  [31:0] A,       // Address from PC
    output [31:0] RD       // Instruction
);

    reg [31:0] Inst_mem [0:63]; // 64 x 32-bit instruction memory 

    always@(A) begin
        $readmemh("program.mem", ROM);
    end

    assign RD = ROM[A[31:2]];  // Word-aligned access

endmodule
