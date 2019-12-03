module HelloWorld (input wire clk, output wire LED); // The LED output.

reg [31:0] count; // 32 Bit counter

initial begin // Initialization like setup() in arduino

count <= 32'h00000000;	// Set count to be 0

end

always @ (posedge clk) begin // main loop()

count <= count + 1; // Increment

end

assign LED = count[24]; // Assign LED to be 25th bit.

endmodule