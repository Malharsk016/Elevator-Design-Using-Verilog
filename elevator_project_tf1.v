`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:39:38 06/13/2023
// Design Name:   elevatorproject2
// Module Name:   C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2/elevator_project_tf1.v
// Project Name:  elevatorproject2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: elevatorproject2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module elevator_project_tf1;

	// Inputs
    reg clk;
    reg reset;
    reg [5:0] current_floor;
    reg [5:0] requested_floor;

    // Outputs
    wire [5:0] elevator_floor;

    // Instantiate the Unit Under Test (UUT)
    elevatorproject2 uut (
        .clk(clk),
        .reset(reset),
        .current_floor(current_floor),
        .requested_floor(requested_floor),
        .elevator_floor(elevator_floor)
    );

   initial begin
	clk=0;
	forever #1 clk=~clk;
	end

    // Stimulus
    initial begin
	 reset=1;
	 #1;
		  
         clk = 1;
			#1 reset = 0;
        // Test scenario: Elevator requested_floor
         requested_floor = 30;

        // Wait for a few clock cycles
        #30;
		  
		  if(requested_floor>50)begin
		  $display("Elevator Floor is INVALID!!!");
		  reset=1;
		  #1;
		  assign requested_floor=0;
		  $finish;
		  end
		  
		  // Change the current_floor to simulate elevator movement
         current_floor = 44;

        // Wait for a few clock cycles
        #30;
		  
				
		  

        // Finish simulation
        $finish;
    end
      
endmodule

