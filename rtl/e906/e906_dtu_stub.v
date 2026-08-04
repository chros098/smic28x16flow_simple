// DTU (debug trigger unit) stub only (HPC kept).
// GDS-only logic flow: constant-zero outputs.

module pa_dtu_top(
  bmu_dtu_debug_info,
  cp0_dtu_addr,
  cp0_dtu_debug_info,
  cp0_dtu_icg_en,
  cp0_dtu_int_id,
  cp0_dtu_mexpt_vld,
  cp0_dtu_pcfifo_frz,
  cp0_dtu_rreg,
  cp0_dtu_wdata,
  cp0_dtu_wreg,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  dahbl_dtu_debug_info,
  forever_cpuclk,
  fpu_dtu_debug_info,
  iahbl_dtu_debug_info,
  idu_dtu_debug_info,
  idu_dtu_fpr_info,
  idu_yy_xx_tail_ack,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_debug_info,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  iu_dtu_debug_info,
  lsu_dtu_debug_info,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  lsu_dtu_ldst_type,
  lsu_dtu_mem_access_size,
  pad_yy_icg_scan_en,
  rtu_dtu_debug_info,
  rtu_dtu_dpc,
  rtu_dtu_halt_ack,
  rtu_dtu_nmi_pending,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_chgflw,
  rtu_dtu_retire_debug_expt_vld,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_next_pc,
  rtu_dtu_retire_vld,
  rtu_dtu_tval,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  sahbl_dtu_debug_info,
  sys_apb_clk,
  sys_apb_rst_b,
  tdt_dm_dtu_ack_havereset,
  tdt_dm_dtu_async_halt_req,
  tdt_dm_dtu_halt_on_reset,
  tdt_dm_dtu_halt_req,
  tdt_dm_dtu_itr,
  tdt_dm_dtu_itr_vld,
  tdt_dm_dtu_resume_req,
  tdt_dm_dtu_wdata,
  tdt_dm_dtu_wr_flg,
  tdt_dm_dtu_wr_vld,
  dtu_cp0_dcsr_mprven,
  dtu_cp0_dcsr_prv,
  dtu_cp0_rdata,
  dtu_cp0_wake_up,
  dtu_hpcp_dcsr_stopcount,
  dtu_ifu_debug_inst,
  dtu_ifu_debug_inst_vld,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_ifu_halt_on_reset,
  dtu_lsu_addr_trig_en,
  dtu_lsu_data_trig_en,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  dtu_rtu_async_halt_req,
  dtu_rtu_dpc,
  dtu_rtu_ebreak_action,
  dtu_rtu_int_mask,
  dtu_rtu_pending_tval,
  dtu_rtu_resume_req,
  dtu_rtu_step_en,
  dtu_rtu_sync_flush,
  dtu_rtu_sync_halt_req,
  dtu_tdt_dm_halted,
  dtu_tdt_dm_havereset,
  dtu_tdt_dm_itr_done,
  dtu_tdt_dm_retire_debug_expt_vld,
  dtu_tdt_dm_rx_data,
  dtu_tdt_dm_wr_ready,
);
  input [3 :0] bmu_dtu_debug_info;
  input [11:0] cp0_dtu_addr;
  input [5 :0] cp0_dtu_debug_info;
  input cp0_dtu_icg_en;
  input [11:0] cp0_dtu_int_id;
  input cp0_dtu_mexpt_vld;
  input cp0_dtu_pcfifo_frz;
  input cp0_dtu_rreg;
  input [31:0] cp0_dtu_wdata;
  input cp0_dtu_wreg;
  input cp0_yy_clk_en;
  input [1 :0] cp0_yy_priv_mode;
  input cpurst_b;
  input [10:0] dahbl_dtu_debug_info;
  input forever_cpuclk;
  input [7 :0] fpu_dtu_debug_info;
  input [10:0] iahbl_dtu_debug_info;
  input [21:0] idu_dtu_debug_info;
  input [95:0] idu_dtu_fpr_info;
  input idu_yy_xx_tail_ack;
  input ifu_dtu_addr_vld0;
  input ifu_dtu_addr_vld1;
  input ifu_dtu_data_vld0;
  input ifu_dtu_data_vld1;
  input [26:0] ifu_dtu_debug_info;
  input [31:0] ifu_dtu_exe_addr0;
  input [31:0] ifu_dtu_exe_addr1;
  input [31:0] ifu_dtu_exe_data0;
  input [31:0] ifu_dtu_exe_data1;
  input [8 :0] iu_dtu_debug_info;
  input [78:0] lsu_dtu_debug_info;
  input [14:0] lsu_dtu_halt_info;
  input lsu_dtu_last_check;
  input [31:0] lsu_dtu_ldst_addr;
  input lsu_dtu_ldst_addr_vld;
  input [7 :0] lsu_dtu_ldst_bytes_vld;
  input [31:0] lsu_dtu_ldst_data;
  input lsu_dtu_ldst_data_vld;
  input [1 :0] lsu_dtu_ldst_type;
  input [1 :0] lsu_dtu_mem_access_size;
  input pad_yy_icg_scan_en;
  input [13:0] rtu_dtu_debug_info;
  input [31:0] rtu_dtu_dpc;
  input rtu_dtu_halt_ack;
  input rtu_dtu_nmi_pending;
  input rtu_dtu_pending_ack;
  input rtu_dtu_retire_chgflw;
  input rtu_dtu_retire_debug_expt_vld;
  input [14:0] rtu_dtu_retire_halt_info;
  input rtu_dtu_retire_mret;
  input [31:0] rtu_dtu_retire_next_pc;
  input rtu_dtu_retire_vld;
  input [31:0] rtu_dtu_tval;
  input rtu_yy_xx_dbgon;
  input rtu_yy_xx_expt_int;
  input [11:0] rtu_yy_xx_expt_vec;
  input rtu_yy_xx_expt_vld;
  input [10:0] sahbl_dtu_debug_info;
  input sys_apb_clk;
  input sys_apb_rst_b;
  input tdt_dm_dtu_ack_havereset;
  input tdt_dm_dtu_async_halt_req;
  input tdt_dm_dtu_halt_on_reset;
  input tdt_dm_dtu_halt_req;
  input [31:0] tdt_dm_dtu_itr;
  input tdt_dm_dtu_itr_vld;
  input tdt_dm_dtu_resume_req;
  input [31:0] tdt_dm_dtu_wdata;
  input [1 :0] tdt_dm_dtu_wr_flg;
  input tdt_dm_dtu_wr_vld;
  output dtu_cp0_dcsr_mprven;
  output [1 :0] dtu_cp0_dcsr_prv;
  output [31:0] dtu_cp0_rdata;
  output dtu_cp0_wake_up;
  output dtu_hpcp_dcsr_stopcount;
  output [31:0] dtu_ifu_debug_inst;
  output dtu_ifu_debug_inst_vld;
  output [14:0] dtu_ifu_halt_info0;
  output [14:0] dtu_ifu_halt_info1;
  output dtu_ifu_halt_info_vld;
  output dtu_ifu_halt_on_reset;
  output dtu_lsu_addr_trig_en;
  output dtu_lsu_data_trig_en;
  output [14:0] dtu_lsu_halt_info;
  output dtu_lsu_halt_info_vld;
  output dtu_rtu_async_halt_req;
  output [31:0] dtu_rtu_dpc;
  output dtu_rtu_ebreak_action;
  output dtu_rtu_int_mask;
  output [31:0] dtu_rtu_pending_tval;
  output dtu_rtu_resume_req;
  output dtu_rtu_step_en;
  output dtu_rtu_sync_flush;
  output dtu_rtu_sync_halt_req;
  output dtu_tdt_dm_halted;
  output dtu_tdt_dm_havereset;
  output dtu_tdt_dm_itr_done;
  output dtu_tdt_dm_retire_debug_expt_vld;
  output [31:0] dtu_tdt_dm_rx_data;
  output dtu_tdt_dm_wr_ready;
  assign dtu_cp0_dcsr_mprven = 1'b0;
  assign dtu_cp0_dcsr_prv = 2'b0;
  assign dtu_cp0_rdata = 32'b0;
  assign dtu_cp0_wake_up = 1'b0;
  assign dtu_hpcp_dcsr_stopcount = 1'b0;
  assign dtu_ifu_debug_inst = 32'b0;
  assign dtu_ifu_debug_inst_vld = 1'b0;
  assign dtu_ifu_halt_info0 = 15'b0;
  assign dtu_ifu_halt_info1 = 15'b0;
  assign dtu_ifu_halt_info_vld = 1'b0;
  assign dtu_ifu_halt_on_reset = 1'b0;
  assign dtu_lsu_addr_trig_en = 1'b0;
  assign dtu_lsu_data_trig_en = 1'b0;
  assign dtu_lsu_halt_info = 15'b0;
  assign dtu_lsu_halt_info_vld = 1'b0;
  assign dtu_rtu_async_halt_req = 1'b0;
  assign dtu_rtu_dpc = 32'b0;
  assign dtu_rtu_ebreak_action = 1'b0;
  assign dtu_rtu_int_mask = 1'b0;
  assign dtu_rtu_pending_tval = 32'b0;
  assign dtu_rtu_resume_req = 1'b0;
  assign dtu_rtu_step_en = 1'b0;
  assign dtu_rtu_sync_flush = 1'b0;
  assign dtu_rtu_sync_halt_req = 1'b0;
  assign dtu_tdt_dm_halted = 1'b0;
  assign dtu_tdt_dm_havereset = 1'b0;
  assign dtu_tdt_dm_itr_done = 1'b0;
  assign dtu_tdt_dm_retire_debug_expt_vld = 1'b0;
  assign dtu_tdt_dm_rx_data = 32'b0;
  assign dtu_tdt_dm_wr_ready = 1'b0;
endmodule
