module instruction_fetch;

always @(posedge clk1) 
 if (HALTED == 0) 
 begin 

 if (((EX_MEM_IR[31:26] == BEQZ) && (EX_MEM_cond == 1)) || ((EX_MEM_IR[31:26] == BNEQZ) && (EX_MEM_cond == 0))) 
 begin 
 IF_ID_IR <=  Mem[EX_MEM_ALUOut]; 
 TAKEN_BRANCH <= 1'b1; 
 IF_ID_NPC <= EX_MEM_ALUOut + 1; 
 PC <=  EX_MEM_ALUOut + 1; 
 end
 else 
 begin 
 IF_ID_IR <=  Mem[PC]; 
 IF_ID_NPC <=  PC + 1; 
 PC <=  PC + 1; 
 end 
 end
endmodule