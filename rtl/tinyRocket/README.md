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

## 两种综合方式

### 方式 A：纯标准单元（无宏，本仓库默认）

`behav_srams.v` 提供 3 个黑盒的行为级 SRAM 模型，Yosys 会把 cache
综合成寄存器阵列，网表不含任何宏实例：

```bash
cd rtl/tinyRocket
yosys -s synth_rocket_tile.ys
# 输出 RocketTile.gate.v（通用单元，无 X 常量）
# 映射 SMIC40 库：编辑 map_smic40.ys 里的 .lib 路径后
yosys -s map_smic40.ys
# 输出 RocketTile.smic.gate.v，拷到 netlist/cdl/RocketTile.v 后接 Innovus 流程
```

### 方式 B：SRAM 宏（面积更小，适合 DefaultConfig 等大 cache）

综合时不读 `behav_srams.v`，保留 `data_arrays_*_ext` / `tag_array_ext`
黑盒，在 Innovus 中映射到 SRAM 宏（需要宏 LEF/GDS，且 fp 脚本中把
实例放到 keep-out 区域）。
