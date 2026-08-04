// Real SMIC40 clock-gating cells for E906.
// Every `gated_clk_cell` instance (182 total) and the single `BUFGCE`
// instance is mapped to the foundry integrated clock-gating cell
// CLKLAHQV4_12TL40 (latch + AND, with scan/test enable TE).
// CLKLAHQV4_12TL40 is declared as a blackbox only to satisfy Yosys's
// hierarchy check; write_verilog -noattr emits it as a plain instance
// without a module declaration, exactly like the other .lib cells.

(* blackbox *)
module CLKLAHQV4_12TL40(
  CK,
  E,
  TE,
  Q
);

input  CK;
input  E;
input  TE;
output Q;

endmodule

module gated_clk_cell(
  clk_in,
  global_en,
  module_en,
  local_en,
  external_en,
  pad_yy_icg_scan_en,
  clk_out
);

input  clk_in;
input  global_en;
input  module_en;
input  local_en;
input  external_en;
input  pad_yy_icg_scan_en;
output clk_out;

wire clk_en;

assign clk_en = (global_en && (module_en || local_en)) || external_en;

CLKLAHQV4_12TL40 x_icg (
  .CK (clk_in),
  .E  (clk_en),
  .TE (pad_yy_icg_scan_en),
  .Q  (clk_out)
);

endmodule

module BUFGCE(
  I,
  CE,
  O
);

input  I;
input  CE;
output O;

CLKLAHQV4_12TL40 x_icg (
  .CK (I),
  .E  (CE),
  .TE (1'b0),
  .Q  (O)
);

endmodule
