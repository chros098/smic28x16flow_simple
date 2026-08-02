////////////////////////////////////////////////////////////
// Behavioral SRAM models for Rocket TinyConfig black boxes
// (equivalent to rocket-chip generated *.behav_srams.v)
// Used when synthesis should target std cells only (no macros).
// Ports are copied 1:1 from the instantiations in
// freechips.rocketchip.system.TinyConfig.v
////////////////////////////////////////////////////////////

// D$ data array: 64 x 32 bit, byte write mask
// NOTE: byte-masked partial writes are intentionally NOT modeled.
// Older Yosys versions hit an internal assertion (mem.cc:
// "port.en == State::S1") on such part-select write ports.
// For this GDS-only flow the write mask is ignored (whole-word write);
// use a real SRAM macro if byte-enable semantics are required.
module data_arrays_0_ext (
  input  [5:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [31:0] RW0_wdata,
  output [31:0] RW0_rdata,
  input  [3:0]  RW0_wmask
);
  reg [31:0] mem [0:63];

  always @(posedge RW0_clk) begin
    if (RW0_en && RW0_wmode)
      mem[RW0_addr] <= RW0_wdata;
  end

  assign RW0_rdata = mem[RW0_addr];
endmodule

// I$ data array: 64 x 32 bit, full-word write
module data_arrays_0_0_ext (
  input  [5:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [31:0] RW0_wdata,
  output [31:0] RW0_rdata,
  input         RW0_wmask
);
  reg [31:0] mem [0:63];

  always @(posedge RW0_clk) begin
    if (RW0_en && RW0_wmode && RW0_wmask)
      mem[RW0_addr] <= RW0_wdata;
  end

  assign RW0_rdata = mem[RW0_addr];
endmodule

// tag array: 4 x 25 bit, full-word write
module tag_array_ext (
  input  [1:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [24:0] RW0_wdata,
  output [24:0] RW0_rdata,
  input         RW0_wmask
);
  reg [24:0] mem [0:3];

  always @(posedge RW0_clk) begin
    if (RW0_en && RW0_wmode && RW0_wmask)
      mem[RW0_addr] <= RW0_wdata;
  end

  assign RW0_rdata = mem[RW0_addr];
endmodule
