// SPDX-FileCopyrightText: © 2026 FABulous Contributors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module shift_reg #(
    parameter BITS = 128
)(
    input  wire       clk1,
    input  wire       rst,
    input  wire       ena,
    
    input  wire       a,
    output wire       b
);

    logic [BITS-1:0] shift_data;

    always_ff @(posedge clk1) begin
        if (rst) begin
            shift_data <= '0;
        end else begin
            if (ena) begin
                shift_data <= {shift_data[BITS-2:0], a};
            end
        end
    end
    
    assign b = shift_data[BITS-1];

endmodule
