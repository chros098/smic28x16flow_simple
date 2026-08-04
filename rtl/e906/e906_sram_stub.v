// E906 SRAM array stubs - GDS-only logic flow.
// All cache/BHT arrays are replaced with constant-zero outputs so that the
// synthesized netlist contains NO SRAM macros and NO register-file flops.
// The cache controller logic around them is kept.

`define E906_SRAM_STUB(NAME) \
module NAME(A, CEN, CLK, D, GWEN, Q, WEN); \
  input [31:0] A; \
  input CEN; \
  input CLK; \
  input [63:0] D; \
  input GWEN; \
  input [63:0] WEN; \
  output [63:0] Q; \
  assign Q = 64'b0; \
endmodule

`E906_SRAM_STUB(pa_spsram_32x4)
`E906_SRAM_STUB(pa_spsram_64x4)
`E906_SRAM_STUB(pa_spsram_128x4)
`E906_SRAM_STUB(pa_spsram_256x4)
`E906_SRAM_STUB(pa_spsram_512x4)
`E906_SRAM_STUB(pa_spsram_1024x4)
`E906_SRAM_STUB(pa_spsram_128x32)
`E906_SRAM_STUB(pa_spsram_256x32)
`E906_SRAM_STUB(pa_spsram_512x32)
`E906_SRAM_STUB(pa_spsram_1024x32)
`E906_SRAM_STUB(pa_spsram_2048x32)
`E906_SRAM_STUB(pa_spsram_4096x32)
`E906_SRAM_STUB(pa_spsram_8192x32)
`E906_SRAM_STUB(pa_spsram_32x46)
`E906_SRAM_STUB(pa_spsram_64x44)
`E906_SRAM_STUB(pa_spsram_128x42)
`E906_SRAM_STUB(pa_spsram_256x40)
`E906_SRAM_STUB(pa_spsram_512x38)
`E906_SRAM_STUB(pa_spsram_1024x36)
`E906_SRAM_STUB(pa_spsram_32x47)
`E906_SRAM_STUB(pa_spsram_64x45)
`E906_SRAM_STUB(pa_spsram_128x43)
`E906_SRAM_STUB(pa_spsram_256x41)
`E906_SRAM_STUB(pa_spsram_512x39)
`E906_SRAM_STUB(pa_spsram_1024x37)
`E906_SRAM_STUB(pa_spsram_128x16)
`E906_SRAM_STUB(pa_spsram_256x16)
`E906_SRAM_STUB(pa_spsram_512x16)
`E906_SRAM_STUB(pa_spsram_1024x16)

`undef E906_SRAM_STUB
