# tinyRocket (Rocket Chip TinyConfig)

RISC-V Rocket Chip 生成 RTL（纯 Verilog，非 SystemVerilog）。

- 源项目: https://github.com/chipsalliance/rocket-chip
- 文件来源: OpenROAD-flow-scripts `flow/designs/src/tinyRocket/`
  https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
- 配置: `freechips.rocketchip.system.TinyConfig`
- 顶层模块: `RocketTile`

## 说明

- 文件为 Verilog-2005 格式（`.v`），已用 Yosys 0.67 验证：
  `read_verilog` + `hierarchy -top RocketTile` + `proc/opt/techmap` 通过。
- RTL 内**不含 SRAM 实现**，L1 cache 的存储体以黑盒模块形式存在：
  `data_arrays_0_ext`、`data_arrays_0_0_ext`、`tag_array_ext`，
  综合/APR 阶段需映射到 SRAM macro（对应流程中的 3 个 macro）。
- 许可证：Berkeley（BSD）与 SiFive 社区许可，见 ORFS 源仓库对应 LICENSE 文件。
