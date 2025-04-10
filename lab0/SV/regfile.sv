module regfile (input logic clk, input logic we3, input logic [4:0] ra1, ra2, wa3, input logic [31:0] wd3, output logic [31:0] rd1, rd2);
   
   logic [31:0] rf[31:0];
   
   //clk = clock || we3 = write enable 3 || ra1, ra2 = read address 1, 2 || wa3 = write address 3 || wd3 = write data 3 (write port) || rd1, rd2 = read data 1, 2 (read ports)



   //only on posedge of clock, if write enable is HIGH, write data onto write address in register file
   always_ff @(posedge clk)
      if (we3 && (wa3 != 0)) rf[wa3] <= wd3;
   


   //if read address 1 is not 0, then read data 1 = the data at address ra1 (rf[ra1])
   assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
   
   

   //if read address 2 is not 0, then read data 2 = the data at address ra2 (rf[ra2])
   assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
   
   // three ported register file
   // read two ports combinationally 
   // write third port on rising edge of clock 
   // register 0 hardwired to 0 
   
   
endmodule // regfile
