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


  // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  // assign uio_oe  = 0;

  wire [7:0] SevenSegment;  
  assign ou_out[0] = SevenSegment[0];  //A
  assign ou_out[1] = SevenSegment[1];  //B
  assign ou_out[2] = SevenSegment[2];  //C
  assign ou_out[3] = SevenSegment[3];  //D
  assign ou_out[4] = SevenSegment[4];  //E
  assign ou_out[5] = SevenSegment[5];  //F
  assign ou_out[6] = SevenSegment[6];  //G
  assign ou_out[7] = SevenSegment[7];  //dp

  wire [3:0] Enable;
  assign uio_out[0] = Enable[0];
  assign uio_out[1] = Enable[1];
  assign uio_out[2] = Enable[2];
  assign uio_out[3] = Enable[3];

  wire [4:0] IO_P4_COL;
  assign uio_out[5] = IO_P4_COL[0];
  assign uio_out[6] = IO_P4_COL[1];
  assign uio_out[7] = IO_P4_COL[2];
  assign uio_out[8] = IO_P4_COL[3];
 
    
  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7:4], 1'b0};

  calculator_top inst_calculator(
      .clk(clk),
      .rst_n(rst_n),
      .IO_P4_ROW(ui_in[3:0]),
      .IO_P4_COL(IO_P4_COL),
      .Enable(Enable),
      .SevenSegment(SevenSegment)
  );

    
endmodule
