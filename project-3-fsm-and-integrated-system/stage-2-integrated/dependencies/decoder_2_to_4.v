module decoder_2_to_4 (output wire [3:0]F, input [1:0] wrt_addr); 
 wire An, Bn, Cn;    
 
 not U0 (wrt_addrn, wrt_addr[1]);    
 not U1 (wrt_addrn2, wrt_addr[0]); 
 
 and U3 (F[0], wrt_addrn, wrt_addrn2);  
 and U4 (F[1], wrt_addrn, wrt_addr[0]); 
 and U5 (F[2], wrt_addr[1], wrt_addrn2); 
 and U6 (F[3], wrt_addr[1], wrt_addr[0]); 
 
endmodule
