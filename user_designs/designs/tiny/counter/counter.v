// SPDX-FileCopyrightText: © 2026 FABulous Contributors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module counter (
    input  wire       clk1,
    input  wire       rst,
    input  wire       ena,
    
    output wire [14:0] d
);

    reg [14:0] ctr1;

    // Reset before enable
    always @(posedge clk1) begin
        if (rst) begin
            ctr1 <= '0;
        end else begin
            if (ena) begin
                ctr1 <= ctr1 + 1'b1;
            end
        end
    end

    // Enable before reset
    /*always @(posedge clk1_buf) begin
        if (ena) begin
            if (rst) begin
                ctr1 <= '0;
            end else begin
                ctr1 <= ctr1 + 1'b1;
            end
        end
    end*/

    assign d = ctr1;

endmodule
