// Clock-gate placeholder for GDS-only flow: clock passes through ungated.
// (Power gating is intentionally ignored; no timing requirements.)
module OPENROAD_CLKGATE (
  input  CK,
  input  E,
  output GCK
);
  assign GCK = CK;
endmodule
