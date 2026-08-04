// E906 tier-70k stubs (GDS-only flow). Constant-zero outputs.

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
