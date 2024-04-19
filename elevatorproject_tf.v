`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:27:26 06/07/2023
// Design Name:   elevatorproject2
// Module Name:   C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2/elevatorproject_tf.v
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

module elevatorproject_tf;

	// Inputs
	reg clk;
	reg reset;
	reg [49:0] current_floor;
	reg [49:0] requested_floor;

	// Outputs
	wire [49:0] elevator_floor;

	// Instantiate the Unit Under Test (UUT)
	elevatorproject2 uut (
		.clk(clk), 
		.reset(reset), 
		.current_floor(current_floor), 
		.requested_floor(requested_floor), 
		.elevator_floor(elevator_floor)
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

        // Release reset
        #10 reset = 0;

        // Test scenario: Elevator moves from floor 0 to floor 10
        requested_floor = 30;

        // Wait for a few clock cycles
        #20;

        // Check the elevator_floor value
        $display("Elevator Floor: %d", elevator_floor);

        // Change the current_floor to simulate elevator movement
        current_floor = 11;

        // Wait for a few clock cycles
        #20;

        // Check the elevator_floor value
        $display("Elevator Floor: %d", elevator_floor);

        // Continue simulating until the elevator reaches the requested floor
        repeat (current_floor==requested_floor) 
		  begin
		  if(current_floor<requested_floor)
            current_floor = current_floor + 1;
		  else
		      current_floor = current_floor - 1;

            // Wait for a few clock cycles
            #20;

            // Check the elevator_floor value
            $display("Elevator Floor: %d", elevator_floor);
        end

        // Finish simulation
        $finish;
    end
      
endmodule

