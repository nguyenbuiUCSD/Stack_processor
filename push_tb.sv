// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// test bench for push instruction
module push_tb;

logic clk, reset;					 	  // to design
wire  done;							 	  // from design

top t1(.*);	                              // shorthand for .clk(clk),.reset(reset),done

always begin					          // clock generator -- arbitrarily set to 10ns period 
  clk = 1'b0;
  #5ns clk = 1'b1;
  #5ns;
end

initial begin
  reset = 'b1;
  #10ns    reset = 'b0;					  // release reset -- start operation
  #200ns $display("no done received");  // safety stop if no done flag generated
           $stop;						  //   regard as error condition
end

initial begin
  #20ns wait(done); 						      // watch for done flag from DUT
  #10ns $stop;
end
endmodule
