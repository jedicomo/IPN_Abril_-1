/*
 * Copyright (c) 2024 JING Shuangyu
 * SPDX-License-Identifier: Apache-2.0
 */


`default_nettype none


module calculator(
    input clk,
    input rst_n,
	input [3:0] a,
	input [3:0] b,
	output reg [7:0] result
);

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			result <= 8'b0;
		else
		 	result <= a << b;
	end

endmodule
