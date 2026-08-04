# XuanTie E906 -> SMIC40 逻辑综合（GDS-only 流程）

## 设计来源

- 开源仓库：https://github.com/XUANTIE-RV/opene906 （玄铁 E906，RV32IMA[F][D]C[P] 嵌入式 CPU）
- 本地 RTL：`src/`（`E906_RTL_FACTORY/gen_rtl` 完整拷贝，249 个文件）
- 顶层：`pa_core_top`（CPU 核：IFU/IDU/IU/LSU/CP0/RTU/PMP/BIU/CLK/RST/DTU/FPU/SYS_IO）

## 为什么选它

- 与 veer/swerv 不同，E906 源码里就有 **182 个 `gated_clk_cell` + 1 个 `BUFGCE` 的真实时钟门控实例**；
- 综合时把它们映射到 SMIC40 库的集成时钟门控单元 `CLKLAHQV4_12TL40`（锁存 + 与门，带测试使能 TE），
  展平后网表里有 **303 个 ICG**，不是 veer 那种 `assign Q = CP` 透传假时钟门控；
- SRAM/缓存阵列（icache/dcache/BHT）用零输出 stub 替换，**没有任何 SRAM 宏和寄存器堆**，全部是标准单元；
- 规模：**88,199 个 std cell、10,510 个触发器**，正好落在 8 万量级。

## 文件说明

| 文件 | 作用 |
|---|---|
| `src/` | E906 原始 RTL（含配置文件 `cpu_cfig.h` 等） |
| `e906_sram_stub.v` | 所有 `pa_spsram_*` 的零输出 stub（去掉 SRAM 阵列） |
| `e906_smic40_icg.v` | `gated_clk_cell`/`BUFGCE` -> `CLKLAHQV4_12TL40` 真实 ICG 映射 |
| `e906_dtu_stub.v` / `e906_dtu_hpcp_stub.v` | DTU / DTU+HPC 零输出 stub |
| `e906_stub_70k/65k/60k/55k/50k.v` | 五档删减的模块 stub（IFU 预测器、LSU 缓冲、IU 运算单元等） |
| `synth_e906_core.ys` | 单核 `pa_core_top` 综合脚本（推荐，~88K cells） |
| `synth_e906_core_dtu.ys` | 压规模版：DTU（调试触发单元）stub，~82.7K cells |
| `synth_e906_core_small.ys` | 更小版：DTU + HPC（性能计数器）stub，~77K cells |
| `synth_e906_core_70k/65k/60k/55k/50k.ys` | 五档递减规模综合脚本 |
| `synth_e906.ys` | 完整 `openE906` 综合脚本（含 CLIC/TDT/SYSMAP，~111K cells） |

## 复现

```bash
# 单核（~88K std cell）
yosys -s synth_e906_core.ys

# 压规模：只 stub DTU（~82.7K std cell，最接近 8 万）
yosys -s synth_e906_core_dtu.ys

# 压规模：stub DTU + HPC（~77K std cell）
yosys -s synth_e906_core_small.ys

# 五档递减规模（7万1 / 6万6 / 6万1 / 5万6 / 5万1）
yosys -s synth_e906_core_70k.ys
yosys -s synth_e906_core_65k.ys
yosys -s synth_e906_core_60k.ys
yosys -s synth_e906_core_55k.ys
yosys -s synth_e906_core_50k.ys

# 完整 openE906（~111K std cell）
yosys -s synth_e906.ys
```

输出网表：

- `netlist/cdl/e906_core.smic.gate.v`（9.0 MB，顶层 `pa_core_top`）
- `netlist/cdl/e906_core_dtu.smic.gate.v`（8.2 MB，顶层 `pa_core_top`，DTU stub）
- `netlist/cdl/e906_core_small.smic.gate.v`（8.0 MB，顶层 `pa_core_top`，DTU+HPC stub）
- `netlist/cdl/e906_core_70k/65k/60k/55k/50k.smic.gate.v`（7.9/7.5/7.1/6.7/6.1 MB，五档递减）
- `netlist/cdl/e906.smic.gate.v`（10.7 MB，顶层 `openE906`）

综合流程与之前 veer/swerv 完全一致：`synth -top` -> `setundef -zero` -> `dfflibmap` -> `abc` ->
`opt_clean` -> `write_verilog -noattr`，库为
`scc40nll_vhsc40_lvt_tt_v1p1_25c_basic.lib`。

## 质量检查（e906_core.smic.gate.v）

- 0 个 `always` 块、0 个 X 常量、0 个 Yosys 内部单元、0 个锁存器
- 无 SRAM/宏实例（`pa_spsram_*` 均为常量 0 stub，不是 SRAM 行为模型）
- 303 个 `CLKLAHQV4_12TL40` 真实 ICG，`gated_clk_cell` 内为 `OAO211V1 + CLKLAHQV`
- 全 SMIC40 标准单元，Innovus 可直接读取（与已跑通的 veer/swerv 网表同格式）

## 规模统计（展平后）

| 指标 | 数值 |
|---|---|
| 版本 | std cell 总数 | 触发器 | ICG |
|---|---|---|---|
| `e906_core`（保留原版） | 88,199 | 10,510 | 303 |
| `e906_core_dtu`（DTU stub） | 82,709 | 9,353 | 290 |
| `e906_core_small`（DTU+HPC stub） | 77,017 | 8,574 | 269 |
| `e906_core_70k` | 71,471 | 7,928 | 259 |
| `e906_core_65k` | 65,824 | 6,872 | 223 |
| `e906_core_60k` | 60,863 | 5,831 | 199 |
| `e906_core_55k` | 56,206 | 5,701 | 196 |
| `e906_core_50k` | 51,136 | 5,416 | 190 |
| `openE906`（完整芯片） | 111,290 | — | 577 |

所有版本均：0 个 `always`、0 个 X 常量、0 个 Yosys 内部单元、0 个锁存器、
无 SRAM/宏实例、全 SMIC40 标准单元，Innovus 可直接读取。

## 删减阶梯（每档在上档基础上新增 stub 的模块）

| 档位 | 新增删减的模块 |
|---|---|
| 88K -> 82.7K | DTU（调试触发单元） |
| 82.7K -> 77K | HPC（性能计数器） |
| 77K -> 71.5K | PMP、SYSMAP、BMU、SYS_IO、IFU BHT |
| 71.5K -> 65.8K | IFU BTB、IBUF、IFETCH、ICACHE 控制逻辑 |
| 65.8K -> 60.9K | LSU VB/NCB/STB 存储缓冲 |
| 60.9K -> 56.2K | IU 乘法器 |
| 56.2K -> 51.1K | IU 除法器、BJU、ALU |

保留部分：IDU/GPR、FPU、CP0、RTU、CLK/RST 等，设计仍可综合成纯标准单元网表。
