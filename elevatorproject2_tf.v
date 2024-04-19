`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:25:24 06/07/2023
// Design Name:   elevatorproject2
// Module Name:   C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2/elevatorproject2_tf.v
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

module elevatorproject2_tf;

	// Inputs
	reg [49:0] requested_floor;
	reg [49:0] current_floor;
	reg reset;
	reg clk;

	// Outputs
	wire [49:0] elevator_floor;

	// Instantiate the Unit Under Test (UUT)
	elevatorproject2 uut (
		.elevator_floor(elevator_floor), 
		.requested_floor(requested_floor), 
		.current_floor(current_floor), 
		.reset(reset), 
		.clk(clk)
	);
		
		// Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        clk = 0;
        reset = 1;
        current_floor = 0;
        requested_floor = 0;
        
		// Add stimulus here
		// Release reset
        #10 reset = 0;

        // Test scenario: Elevator requested_floor
        requested_floor = 8;

        // Wait for a few clock cycles
        #20;
		  // Change the current_floor to simulate elevator movement
        current_floor = 11;

        // Wait for a few clock cycles
        #20;
        repeat (current_floor==requested_floor) 
		  begin
		  if(current_floor<requested_floor)
            current_floor = current_floor + 1;
		  else
		  if(current_floor>requested_floor)
		      current_floor = current_floor - 1;

            // Wait for a few clock cycles
            #20;

            // Check the elevator_floor value
            $display("Elevator Floor: %d", elevator_floor);
        end
		  end
      
endmodule

