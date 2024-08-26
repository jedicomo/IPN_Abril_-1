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
    wire _unused = &{ena, 1'b0};

    /* verilator lint_off UNUSED */
    // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe = 8'b1111_0000;
    
    wire [2:0] Enable;
    wire [7:0] SevenSegment;
    assign uo_out[7:0] = SevenSegment;
    assign uio_out[7:5] = Enable;
    assign uio_out[4] = 1'b0;
    /* verilator lint_on UNUSED */

    drive inst_drive(
        .clk(clk),
        .rst_n(rst_n),
        .en(1'b1),
        .bcd({uio_in[3:0], ui_in[7:0]}),
        .Enable(Enable),
        .SevenSegment(SevenSegment)
    );


endmodule
