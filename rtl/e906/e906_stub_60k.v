// E906 tier-60k stubs (GDS-only flow). Constant-zero outputs.

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

module pa_hpcp_top(
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_hpcp_wdata,
  cp0_hpcp_wreg,
  cp0_yy_priv_mode,
  cpurst_b,
  dtu_hpcp_dcsr_stopcount,
  forever_cpuclk,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  iu_hpcp_inst_bht_mispred,
  iu_hpcp_inst_condbr,
  iu_hpcp_inst_condbr_gate,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_access_gate,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_read_miss_gate,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_access_gate,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_cache_write_miss_gate,
  lsu_hpcp_inst_store,
  lsu_hpcp_inst_store_gate,
  pad_yy_icg_scan_en,
  rtu_hpcp_retire_inst_vld,
  rtu_yy_xx_dbgon,
  sysio_hpcp_time,
  hpcp_cp0_data,
);
  input cp0_hpcp_icg_en;
  input [11:0] cp0_hpcp_index;
  input cp0_hpcp_pmdm;
  input cp0_hpcp_pmdu;
  input [31:0] cp0_hpcp_wdata;
  input cp0_hpcp_wreg;
  input [1 :0] cp0_yy_priv_mode;
  input cpurst_b;
  input dtu_hpcp_dcsr_stopcount;
  input forever_cpuclk;
  input ifu_hpcp_icache_access;
  input ifu_hpcp_icache_miss;
  input iu_hpcp_inst_bht_mispred;
  input iu_hpcp_inst_condbr;
  input iu_hpcp_inst_condbr_gate;
  input lsu_hpcp_cache_read_access;
  input lsu_hpcp_cache_read_access_gate;
  input lsu_hpcp_cache_read_miss;
  input lsu_hpcp_cache_read_miss_gate;
  input lsu_hpcp_cache_write_access;
  input lsu_hpcp_cache_write_access_gate;
  input lsu_hpcp_cache_write_miss;
  input lsu_hpcp_cache_write_miss_gate;
  input lsu_hpcp_inst_store;
  input lsu_hpcp_inst_store_gate;
  input pad_yy_icg_scan_en;
  input rtu_hpcp_retire_inst_vld;
  input rtu_yy_xx_dbgon;
  input [63:0] sysio_hpcp_time;
  output [31:0] hpcp_cp0_data;
  assign hpcp_cp0_data = 32'b0;
endmodule

module pa_pmp_top(
  cp0_pmp_csr_sel,
  cp0_pmp_csr_wen,
  cp0_pmp_icg_en,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_pmp_updt_data,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cpurst_b,
  forever_cpuclk,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  lsu_pmp_addr,
  lsu_pmp_write,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  pmp_ifu_acc_deny,
  pmp_lsu_acc_deny,
);
  input [19:0] cp0_pmp_csr_sel;
  input cp0_pmp_csr_wen;
  input cp0_pmp_icg_en;
  input [1 :0] cp0_pmp_mstatus_mpp;
  input cp0_pmp_mstatus_mprv;
  input [31:0] cp0_pmp_updt_data;
  input cp0_yy_clk_en;
  input cp0_yy_mach_mode;
  input cpurst_b;
  input forever_cpuclk;
  input [31:0] ifu_pmp_addr;
  input ifu_pmp_machine_mode;
  input [31:0] lsu_pmp_addr;
  input lsu_pmp_write;
  input pad_yy_icg_scan_en;
  output [31:0] pmp_cp0_data;
  output pmp_ifu_acc_deny;
  output pmp_lsu_acc_deny;
  assign pmp_cp0_data = 32'b0;
  assign pmp_ifu_acc_deny = 1'b0;
  assign pmp_lsu_acc_deny = 1'b0;
endmodule

module pa_sysmap_top(
  cp0_pmp_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifu_sysmap_pa,
  ifu_sysmap_rst_sample,
  lsu_sysmap_pa,
  pad_cpu_sysmap_addr0,
  pad_cpu_sysmap_addr0_attr,
  pad_cpu_sysmap_addr1,
  pad_cpu_sysmap_addr1_attr,
  pad_cpu_sysmap_addr2,
  pad_cpu_sysmap_addr2_attr,
  pad_cpu_sysmap_addr3,
  pad_cpu_sysmap_addr3_attr,
  pad_cpu_sysmap_addr4,
  pad_cpu_sysmap_addr4_attr,
  pad_cpu_sysmap_addr5,
  pad_cpu_sysmap_addr5_attr,
  pad_cpu_sysmap_addr6,
  pad_cpu_sysmap_addr6_attr,
  pad_cpu_sysmap_addr7,
  pad_cpu_sysmap_addr7_attr,
  pad_yy_icg_scan_en,
  tcipif_sysmap_addr,
  tcipif_sysmap_sel,
  tcipif_sysmap_wdata,
  tcipif_sysmap_write,
  sysmap_ifu_flg,
  sysmap_lsu_flg,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
);
  input cp0_pmp_icg_en;
  input cp0_yy_clk_en;
  input cpurst_b;
  input forever_cpuclk;
  input [31:0] ifu_sysmap_pa;
  input ifu_sysmap_rst_sample;
  input [31:0] lsu_sysmap_pa;
  input [19:0] pad_cpu_sysmap_addr0;
  input [2 :0] pad_cpu_sysmap_addr0_attr;
  input [19:0] pad_cpu_sysmap_addr1;
  input [2 :0] pad_cpu_sysmap_addr1_attr;
  input [19:0] pad_cpu_sysmap_addr2;
  input [2 :0] pad_cpu_sysmap_addr2_attr;
  input [19:0] pad_cpu_sysmap_addr3;
  input [2 :0] pad_cpu_sysmap_addr3_attr;
  input [19:0] pad_cpu_sysmap_addr4;
  input [2 :0] pad_cpu_sysmap_addr4_attr;
  input [19:0] pad_cpu_sysmap_addr5;
  input [2 :0] pad_cpu_sysmap_addr5_attr;
  input [19:0] pad_cpu_sysmap_addr6;
  input [2 :0] pad_cpu_sysmap_addr6_attr;
  input [19:0] pad_cpu_sysmap_addr7;
  input [2 :0] pad_cpu_sysmap_addr7_attr;
  input pad_yy_icg_scan_en;
  input [15:0] tcipif_sysmap_addr;
  input tcipif_sysmap_sel;
  input [31:0] tcipif_sysmap_wdata;
  input tcipif_sysmap_write;
  output [4 :0] sysmap_ifu_flg;
  output [4 :0] sysmap_lsu_flg;
  output sysmap_tcipif_cmplt;
  output [31:0] sysmap_tcipif_rdata;
  assign sysmap_ifu_flg = 5'b0;
  assign sysmap_lsu_flg = 5'b0;
  assign sysmap_tcipif_cmplt = 1'b0;
  assign sysmap_tcipif_rdata = 32'b0;
endmodule

module pa_bmu_top(
  cp0_biu_icg_en,
  cpurst_b,
  dahbl_bmu_dbus_acc_err,
  dahbl_bmu_dbus_data,
  dahbl_bmu_dbus_grnt,
  dahbl_bmu_dbus_trans_cmplt,
  dahbl_bmu_ibus_acc_err,
  dahbl_bmu_ibus_data,
  dahbl_bmu_ibus_grnt,
  dahbl_bmu_ibus_trans_cmplt,
  forever_cpuclk,
  iahbl_bmu_dbus_acc_err,
  iahbl_bmu_dbus_data,
  iahbl_bmu_dbus_grnt,
  iahbl_bmu_dbus_trans_cmplt,
  iahbl_bmu_ibus_acc_err,
  iahbl_bmu_ibus_data,
  iahbl_bmu_ibus_grnt,
  iahbl_bmu_ibus_trans_cmplt,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  lsu_bmu_acc_deny,
  lsu_bmu_addr,
  lsu_bmu_burst,
  lsu_bmu_lock,
  lsu_bmu_lrsc,
  lsu_bmu_prot,
  lsu_bmu_req,
  lsu_bmu_req_dp,
  lsu_bmu_seq,
  lsu_bmu_size,
  lsu_bmu_wdata,
  lsu_bmu_write,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_tcip_base,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush,
  sahbl_bmu_dbus_acc_err,
  sahbl_bmu_dbus_data,
  sahbl_bmu_dbus_grnt,
  sahbl_bmu_dbus_trans_cmplt,
  sahbl_bmu_ibus_acc_err,
  sahbl_bmu_ibus_data,
  sahbl_bmu_ibus_grnt,
  sahbl_bmu_ibus_trans_cmplt,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt,
  bmu_dahbl_dbus_acc_deny,
  bmu_dahbl_dbus_addr,
  bmu_dahbl_dbus_burst,
  bmu_dahbl_dbus_lock,
  bmu_dahbl_dbus_lrsc,
  bmu_dahbl_dbus_prot,
  bmu_dahbl_dbus_req,
  bmu_dahbl_dbus_req_dp,
  bmu_dahbl_dbus_seq,
  bmu_dahbl_dbus_size,
  bmu_dahbl_dbus_wdata,
  bmu_dahbl_dbus_write,
  bmu_dahbl_ibus_acc_deny,
  bmu_dahbl_ibus_addr,
  bmu_dahbl_ibus_burst,
  bmu_dahbl_ibus_prot,
  bmu_dahbl_ibus_req,
  bmu_dahbl_ibus_req_dp,
  bmu_dahbl_ibus_seq,
  bmu_dahbl_ibus_size,
  bmu_dtu_debug_info,
  bmu_iahbl_dbus_acc_deny,
  bmu_iahbl_dbus_addr,
  bmu_iahbl_dbus_burst,
  bmu_iahbl_dbus_lock,
  bmu_iahbl_dbus_lrsc,
  bmu_iahbl_dbus_prot,
  bmu_iahbl_dbus_req,
  bmu_iahbl_dbus_req_dp,
  bmu_iahbl_dbus_seq,
  bmu_iahbl_dbus_size,
  bmu_iahbl_dbus_wdata,
  bmu_iahbl_dbus_write,
  bmu_iahbl_ibus_acc_deny,
  bmu_iahbl_ibus_addr,
  bmu_iahbl_ibus_burst,
  bmu_iahbl_ibus_prot,
  bmu_iahbl_ibus_req,
  bmu_iahbl_ibus_req_dp,
  bmu_iahbl_ibus_seq,
  bmu_iahbl_ibus_size,
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  bmu_lsu_acc_err,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  bmu_sahbl_dbus_acc_deny,
  bmu_sahbl_dbus_addr,
  bmu_sahbl_dbus_burst,
  bmu_sahbl_dbus_lock,
  bmu_sahbl_dbus_lrsc,
  bmu_sahbl_dbus_prot,
  bmu_sahbl_dbus_req,
  bmu_sahbl_dbus_req_dp,
  bmu_sahbl_dbus_seq,
  bmu_sahbl_dbus_size,
  bmu_sahbl_dbus_wdata,
  bmu_sahbl_dbus_write,
  bmu_sahbl_ibus_acc_deny,
  bmu_sahbl_ibus_addr,
  bmu_sahbl_ibus_burst,
  bmu_sahbl_ibus_prot,
  bmu_sahbl_ibus_req,
  bmu_sahbl_ibus_req_dp,
  bmu_sahbl_ibus_seq,
  bmu_sahbl_ibus_size,
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_req_dp,
  bmu_tcipif_ibus_size,
  bmu_tcipif_ibus_supv_mode,
  bmu_tcipif_ibus_wdata,
  bmu_tcipif_ibus_write,
);
  input cp0_biu_icg_en;
  input cpurst_b;
  input dahbl_bmu_dbus_acc_err;
  input [31:0] dahbl_bmu_dbus_data;
  input dahbl_bmu_dbus_grnt;
  input dahbl_bmu_dbus_trans_cmplt;
  input dahbl_bmu_ibus_acc_err;
  input [31:0] dahbl_bmu_ibus_data;
  input dahbl_bmu_ibus_grnt;
  input dahbl_bmu_ibus_trans_cmplt;
  input forever_cpuclk;
  input iahbl_bmu_dbus_acc_err;
  input [31:0] iahbl_bmu_dbus_data;
  input iahbl_bmu_dbus_grnt;
  input iahbl_bmu_dbus_trans_cmplt;
  input iahbl_bmu_ibus_acc_err;
  input [31:0] iahbl_bmu_ibus_data;
  input iahbl_bmu_ibus_grnt;
  input iahbl_bmu_ibus_trans_cmplt;
  input ifu_bmu_acc_deny;
  input [31:0] ifu_bmu_addr;
  input [2 :0] ifu_bmu_burst;
  input ifu_bmu_data_req;
  input [3 :0] ifu_bmu_prot;
  input ifu_bmu_req;
  input ifu_bmu_seq;
  input [1 :0] ifu_bmu_size;
  input lsu_bmu_acc_deny;
  input [31:0] lsu_bmu_addr;
  input [2 :0] lsu_bmu_burst;
  input lsu_bmu_lock;
  input lsu_bmu_lrsc;
  input [3 :0] lsu_bmu_prot;
  input lsu_bmu_req;
  input lsu_bmu_req_dp;
  input lsu_bmu_seq;
  input [1 :0] lsu_bmu_size;
  input [31:0] lsu_bmu_wdata;
  input lsu_bmu_write;
  input [11:0] pad_bmu_dahbl_base;
  input [11:0] pad_bmu_dahbl_mask;
  input [11:0] pad_bmu_iahbl_base;
  input [11:0] pad_bmu_iahbl_mask;
  input [31:0] pad_cpu_tcip_base;
  input pad_yy_icg_scan_en;
  input rtu_yy_xx_async_flush;
  input sahbl_bmu_dbus_acc_err;
  input [31:0] sahbl_bmu_dbus_data;
  input sahbl_bmu_dbus_grnt;
  input sahbl_bmu_dbus_trans_cmplt;
  input sahbl_bmu_ibus_acc_err;
  input [31:0] sahbl_bmu_ibus_data;
  input sahbl_bmu_ibus_grnt;
  input sahbl_bmu_ibus_trans_cmplt;
  input tcipif_bmu_dbus_acc_err;
  input [31:0] tcipif_bmu_dbus_data;
  input tcipif_bmu_dbus_grnt;
  input tcipif_bmu_dbus_trans_cmplt;
  input tcipif_bmu_ibus_acc_err;
  input [31:0] tcipif_bmu_ibus_data;
  input tcipif_bmu_ibus_grnt;
  input tcipif_bmu_ibus_trans_cmplt;
  output bmu_dahbl_dbus_acc_deny;
  output [31:0] bmu_dahbl_dbus_addr;
  output [2 :0] bmu_dahbl_dbus_burst;
  output bmu_dahbl_dbus_lock;
  output bmu_dahbl_dbus_lrsc;
  output [3 :0] bmu_dahbl_dbus_prot;
  output bmu_dahbl_dbus_req;
  output bmu_dahbl_dbus_req_dp;
  output bmu_dahbl_dbus_seq;
  output [1 :0] bmu_dahbl_dbus_size;
  output [31:0] bmu_dahbl_dbus_wdata;
  output bmu_dahbl_dbus_write;
  output bmu_dahbl_ibus_acc_deny;
  output [31:0] bmu_dahbl_ibus_addr;
  output [2 :0] bmu_dahbl_ibus_burst;
  output [3 :0] bmu_dahbl_ibus_prot;
  output bmu_dahbl_ibus_req;
  output bmu_dahbl_ibus_req_dp;
  output bmu_dahbl_ibus_seq;
  output [1 :0] bmu_dahbl_ibus_size;
  output [3 :0] bmu_dtu_debug_info;
  output bmu_iahbl_dbus_acc_deny;
  output [31:0] bmu_iahbl_dbus_addr;
  output [2 :0] bmu_iahbl_dbus_burst;
  output bmu_iahbl_dbus_lock;
  output bmu_iahbl_dbus_lrsc;
  output [3 :0] bmu_iahbl_dbus_prot;
  output bmu_iahbl_dbus_req;
  output bmu_iahbl_dbus_req_dp;
  output bmu_iahbl_dbus_seq;
  output [1 :0] bmu_iahbl_dbus_size;
  output [31:0] bmu_iahbl_dbus_wdata;
  output bmu_iahbl_dbus_write;
  output bmu_iahbl_ibus_acc_deny;
  output [31:0] bmu_iahbl_ibus_addr;
  output [2 :0] bmu_iahbl_ibus_burst;
  output [3 :0] bmu_iahbl_ibus_prot;
  output bmu_iahbl_ibus_req;
  output bmu_iahbl_ibus_req_dp;
  output bmu_iahbl_ibus_seq;
  output [1 :0] bmu_iahbl_ibus_size;
  output bmu_ifu_acc_err;
  output bmu_ifu_grant;
  output [31:0] bmu_ifu_rdata;
  output bmu_ifu_trans_cmplt;
  output bmu_lsu_acc_err;
  output bmu_lsu_grant;
  output [31:0] bmu_lsu_rdata;
  output bmu_lsu_trans_cmplt;
  output bmu_sahbl_dbus_acc_deny;
  output [31:0] bmu_sahbl_dbus_addr;
  output [2 :0] bmu_sahbl_dbus_burst;
  output bmu_sahbl_dbus_lock;
  output bmu_sahbl_dbus_lrsc;
  output [3 :0] bmu_sahbl_dbus_prot;
  output bmu_sahbl_dbus_req;
  output bmu_sahbl_dbus_req_dp;
  output bmu_sahbl_dbus_seq;
  output [1 :0] bmu_sahbl_dbus_size;
  output [31:0] bmu_sahbl_dbus_wdata;
  output bmu_sahbl_dbus_write;
  output bmu_sahbl_ibus_acc_deny;
  output [31:0] bmu_sahbl_ibus_addr;
  output [2 :0] bmu_sahbl_ibus_burst;
  output [3 :0] bmu_sahbl_ibus_prot;
  output bmu_sahbl_ibus_req;
  output bmu_sahbl_ibus_req_dp;
  output bmu_sahbl_ibus_seq;
  output [1 :0] bmu_sahbl_ibus_size;
  output bmu_tcipif_dbus_acc_deny;
  output [31:0] bmu_tcipif_dbus_addr;
  output bmu_tcipif_dbus_req;
  output bmu_tcipif_dbus_req_dp;
  output [1 :0] bmu_tcipif_dbus_size;
  output bmu_tcipif_dbus_supv_mode;
  output [31:0] bmu_tcipif_dbus_wdata;
  output bmu_tcipif_dbus_write;
  output bmu_tcipif_ibus_acc_deny;
  output [31:0] bmu_tcipif_ibus_addr;
  output bmu_tcipif_ibus_req;
  output bmu_tcipif_ibus_req_dp;
  output [1 :0] bmu_tcipif_ibus_size;
  output bmu_tcipif_ibus_supv_mode;
  output [31:0] bmu_tcipif_ibus_wdata;
  output bmu_tcipif_ibus_write;
  assign bmu_dahbl_dbus_acc_deny = 1'b0;
  assign bmu_dahbl_dbus_addr = 32'b0;
  assign bmu_dahbl_dbus_burst = 3'b0;
  assign bmu_dahbl_dbus_lock = 1'b0;
  assign bmu_dahbl_dbus_lrsc = 1'b0;
  assign bmu_dahbl_dbus_prot = 4'b0;
  assign bmu_dahbl_dbus_req = 1'b0;
  assign bmu_dahbl_dbus_req_dp = 1'b0;
  assign bmu_dahbl_dbus_seq = 1'b0;
  assign bmu_dahbl_dbus_size = 2'b0;
  assign bmu_dahbl_dbus_wdata = 32'b0;
  assign bmu_dahbl_dbus_write = 1'b0;
  assign bmu_dahbl_ibus_acc_deny = 1'b0;
  assign bmu_dahbl_ibus_addr = 32'b0;
  assign bmu_dahbl_ibus_burst = 3'b0;
  assign bmu_dahbl_ibus_prot = 4'b0;
  assign bmu_dahbl_ibus_req = 1'b0;
  assign bmu_dahbl_ibus_req_dp = 1'b0;
  assign bmu_dahbl_ibus_seq = 1'b0;
  assign bmu_dahbl_ibus_size = 2'b0;
  assign bmu_dtu_debug_info = 4'b0;
  assign bmu_iahbl_dbus_acc_deny = 1'b0;
  assign bmu_iahbl_dbus_addr = 32'b0;
  assign bmu_iahbl_dbus_burst = 3'b0;
  assign bmu_iahbl_dbus_lock = 1'b0;
  assign bmu_iahbl_dbus_lrsc = 1'b0;
  assign bmu_iahbl_dbus_prot = 4'b0;
  assign bmu_iahbl_dbus_req = 1'b0;
  assign bmu_iahbl_dbus_req_dp = 1'b0;
  assign bmu_iahbl_dbus_seq = 1'b0;
  assign bmu_iahbl_dbus_size = 2'b0;
  assign bmu_iahbl_dbus_wdata = 32'b0;
  assign bmu_iahbl_dbus_write = 1'b0;
  assign bmu_iahbl_ibus_acc_deny = 1'b0;
  assign bmu_iahbl_ibus_addr = 32'b0;
  assign bmu_iahbl_ibus_burst = 3'b0;
  assign bmu_iahbl_ibus_prot = 4'b0;
  assign bmu_iahbl_ibus_req = 1'b0;
  assign bmu_iahbl_ibus_req_dp = 1'b0;
  assign bmu_iahbl_ibus_seq = 1'b0;
  assign bmu_iahbl_ibus_size = 2'b0;
  assign bmu_ifu_acc_err = 1'b0;
  assign bmu_ifu_grant = 1'b0;
  assign bmu_ifu_rdata = 32'b0;
  assign bmu_ifu_trans_cmplt = 1'b0;
  assign bmu_lsu_acc_err = 1'b0;
  assign bmu_lsu_grant = 1'b0;
  assign bmu_lsu_rdata = 32'b0;
  assign bmu_lsu_trans_cmplt = 1'b0;
  assign bmu_sahbl_dbus_acc_deny = 1'b0;
  assign bmu_sahbl_dbus_addr = 32'b0;
  assign bmu_sahbl_dbus_burst = 3'b0;
  assign bmu_sahbl_dbus_lock = 1'b0;
  assign bmu_sahbl_dbus_lrsc = 1'b0;
  assign bmu_sahbl_dbus_prot = 4'b0;
  assign bmu_sahbl_dbus_req = 1'b0;
  assign bmu_sahbl_dbus_req_dp = 1'b0;
  assign bmu_sahbl_dbus_seq = 1'b0;
  assign bmu_sahbl_dbus_size = 2'b0;
  assign bmu_sahbl_dbus_wdata = 32'b0;
  assign bmu_sahbl_dbus_write = 1'b0;
  assign bmu_sahbl_ibus_acc_deny = 1'b0;
  assign bmu_sahbl_ibus_addr = 32'b0;
  assign bmu_sahbl_ibus_burst = 3'b0;
  assign bmu_sahbl_ibus_prot = 4'b0;
  assign bmu_sahbl_ibus_req = 1'b0;
  assign bmu_sahbl_ibus_req_dp = 1'b0;
  assign bmu_sahbl_ibus_seq = 1'b0;
  assign bmu_sahbl_ibus_size = 2'b0;
  assign bmu_tcipif_dbus_acc_deny = 1'b0;
  assign bmu_tcipif_dbus_addr = 32'b0;
  assign bmu_tcipif_dbus_req = 1'b0;
  assign bmu_tcipif_dbus_req_dp = 1'b0;
  assign bmu_tcipif_dbus_size = 2'b0;
  assign bmu_tcipif_dbus_supv_mode = 1'b0;
  assign bmu_tcipif_dbus_wdata = 32'b0;
  assign bmu_tcipif_dbus_write = 1'b0;
  assign bmu_tcipif_ibus_acc_deny = 1'b0;
  assign bmu_tcipif_ibus_addr = 32'b0;
  assign bmu_tcipif_ibus_req = 1'b0;
  assign bmu_tcipif_ibus_req_dp = 1'b0;
  assign bmu_tcipif_ibus_size = 2'b0;
  assign bmu_tcipif_ibus_supv_mode = 1'b0;
  assign bmu_tcipif_ibus_wdata = 32'b0;
  assign bmu_tcipif_ibus_write = 1'b0;
endmodule

module pa_sys_io(
  biu_sysio_idle,
  clk_en,
  cp0_biu_icg_en,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_sysio_srst,
  cpurst_b,
  dahbl_sysio_idle,
  dtu_cp0_wake_up,
  forever_cpuclk,
  iahbl_sysio_idle,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_cpu_nmi,
  pad_cpu_rst_addr,
  pad_cpu_sys_cnt,
  pad_cpu_wakeup_event,
  pad_yy_icg_scan_en,
  rtu_sysio_halted,
  rtu_sysio_lockup_on,
  rtu_yy_xx_dbgon,
  cpu_pad_dfs_ack,
  cpu_pad_halted,
  cpu_pad_lockup,
  cpu_pad_soft_rst,
  sysio_clint_me_int,
  sysio_clint_mtime,
  sysio_cp0_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr,
  sysio_hpcp_time,
  sysio_ifu_rst_addr,
  sysio_ifu_rst_addr_done,
  sysio_iu_rst_addr,
  sysio_pad_lpmd_b,
  sysio_rtu_nmi_int,
  sysio_rtu_wk_event,
  sysio_xx_halt_req,
);
  input biu_sysio_idle;
  input clk_en;
  input cp0_biu_icg_en;
  input cp0_sysio_ipend_b;
  input [1 :0] cp0_sysio_lpmd_b;
  input [1 :0] cp0_sysio_srst;
  input cpurst_b;
  input dahbl_sysio_idle;
  input dtu_cp0_wake_up;
  input forever_cpuclk;
  input iahbl_sysio_idle;
  input pad_cpu_dfs_req;
  input pad_cpu_ext_int_b;
  input pad_cpu_nmi;
  input [31:0] pad_cpu_rst_addr;
  input [63:0] pad_cpu_sys_cnt;
  input pad_cpu_wakeup_event;
  input pad_yy_icg_scan_en;
  input rtu_sysio_halted;
  input rtu_sysio_lockup_on;
  input rtu_yy_xx_dbgon;
  output cpu_pad_dfs_ack;
  output cpu_pad_halted;
  output cpu_pad_lockup;
  output [1 :0] cpu_pad_soft_rst;
  output sysio_clint_me_int;
  output [63:0] sysio_clint_mtime;
  output sysio_cp0_clk_en;
  output [2 :0] sysio_cp0_clkratio;
  output [31:0] sysio_cp0_rst_addr;
  output [63:0] sysio_hpcp_time;
  output [31:0] sysio_ifu_rst_addr;
  output sysio_ifu_rst_addr_done;
  output [31:0] sysio_iu_rst_addr;
  output [1 :0] sysio_pad_lpmd_b;
  output sysio_rtu_nmi_int;
  output sysio_rtu_wk_event;
  output sysio_xx_halt_req;
  assign cpu_pad_dfs_ack = 1'b0;
  assign cpu_pad_halted = 1'b0;
  assign cpu_pad_lockup = 1'b0;
  assign cpu_pad_soft_rst = 2'b0;
  assign sysio_clint_me_int = 1'b0;
  assign sysio_clint_mtime = 64'b0;
  assign sysio_cp0_clk_en = 1'b0;
  assign sysio_cp0_clkratio = 3'b0;
  assign sysio_cp0_rst_addr = 32'b0;
  assign sysio_hpcp_time = 64'b0;
  assign sysio_ifu_rst_addr = 32'b0;
  assign sysio_ifu_rst_addr_done = 1'b0;
  assign sysio_iu_rst_addr = 32'b0;
  assign sysio_pad_lpmd_b = 2'b0;
  assign sysio_rtu_nmi_int = 1'b0;
  assign sysio_rtu_wk_event = 1'b0;
  assign sysio_xx_halt_req = 1'b0;
endmodule

module pa_ifu_bht(
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  id_pred_bht_br_vld,
  id_pred_bht_pc,
  iu_ifu_bht_cur_pc,
  iu_ifu_bht_mispred,
  iu_ifu_bht_mispred_gate,
  iu_ifu_bht_pred,
  iu_ifu_bht_taken,
  iu_ifu_br_vld,
  iu_ifu_br_vld_gate,
  pad_yy_icg_scan_en,
  bht_id_pred_mem_taken,
  bht_id_pred_rslt,
  bht_top_cur_st,
  ifu_cp0_bht_inv_done,
);
  input cp0_ifu_bht_en;
  input cp0_ifu_bht_inv;
  input cp0_ifu_icg_en;
  input cp0_yy_clk_en;
  input cpurst_b;
  input forever_cpuclk;
  input id_pred_bht_br_vld;
  input [2 :0] id_pred_bht_pc;
  input [31:0] iu_ifu_bht_cur_pc;
  input iu_ifu_bht_mispred;
  input iu_ifu_bht_mispred_gate;
  input [1 :0] iu_ifu_bht_pred;
  input iu_ifu_bht_taken;
  input iu_ifu_br_vld;
  input iu_ifu_br_vld_gate;
  input pad_yy_icg_scan_en;
  output bht_id_pred_mem_taken;
  output [1 :0] bht_id_pred_rslt;
  output [1 :0] bht_top_cur_st;
  output ifu_cp0_bht_inv_done;
  assign bht_id_pred_mem_taken = 1'b0;
  assign bht_id_pred_rslt = 2'b0;
  assign bht_top_cur_st = 2'b0;
  assign ifu_cp0_bht_inv_done = 1'b0;
endmodule

module pa_ifu_btb(
  cp0_ifu_btb_clr,
  cp0_ifu_btb_en,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_btb_inst_fetch,
  forever_cpuclk,
  id_pred_btb_cur_pc,
  id_pred_btb_mis_pred,
  id_pred_btb_mis_predg,
  id_pred_btb_tar_pc,
  id_pred_btb_upd_vld,
  id_pred_btb_upd_vldg,
  ifetch_pcgen_grant,
  iu_ifu_tar_pc_vld,
  pad_yy_icg_scan_en,
  pcgen_btb_addr,
  pcgen_btb_pc,
  btb_pcgen_tar_pc,
  btb_xx_chgflw_vld,
);
  input cp0_ifu_btb_clr;
  input cp0_ifu_btb_en;
  input cp0_ifu_icg_en;
  input cp0_yy_clk_en;
  input cpurst_b;
  input ctrl_btb_inst_fetch;
  input forever_cpuclk;
  input [31:0] id_pred_btb_cur_pc;
  input id_pred_btb_mis_pred;
  input id_pred_btb_mis_predg;
  input [31:0] id_pred_btb_tar_pc;
  input id_pred_btb_upd_vld;
  input id_pred_btb_upd_vldg;
  input ifetch_pcgen_grant;
  input iu_ifu_tar_pc_vld;
  input pad_yy_icg_scan_en;
  input [31:0] pcgen_btb_addr;
  input [31:0] pcgen_btb_pc;
  output [31:0] btb_pcgen_tar_pc;
  output btb_xx_chgflw_vld;
  assign btb_pcgen_tar_pc = 32'b0;
  assign btb_xx_chgflw_vld = 1'b0;
endmodule

module pa_ifu_ibuf(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ibuf_pop_en,
  dtu_ifu_debug_inst,
  dtu_ifu_debug_inst_vld,
  dtu_ifu_halt_info_vld,
  forever_cpuclk,
  id_pred_ibuf_br_taken0,
  id_pred_ibuf_br_taken1,
  id_pred_ibuf_chgflw_vld0,
  id_pred_ibuf_halt_info0,
  id_pred_ibuf_halt_info1,
  idu_ifu_id_stall,
  idu_ifu_tail_vld,
  idu_ifu_tail_vld_gate,
  ifetch_ibuf_idle,
  ifetch_xx_not_busy,
  ipack_ibuf_acc_err,
  ipack_ibuf_inst,
  ipack_ibuf_inst_all,
  ipack_ibuf_inst_empty,
  ipack_ibuf_inst_full,
  ipack_ibuf_inst_one,
  ipack_ibuf_inst_one_raw,
  ipack_ibuf_inst_two,
  ipack_ibuf_inst_vld,
  ipack_ibuf_inst_vld_raw,
  pad_yy_icg_scan_en,
  pcgen_ibuf_chgflw_vld,
  rtu_ifu_flush_fe,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_tail_int_vld,
  vec_ibuf_warm_up,
  ibuf_ctrl_inst_fetch,
  ibuf_id_pred_hungry,
  ibuf_ipack_stall,
  ibuf_pred_stall,
  ibuf_top_id_stall,
  ibuf_top_vld_num,
  ifu_idu_id_expt_high,
  ifu_idu_id_expt_vld,
  ifu_idu_id_halt_info,
  ifu_idu_id_inst,
  ifu_idu_id_inst_vld,
  ifu_idu_id_pred_taken,
);
  input cp0_ifu_icg_en;
  input cp0_yy_clk_en;
  input cpurst_b;
  input ctrl_ibuf_pop_en;
  input [31:0] dtu_ifu_debug_inst;
  input dtu_ifu_debug_inst_vld;
  input dtu_ifu_halt_info_vld;
  input forever_cpuclk;
  input [1 :0] id_pred_ibuf_br_taken0;
  input [1 :0] id_pred_ibuf_br_taken1;
  input id_pred_ibuf_chgflw_vld0;
  input [14:0] id_pred_ibuf_halt_info0;
  input [14:0] id_pred_ibuf_halt_info1;
  input idu_ifu_id_stall;
  input idu_ifu_tail_vld;
  input idu_ifu_tail_vld_gate;
  input ifetch_ibuf_idle;
  input ifetch_xx_not_busy;
  input [2 :0] ipack_ibuf_acc_err;
  input [47:0] ipack_ibuf_inst;
  input ipack_ibuf_inst_all;
  input ipack_ibuf_inst_empty;
  input ipack_ibuf_inst_full;
  input ipack_ibuf_inst_one;
  input ipack_ibuf_inst_one_raw;
  input ipack_ibuf_inst_two;
  input ipack_ibuf_inst_vld;
  input ipack_ibuf_inst_vld_raw;
  input pad_yy_icg_scan_en;
  input pcgen_ibuf_chgflw_vld;
  input rtu_ifu_flush_fe;
  input rtu_yy_xx_dbgon;
  input rtu_yy_xx_expt_vld;
  input rtu_yy_xx_tail_int_vld;
  input vec_ibuf_warm_up;
  output ibuf_ctrl_inst_fetch;
  output ibuf_id_pred_hungry;
  output ibuf_ipack_stall;
  output ibuf_pred_stall;
  output ibuf_top_id_stall;
  output [2 :0] ibuf_top_vld_num;
  output ifu_idu_id_expt_high;
  output ifu_idu_id_expt_vld;
  output [14:0] ifu_idu_id_halt_info;
  output [31:0] ifu_idu_id_inst;
  output ifu_idu_id_inst_vld;
  output [1 :0] ifu_idu_id_pred_taken;
  assign ibuf_ctrl_inst_fetch = 1'b0;
  assign ibuf_id_pred_hungry = 1'b0;
  assign ibuf_ipack_stall = 1'b0;
  assign ibuf_pred_stall = 1'b0;
  assign ibuf_top_id_stall = 1'b0;
  assign ibuf_top_vld_num = 3'b0;
  assign ifu_idu_id_expt_high = 1'b0;
  assign ifu_idu_id_expt_vld = 1'b0;
  assign ifu_idu_id_halt_info = 15'b0;
  assign ifu_idu_id_inst = 32'b0;
  assign ifu_idu_id_inst_vld = 1'b0;
  assign ifu_idu_id_pred_taken = 2'b0;
endmodule

module pa_ifu_ifetch(
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_ifu_lpmd_req,
  cp0_ifu_srst_req,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cpurst_b,
  ctrl_ifetch_req_abort,
  ctrl_ifetch_req_vld,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pcgen_ifetch_addr,
  pcgen_ifetch_chgflw_vld,
  pcgen_ifetch_ifpc,
  pcgen_ifetch_seq_addr,
  pmp_ifu_acc_deny,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_yy_xx_dbgon,
  sysmap_ifu_flg,
  vec_ifetch_data_fetch,
  icache_top_abort,
  icache_top_rd_vld,
  icache_top_ref_st,
  icache_top_uc_st,
  ifetch_ctrl_inst_vld,
  ifetch_ibuf_idle,
  ifetch_ipack_acc_err,
  ifetch_ipack_inst,
  ifetch_ipack_inst_vld,
  ifetch_ipack_inst_vld_gate,
  ifetch_ipack_unalign,
  ifetch_pcgen_addr,
  ifetch_pcgen_data,
  ifetch_pcgen_grant,
  ifetch_pcgen_grant_dp,
  ifetch_top_abt_st,
  ifetch_top_cur_st,
  ifetch_vec_acc_err,
  ifetch_vec_cmplt,
  ifetch_vec_grant,
  ifetch_vec_idle,
  ifetch_xx_not_busy,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  ifu_cp0_icache_inv_done,
  ifu_cp0_lpmd_ack,
  ifu_cp0_srst_ack,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  ifu_rtu_lockup_ack,
  ifu_sysmap_pa,
);
  input bmu_ifu_acc_err;
  input bmu_ifu_grant;
  input [31:0] bmu_ifu_rdata;
  input bmu_ifu_trans_cmplt;
  input cp0_ifu_icache_en;
  input [31:0] cp0_ifu_icache_inv_addr;
  input cp0_ifu_icache_inv_req;
  input cp0_ifu_icache_inv_type;
  input cp0_ifu_icg_en;
  input cp0_ifu_lpmd_req;
  input cp0_ifu_srst_req;
  input cp0_yy_clk_en;
  input cp0_yy_mach_mode;
  input cpurst_b;
  input ctrl_ifetch_req_abort;
  input ctrl_ifetch_req_vld;
  input forever_cpuclk;
  input pad_yy_icg_scan_en;
  input [31:0] pcgen_ifetch_addr;
  input pcgen_ifetch_chgflw_vld;
  input [31:0] pcgen_ifetch_ifpc;
  input [31:0] pcgen_ifetch_seq_addr;
  input pmp_ifu_acc_deny;
  input rtu_ifu_lockup_mask;
  input rtu_ifu_lockup_req;
  input rtu_yy_xx_dbgon;
  input [4 :0] sysmap_ifu_flg;
  input vec_ifetch_data_fetch;
  output icache_top_abort;
  output icache_top_rd_vld;
  output [1 :0] icache_top_ref_st;
  output icache_top_uc_st;
  output ifetch_ctrl_inst_vld;
  output ifetch_ibuf_idle;
  output ifetch_ipack_acc_err;
  output [31:0] ifetch_ipack_inst;
  output ifetch_ipack_inst_vld;
  output ifetch_ipack_inst_vld_gate;
  output ifetch_ipack_unalign;
  output [31:0] ifetch_pcgen_addr;
  output [31:0] ifetch_pcgen_data;
  output ifetch_pcgen_grant;
  output ifetch_pcgen_grant_dp;
  output [1 :0] ifetch_top_abt_st;
  output [2 :0] ifetch_top_cur_st;
  output ifetch_vec_acc_err;
  output ifetch_vec_cmplt;
  output ifetch_vec_grant;
  output ifetch_vec_idle;
  output ifetch_xx_not_busy;
  output ifu_bmu_acc_deny;
  output [31:0] ifu_bmu_addr;
  output [2 :0] ifu_bmu_burst;
  output ifu_bmu_data_req;
  output [3 :0] ifu_bmu_prot;
  output ifu_bmu_req;
  output ifu_bmu_seq;
  output [1 :0] ifu_bmu_size;
  output ifu_cp0_icache_inv_done;
  output ifu_cp0_lpmd_ack;
  output ifu_cp0_srst_ack;
  output ifu_hpcp_icache_access;
  output ifu_hpcp_icache_miss;
  output [31:0] ifu_pmp_addr;
  output ifu_pmp_machine_mode;
  output ifu_rtu_lockup_ack;
  output [31:0] ifu_sysmap_pa;
  assign icache_top_abort = 1'b0;
  assign icache_top_rd_vld = 1'b0;
  assign icache_top_ref_st = 2'b0;
  assign icache_top_uc_st = 1'b0;
  assign ifetch_ctrl_inst_vld = 1'b0;
  assign ifetch_ibuf_idle = 1'b0;
  assign ifetch_ipack_acc_err = 1'b0;
  assign ifetch_ipack_inst = 32'b0;
  assign ifetch_ipack_inst_vld = 1'b0;
  assign ifetch_ipack_inst_vld_gate = 1'b0;
  assign ifetch_ipack_unalign = 1'b0;
  assign ifetch_pcgen_addr = 32'b0;
  assign ifetch_pcgen_data = 32'b0;
  assign ifetch_pcgen_grant = 1'b0;
  assign ifetch_pcgen_grant_dp = 1'b0;
  assign ifetch_top_abt_st = 2'b0;
  assign ifetch_top_cur_st = 3'b0;
  assign ifetch_vec_acc_err = 1'b0;
  assign ifetch_vec_cmplt = 1'b0;
  assign ifetch_vec_grant = 1'b0;
  assign ifetch_vec_idle = 1'b0;
  assign ifetch_xx_not_busy = 1'b0;
  assign ifu_bmu_acc_deny = 1'b0;
  assign ifu_bmu_addr = 32'b0;
  assign ifu_bmu_burst = 3'b0;
  assign ifu_bmu_data_req = 1'b0;
  assign ifu_bmu_prot = 4'b0;
  assign ifu_bmu_req = 1'b0;
  assign ifu_bmu_seq = 1'b0;
  assign ifu_bmu_size = 2'b0;
  assign ifu_cp0_icache_inv_done = 1'b0;
  assign ifu_cp0_lpmd_ack = 1'b0;
  assign ifu_cp0_srst_ack = 1'b0;
  assign ifu_hpcp_icache_access = 1'b0;
  assign ifu_hpcp_icache_miss = 1'b0;
  assign ifu_pmp_addr = 32'b0;
  assign ifu_pmp_machine_mode = 1'b0;
  assign ifu_rtu_lockup_ack = 1'b0;
  assign ifu_sysmap_pa = 32'b0;
endmodule

module pa_ifu_icache(
  bmu_ifu_acc_err,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ifetch_req_abort,
  ctrl_ifetch_req_vld,
  forever_cpuclk,
  ibus_icache_cmplt,
  ibus_icache_data,
  ibus_icache_error,
  ibus_icache_grant,
  ibus_icache_not_busy,
  ibus_icache_uc_cmplt,
  ibus_icache_unalign,
  ibus_trans_abort,
  ifetch_outstanding,
  ifetch_req_addr,
  ifetch_req_ca,
  ifetch_req_prot,
  pad_yy_icg_scan_en,
  pcgen_ifetch_chgflw_vld,
  pcgen_ifetch_seq_addr,
  pmp_ifu_acc_deny,
  vec_ifetch_data_fetch,
  icache_ibus_acc_deny,
  icache_ibus_addr,
  icache_ibus_burst,
  icache_ibus_data_req,
  icache_ibus_prot,
  icache_ibus_req,
  icache_ibus_seq,
  icache_ifetch_addr,
  icache_ifetch_error,
  icache_ifetch_grant,
  icache_ifetch_idle,
  icache_ifetch_inst,
  icache_ifetch_inst_vld,
  icache_ifetch_inst_vld_gate,
  icache_ifetch_mach_mode,
  icache_ifetch_not_busy,
  icache_ifetch_rd_addr,
  icache_ifetch_uc_sel,
  icache_ifetch_unalign,
  icache_ifetch_vec_data_cmplt,
  icache_top_abort,
  icache_top_rd_vld,
  icache_top_ref_st,
  icache_top_uc_st,
  ifu_cp0_icache_inv_done,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
);
  input bmu_ifu_acc_err;
  input cp0_ifu_icache_en;
  input [31:0] cp0_ifu_icache_inv_addr;
  input cp0_ifu_icache_inv_req;
  input cp0_ifu_icache_inv_type;
  input cp0_ifu_icg_en;
  input cp0_yy_clk_en;
  input cpurst_b;
  input ctrl_ifetch_req_abort;
  input ctrl_ifetch_req_vld;
  input forever_cpuclk;
  input ibus_icache_cmplt;
  input [31:0] ibus_icache_data;
  input ibus_icache_error;
  input ibus_icache_grant;
  input ibus_icache_not_busy;
  input ibus_icache_uc_cmplt;
  input ibus_icache_unalign;
  input ibus_trans_abort;
  input ifetch_outstanding;
  input [31:0] ifetch_req_addr;
  input ifetch_req_ca;
  input [3 :0] ifetch_req_prot;
  input pad_yy_icg_scan_en;
  input pcgen_ifetch_chgflw_vld;
  input [31:0] pcgen_ifetch_seq_addr;
  input pmp_ifu_acc_deny;
  input vec_ifetch_data_fetch;
  output icache_ibus_acc_deny;
  output [31:0] icache_ibus_addr;
  output [2 :0] icache_ibus_burst;
  output icache_ibus_data_req;
  output [3 :0] icache_ibus_prot;
  output icache_ibus_req;
  output icache_ibus_seq;
  output [31:0] icache_ifetch_addr;
  output icache_ifetch_error;
  output icache_ifetch_grant;
  output icache_ifetch_idle;
  output [31:0] icache_ifetch_inst;
  output icache_ifetch_inst_vld;
  output icache_ifetch_inst_vld_gate;
  output icache_ifetch_mach_mode;
  output icache_ifetch_not_busy;
  output [31:0] icache_ifetch_rd_addr;
  output icache_ifetch_uc_sel;
  output icache_ifetch_unalign;
  output icache_ifetch_vec_data_cmplt;
  output icache_top_abort;
  output icache_top_rd_vld;
  output [1 :0] icache_top_ref_st;
  output icache_top_uc_st;
  output ifu_cp0_icache_inv_done;
  output ifu_hpcp_icache_access;
  output ifu_hpcp_icache_miss;
  assign icache_ibus_acc_deny = 1'b0;
  assign icache_ibus_addr = 32'b0;
  assign icache_ibus_burst = 3'b0;
  assign icache_ibus_data_req = 1'b0;
  assign icache_ibus_prot = 4'b0;
  assign icache_ibus_req = 1'b0;
  assign icache_ibus_seq = 1'b0;
  assign icache_ifetch_addr = 32'b0;
  assign icache_ifetch_error = 1'b0;
  assign icache_ifetch_grant = 1'b0;
  assign icache_ifetch_idle = 1'b0;
  assign icache_ifetch_inst = 32'b0;
  assign icache_ifetch_inst_vld = 1'b0;
  assign icache_ifetch_inst_vld_gate = 1'b0;
  assign icache_ifetch_mach_mode = 1'b0;
  assign icache_ifetch_not_busy = 1'b0;
  assign icache_ifetch_rd_addr = 32'b0;
  assign icache_ifetch_uc_sel = 1'b0;
  assign icache_ifetch_unalign = 1'b0;
  assign icache_ifetch_vec_data_cmplt = 1'b0;
  assign icache_top_abort = 1'b0;
  assign icache_top_rd_vld = 1'b0;
  assign icache_top_ref_st = 2'b0;
  assign icache_top_uc_st = 1'b0;
  assign ifu_cp0_icache_inv_done = 1'b0;
  assign ifu_hpcp_icache_access = 1'b0;
  assign ifu_hpcp_icache_miss = 1'b0;
endmodule

module pa_lsu_vb(
  cp0_lsu_fence_req,
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_vb_acc_ecc,
  dahbif_vb_cmplt,
  dahbif_vb_grant,
  dc_vb_st_amold,
  dc_xx_addr,
  forever_cpuclk,
  icc_vb_addr,
  icc_vb_clr_vld,
  icc_vb_create_en,
  icc_vb_data,
  icc_vb_data_cnt,
  icc_vb_data_create,
  icc_vb_line_dirty,
  pad_yy_icg_scan_en,
  rdl_vb_addr,
  rdl_vb_create_en,
  rdl_vb_data,
  rdl_vb_data_cnt,
  rdl_vb_data_create,
  rdl_vb_line_dirty,
  rdl_vb_warm_up,
  rtu_yy_xx_async_flush,
  vb_dahbif_addr,
  vb_dahbif_data,
  vb_dahbif_prot,
  vb_dahbif_req,
  vb_dbginfo,
  vb_dc_hit_dirty,
  vb_dc_ld_data,
  vb_dc_ld_fwd_vld,
  vb_dc_pop_en,
  vb_icc_empty,
  vb_icc_grant,
  vb_idle,
  vb_rdl_grant,
  vb_wb_idle,
);
  input cp0_lsu_fence_req;
  input cp0_lsu_icg_en;
  input cpurst_b;
  input dahbif_vb_acc_ecc;
  input dahbif_vb_cmplt;
  input dahbif_vb_grant;
  input dc_vb_st_amold;
  input [31 :0] dc_xx_addr;
  input forever_cpuclk;
  input [26 :0] icc_vb_addr;
  input icc_vb_clr_vld;
  input icc_vb_create_en;
  input [63 :0] icc_vb_data;
  input [1  :0] icc_vb_data_cnt;
  input icc_vb_data_create;
  input icc_vb_line_dirty;
  input pad_yy_icg_scan_en;
  input [26 :0] rdl_vb_addr;
  input rdl_vb_create_en;
  input [63 :0] rdl_vb_data;
  input [1  :0] rdl_vb_data_cnt;
  input rdl_vb_data_create;
  input rdl_vb_line_dirty;
  input rdl_vb_warm_up;
  input rtu_yy_xx_async_flush;
  output [31 :0] vb_dahbif_addr;
  output [31 :0] vb_dahbif_data;
  output [3  :0] vb_dahbif_prot;
  output vb_dahbif_req;
  output [7  :0] vb_dbginfo;
  output vb_dc_hit_dirty;
  output [31 :0] vb_dc_ld_data;
  output vb_dc_ld_fwd_vld;
  output vb_dc_pop_en;
  output vb_icc_empty;
  output vb_icc_grant;
  output vb_idle;
  output vb_rdl_grant;
  output vb_wb_idle;
  assign vb_dahbif_addr = 32'b0;
  assign vb_dahbif_data = 32'b0;
  assign vb_dahbif_prot = 4'b0;
  assign vb_dahbif_req = 1'b0;
  assign vb_dbginfo = 8'b0;
  assign vb_dc_hit_dirty = 1'b0;
  assign vb_dc_ld_data = 32'b0;
  assign vb_dc_ld_fwd_vld = 1'b0;
  assign vb_dc_pop_en = 1'b0;
  assign vb_icc_empty = 1'b0;
  assign vb_icc_grant = 1'b0;
  assign vb_idle = 1'b0;
  assign vb_rdl_grant = 1'b0;
  assign vb_wb_idle = 1'b0;
endmodule

module pa_lsu_ncb(
  ag_dc_buf,
  ag_dc_bytes_vld,
  ag_dc_ca,
  ag_dc_dest_reg,
  ag_dc_fls,
  ag_dc_func,
  ag_dc_lm_pass,
  ag_dc_mach_mode,
  ag_dc_ori_size,
  ag_dc_pmp_expt,
  ag_dc_sign_ext,
  ag_dc_size,
  ag_dc_so,
  ag_dc_split,
  ag_dc_split_first,
  ag_dc_split_last,
  ag_dc_src1_depd,
  ag_dc_wdata_shift,
  ag_ncb_addr,
  ag_ncb_inst_vld,
  ag_ncb_inst_vld_dp,
  ag_ncb_src1_reg,
  ag_ncb_st_data,
  cp0_lsu_icg_en,
  cp0_xx_async_expt_en,
  cpurst_b,
  da_xx_fwd_data,
  da_xx_fwd_fls,
  da_xx_fwd_preg,
  da_xx_fwd_vld,
  dahbif_ncb_acc_err,
  dahbif_ncb_cmplt,
  dahbif_ncb_data,
  dahbif_ncb_grant,
  dahbif_ncb_grant_2,
  forever_cpuclk,
  ifu_lsu_warm_up,
  pad_yy_icg_scan_en,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_sync_req,
  rtu_yy_xx_async_flush,
  lsu_biu_amo_pmp_deny,
  lsu_mb_ex2_uc_addr_2,
  lsu_mb_ex2_uc_bytes_vld,
  lsu_mb_ex2_uc_data,
  lsu_mb_ex2_uc_data_vld,
  lsu_mb_ex2_uc_data_vld_gate,
  lsu_mb_ex2_uc_dest_reg,
  lsu_mb_ex2_uc_fld,
  lsu_mb_ex2_uc_fls,
  lsu_mb_ex2_uc_lock,
  lsu_mb_ex2_uc_sc_data_vld,
  lsu_mb_ex2_uc_sign_ext,
  lsu_mb_ex2_uc_size,
  lsu_mb_ex2_uc_split,
  lsu_mb_ex2_uc_split_last,
  lsu_mb_ex2_uc_stall,
  lsu_xx_ex2_uc_flush,
  ncb_ag_async_expt_vld,
  ncb_ag_async_ld_inst,
  ncb_ag_async_mtval,
  ncb_ag_pmp_ld_inst,
  ncb_ag_pmp_mtval,
  ncb_ag_stall,
  ncb_dahbif_acc_deny,
  ncb_dahbif_lock,
  ncb_dahbif_lrsc,
  ncb_dahbif_ncb_wb_addr,
  ncb_dahbif_ncb_wb_sel,
  ncb_dahbif_prot,
  ncb_dahbif_req,
  ncb_dahbif_req_dp,
  ncb_dahbif_size,
  ncb_dahbif_uc_ld_addr,
  ncb_dahbif_wdata,
  ncb_dahbif_write,
  ncb_dbginfo,
  ncb_xx_no_op,
);
  input ag_dc_buf;
  input [3 :0] ag_dc_bytes_vld;
  input ag_dc_ca;
  input [5 :0] ag_dc_dest_reg;
  input ag_dc_fls;
  input [3 :0] ag_dc_func;
  input ag_dc_lm_pass;
  input ag_dc_mach_mode;
  input [1 :0] ag_dc_ori_size;
  input ag_dc_pmp_expt;
  input ag_dc_sign_ext;
  input [1 :0] ag_dc_size;
  input ag_dc_so;
  input ag_dc_split;
  input ag_dc_split_first;
  input ag_dc_split_last;
  input ag_dc_src1_depd;
  input [2 :0] ag_dc_wdata_shift;
  input [31:0] ag_ncb_addr;
  input ag_ncb_inst_vld;
  input ag_ncb_inst_vld_dp;
  input [5 :0] ag_ncb_src1_reg;
  input [31:0] ag_ncb_st_data;
  input cp0_lsu_icg_en;
  input cp0_xx_async_expt_en;
  input cpurst_b;
  input [31:0] da_xx_fwd_data;
  input da_xx_fwd_fls;
  input [5 :0] da_xx_fwd_preg;
  input da_xx_fwd_vld;
  input dahbif_ncb_acc_err;
  input dahbif_ncb_cmplt;
  input [31:0] dahbif_ncb_data;
  input dahbif_ncb_grant;
  input dahbif_ncb_grant_2;
  input forever_cpuclk;
  input ifu_lsu_warm_up;
  input pad_yy_icg_scan_en;
  input [31:0] rtu_lsu_fgpr_wb_data;
  input [4 :0] rtu_lsu_fgpr_wb_reg;
  input rtu_lsu_fgpr_wb_vld;
  input rtu_lsu_sync_req;
  input rtu_yy_xx_async_flush;
  output lsu_biu_amo_pmp_deny;
  output lsu_mb_ex2_uc_addr_2;
  output [3 :0] lsu_mb_ex2_uc_bytes_vld;
  output [31:0] lsu_mb_ex2_uc_data;
  output lsu_mb_ex2_uc_data_vld;
  output lsu_mb_ex2_uc_data_vld_gate;
  output [5 :0] lsu_mb_ex2_uc_dest_reg;
  output lsu_mb_ex2_uc_fld;
  output lsu_mb_ex2_uc_fls;
  output lsu_mb_ex2_uc_lock;
  output lsu_mb_ex2_uc_sc_data_vld;
  output lsu_mb_ex2_uc_sign_ext;
  output [1 :0] lsu_mb_ex2_uc_size;
  output lsu_mb_ex2_uc_split;
  output lsu_mb_ex2_uc_split_last;
  output lsu_mb_ex2_uc_stall;
  output lsu_xx_ex2_uc_flush;
  output ncb_ag_async_expt_vld;
  output ncb_ag_async_ld_inst;
  output [31:0] ncb_ag_async_mtval;
  output ncb_ag_pmp_ld_inst;
  output [31:0] ncb_ag_pmp_mtval;
  output ncb_ag_stall;
  output ncb_dahbif_acc_deny;
  output ncb_dahbif_lock;
  output ncb_dahbif_lrsc;
  output [31:0] ncb_dahbif_ncb_wb_addr;
  output ncb_dahbif_ncb_wb_sel;
  output [3 :0] ncb_dahbif_prot;
  output ncb_dahbif_req;
  output ncb_dahbif_req_dp;
  output [1 :0] ncb_dahbif_size;
  output [31:0] ncb_dahbif_uc_ld_addr;
  output [31:0] ncb_dahbif_wdata;
  output ncb_dahbif_write;
  output [10:0] ncb_dbginfo;
  output ncb_xx_no_op;
  assign lsu_biu_amo_pmp_deny = 1'b0;
  assign lsu_mb_ex2_uc_addr_2 = 1'b0;
  assign lsu_mb_ex2_uc_bytes_vld = 4'b0;
  assign lsu_mb_ex2_uc_data = 32'b0;
  assign lsu_mb_ex2_uc_data_vld = 1'b0;
  assign lsu_mb_ex2_uc_data_vld_gate = 1'b0;
  assign lsu_mb_ex2_uc_dest_reg = 6'b0;
  assign lsu_mb_ex2_uc_fld = 1'b0;
  assign lsu_mb_ex2_uc_fls = 1'b0;
  assign lsu_mb_ex2_uc_lock = 1'b0;
  assign lsu_mb_ex2_uc_sc_data_vld = 1'b0;
  assign lsu_mb_ex2_uc_sign_ext = 1'b0;
  assign lsu_mb_ex2_uc_size = 2'b0;
  assign lsu_mb_ex2_uc_split = 1'b0;
  assign lsu_mb_ex2_uc_split_last = 1'b0;
  assign lsu_mb_ex2_uc_stall = 1'b0;
  assign lsu_xx_ex2_uc_flush = 1'b0;
  assign ncb_ag_async_expt_vld = 1'b0;
  assign ncb_ag_async_ld_inst = 1'b0;
  assign ncb_ag_async_mtval = 32'b0;
  assign ncb_ag_pmp_ld_inst = 1'b0;
  assign ncb_ag_pmp_mtval = 32'b0;
  assign ncb_ag_stall = 1'b0;
  assign ncb_dahbif_acc_deny = 1'b0;
  assign ncb_dahbif_lock = 1'b0;
  assign ncb_dahbif_lrsc = 1'b0;
  assign ncb_dahbif_ncb_wb_addr = 32'b0;
  assign ncb_dahbif_ncb_wb_sel = 1'b0;
  assign ncb_dahbif_prot = 4'b0;
  assign ncb_dahbif_req = 1'b0;
  assign ncb_dahbif_req_dp = 1'b0;
  assign ncb_dahbif_size = 2'b0;
  assign ncb_dahbif_uc_ld_addr = 32'b0;
  assign ncb_dahbif_wdata = 32'b0;
  assign ncb_dahbif_write = 1'b0;
  assign ncb_dbginfo = 11'b0;
  assign ncb_xx_no_op = 1'b0;
endmodule

module pa_lsu_stb(
  arb_stb_xx_grant,
  cp0_lsu_dcache_wb,
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_stb_acc_ecc,
  dahbif_stb_cmplt,
  dahbif_stb_grant,
  dahbif_stb_grant_2,
  dc_stb_addr,
  dc_stb_attr,
  dc_stb_bytes_vld,
  dc_stb_cache_hit,
  dc_stb_create_en,
  dc_stb_create_en_gate,
  dc_stb_data,
  dc_stb_dcache_dirty,
  dc_stb_dcache_inst,
  dc_stb_dcache_type,
  dc_stb_dcache_way,
  dc_stb_fls,
  dc_stb_lock_trans,
  dc_stb_sc_inst,
  dc_stb_shift,
  dc_stb_size,
  dc_stb_split_first,
  dc_stb_src1_depd,
  dc_stb_src1_reg,
  dc_stb_wait_lfb,
  dc_xx_addr,
  dc_xx_bytes_vld,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lfb_stb_done,
  lfb_stb_err,
  lfb_stb_fifo,
  lfb_stb_fifo_update,
  lfb_xx_idle,
  pad_yy_icg_scan_en,
  rdl_stb_cmplt_id,
  rdl_stb_dca_cmplt,
  rdl_stb_dca_grant,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_yy_xx_async_flush,
  stb_arb_data_bank,
  stb_arb_data_din,
  stb_arb_data_idx,
  stb_arb_data_req,
  stb_arb_data_way,
  stb_arb_data_wen,
  stb_arb_dcache_sel,
  stb_arb_dirty_din,
  stb_arb_dirty_idx,
  stb_arb_dirty_req,
  stb_arb_dirty_wen,
  stb_dahbif_addr,
  stb_dahbif_data,
  stb_dahbif_lock,
  stb_dahbif_prot,
  stb_dahbif_req,
  stb_dahbif_sc_inst,
  stb_dahbif_size,
  stb_dbginfo,
  stb_dc_async_expt,
  stb_dc_busy,
  stb_dc_full,
  stb_dc_hit_addr,
  stb_dc_hit_dca,
  stb_dc_hit_idx,
  stb_dc_ld_data,
  stb_dc_ld_fwd_vld,
  stb_dc_mtval,
  stb_dc_multi_or_part_hit,
  stb_dc_pop_en,
  stb_idle,
  stb_rdl_addr,
  stb_rdl_dca_type,
  stb_rdl_dirty,
  stb_rdl_id,
  stb_rdl_start,
  stb_rdl_way,
);
  input arb_stb_xx_grant;
  input cp0_lsu_dcache_wb;
  input cp0_lsu_icg_en;
  input cpurst_b;
  input dahbif_stb_acc_ecc;
  input dahbif_stb_cmplt;
  input dahbif_stb_grant;
  input dahbif_stb_grant_2;
  input [31:0] dc_stb_addr;
  input [2 :0] dc_stb_attr;
  input [3 :0] dc_stb_bytes_vld;
  input dc_stb_cache_hit;
  input dc_stb_create_en;
  input dc_stb_create_en_gate;
  input [31:0] dc_stb_data;
  input dc_stb_dcache_dirty;
  input dc_stb_dcache_inst;
  input [1 :0] dc_stb_dcache_type;
  input dc_stb_dcache_way;
  input dc_stb_fls;
  input dc_stb_lock_trans;
  input dc_stb_sc_inst;
  input [2 :0] dc_stb_shift;
  input [1 :0] dc_stb_size;
  input dc_stb_split_first;
  input dc_stb_src1_depd;
  input [4 :0] dc_stb_src1_reg;
  input dc_stb_wait_lfb;
  input [31:0] dc_xx_addr;
  input [7 :0] dc_xx_bytes_vld;
  input forever_cpuclk;
  input ifu_lsu_warm_up;
  input lfb_stb_done;
  input lfb_stb_err;
  input lfb_stb_fifo;
  input lfb_stb_fifo_update;
  input lfb_xx_idle;
  input pad_yy_icg_scan_en;
  input [1 :0] rdl_stb_cmplt_id;
  input rdl_stb_dca_cmplt;
  input rdl_stb_dca_grant;
  input [31:0] rtu_lsu_fgpr_wb_data;
  input [4 :0] rtu_lsu_fgpr_wb_reg;
  input rtu_lsu_fgpr_wb_vld;
  input rtu_yy_xx_async_flush;
  output [1 :0] stb_arb_data_bank;
  output [63:0] stb_arb_data_din;
  output [11:0] stb_arb_data_idx;
  output stb_arb_data_req;
  output [1 :0] stb_arb_data_way;
  output [3 :0] stb_arb_data_wen;
  output stb_arb_dcache_sel;
  output [2 :0] stb_arb_dirty_din;
  output [9 :0] stb_arb_dirty_idx;
  output stb_arb_dirty_req;
  output [2 :0] stb_arb_dirty_wen;
  output [31:0] stb_dahbif_addr;
  output [31:0] stb_dahbif_data;
  output stb_dahbif_lock;
  output [3 :0] stb_dahbif_prot;
  output stb_dahbif_req;
  output stb_dahbif_sc_inst;
  output [1 :0] stb_dahbif_size;
  output [23:0] stb_dbginfo;
  output stb_dc_async_expt;
  output stb_dc_busy;
  output stb_dc_full;
  output stb_dc_hit_addr;
  output stb_dc_hit_dca;
  output stb_dc_hit_idx;
  output [31:0] stb_dc_ld_data;
  output stb_dc_ld_fwd_vld;
  output [31:0] stb_dc_mtval;
  output stb_dc_multi_or_part_hit;
  output stb_dc_pop_en;
  output stb_idle;
  output [26:0] stb_rdl_addr;
  output [1 :0] stb_rdl_dca_type;
  output stb_rdl_dirty;
  output [1 :0] stb_rdl_id;
  output stb_rdl_start;
  output stb_rdl_way;
  assign stb_arb_data_bank = 2'b0;
  assign stb_arb_data_din = 64'b0;
  assign stb_arb_data_idx = 12'b0;
  assign stb_arb_data_req = 1'b0;
  assign stb_arb_data_way = 2'b0;
  assign stb_arb_data_wen = 4'b0;
  assign stb_arb_dcache_sel = 1'b0;
  assign stb_arb_dirty_din = 3'b0;
  assign stb_arb_dirty_idx = 10'b0;
  assign stb_arb_dirty_req = 1'b0;
  assign stb_arb_dirty_wen = 3'b0;
  assign stb_dahbif_addr = 32'b0;
  assign stb_dahbif_data = 32'b0;
  assign stb_dahbif_lock = 1'b0;
  assign stb_dahbif_prot = 4'b0;
  assign stb_dahbif_req = 1'b0;
  assign stb_dahbif_sc_inst = 1'b0;
  assign stb_dahbif_size = 2'b0;
  assign stb_dbginfo = 24'b0;
  assign stb_dc_async_expt = 1'b0;
  assign stb_dc_busy = 1'b0;
  assign stb_dc_full = 1'b0;
  assign stb_dc_hit_addr = 1'b0;
  assign stb_dc_hit_dca = 1'b0;
  assign stb_dc_hit_idx = 1'b0;
  assign stb_dc_ld_data = 32'b0;
  assign stb_dc_ld_fwd_vld = 1'b0;
  assign stb_dc_mtval = 32'b0;
  assign stb_dc_multi_or_part_hit = 1'b0;
  assign stb_dc_pop_en = 1'b0;
  assign stb_idle = 1'b0;
  assign stb_rdl_addr = 27'b0;
  assign stb_rdl_dca_type = 2'b0;
  assign stb_rdl_dirty = 1'b0;
  assign stb_rdl_id = 2'b0;
  assign stb_rdl_start = 1'b0;
  assign stb_rdl_way = 1'b0;
endmodule
