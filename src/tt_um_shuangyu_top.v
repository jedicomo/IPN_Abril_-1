/*
 * Copyright (c) 2024 JING Shuangyu
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none


module tt_um_shuangyu_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


    // List all unused inputs to prevent warnings
    wire _unused = &{ena, ui_in[7:5], uio_in[7:0], 1'b0};

    // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe = 8'b1111_1111;
    assign uio_out[7:0] = {6'b0, display[9:8]};
    assign uo_out[7:0] = result[7:0];
    wire [9:0] display;

    calculator inst_calculator(
        .clk(clk),
        .rst_n(rst_n),
        .key_pressed(ui_in[4]),
        .keypad_out(ui_in[3:0]),
        .reg_display(display)
    );


endmodule
