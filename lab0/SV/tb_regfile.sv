module stimulus ();

   logic clock;
   logic writeEnable3;
   logic [4:0] readAddress1, readAddress2, writeAddress3;
   logic [31:0] writeData3, readData1, readData2;

   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   regfile dut (clock, writeEnable3, readAddress1, readAddress2, writeAddress3, writeData3, readData1, readData2);

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clock = 1'b1;
	forever #1 clock = ~clock;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("test.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b", writeEnable3);
     end   
   


   initial 
     begin      
	
    #3 writeEnable3 = 1'b1;

    #0 writeAddress3 = 1'b1;
    #0 writeData3 = 5'b11001;
    #0 readAddress1 = 1'b1;

 
    #5 writeAddress3 = 2'b10;
    #0 writeData3 = 3'b111;
    #0 readAddress1 = 2'b10;
    #0 readAddress2 = 2'b10;     

    #3 writeEnable3 = 1'b0;
    #5 writeAddress3 = 1'b10;
    #0 writeData3 = 5'b11111;
    #0 readAddress1 = 1'b10;
    




     end

endmodule // stimulus


