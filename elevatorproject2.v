`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:19 06/07/2023 
// Design Name: 
// Module Name:    elevatorproject2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module elevatorproject2 (
    input clk,
    input reset,
    input wire [5:0] current_floor,
    input wire [5:0] requested_floor,
    output reg [5:0] elevator_floor
);

    reg [1:0] door_open;     // Register to track door status (0 = closed, 1 = open)
    reg [1:0] state;         // Register to track elevator state

    parameter FLOOR_COUNT = 50;     // Total number of floors in the building
    parameter STABLE = 2'b00;       // State indicating elevator is stable
    parameter MOVE_UP = 2'b01;      // State indicating elevator is moving up
    parameter MOVE_DOWN = 2'b10;    // State indicating elevator is moving down

  
    // Elevator control process
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the elevator to initial state
            elevator_floor <= 0;
            door_open <= 1'b0;
            state <= STABLE;
        end else begin
            // Handle elevator state transitions
            case (state)
                STABLE: begin
                    if (current_floor != requested_floor) begin
                        elevator_floor <= current_floor;
                        if (current_floor < requested_floor)
                            state <= MOVE_UP;
                        else
                            state <= MOVE_DOWN;
                    end
                end
                MOVE_UP: begin
                    if (current_floor == requested_floor)begin
                        state <= STABLE;
								 door_open <= 1'b1; 
								 end
                    else if (current_floor < requested_floor)
                        elevator_floor <= elevator_floor + 1;
								else
								 door_open <= 1'b0;
                end
                MOVE_DOWN: begin
                    if (current_floor == requested_floor)begin
                        state <= STABLE;
								 door_open <= 1'b1;
                        end					  
                    else if (current_floor > requested_floor)
                        elevator_floor <= elevator_floor - 1;
								else
                    door_open <= 1'b0;
                end
            endcase
        end
    end

endmodule
