# SweRV EH1 双核设计（~160K std cell）

## 来源

- RTL：OpenROAD-flow-scripts 里 Western Digital SweRV EH1 的 sv2v 转换版
  （`swerv_wrapper.sv2v.v`，纯 Verilog，6.3MB）
- `swerv_dual.v`：由 `gen_swerv_dual.py` 自动生成的双核包装
  （两个 swerv 实例共享 clk/rst_l，其余 217 个端口复制为 `_0`/`_1`）
- `openroad_clkgate.v`：ORFS 时钟门控单元的空实现（透传时钟），
  GDS-only 流程不需要真正的门控

## 规模（本地 SMIC40 lib 实测）

| 设计 | 顶层 | std cell 数（展平） | 触发器数 |
|---|---|---|---|
| swerv 单核 | `swerv` | ~76,500 | ~14,300 |
| **swerv 双核** | `swerv_dual` | **160,452** | **28,594** |

双核网表：`netlist/cdl/swerv_dual.smic.gate.v`（7.5MB）

## 质量保证

- 纯结构网表：0 个 always 块、0 个 Yosys 内部单元、0 个 X 常量、
  0 个路径标注，Innovus 可直接读取
- 无 SRAM：全标准单元实现（无宏实例、无黑盒）

## 重新生成

```bash
python3 gen_swerv_dual.py <swerv_wrapper.sv2v.v 路径> swerv_dual.v
yosys -s synth_swerv_dual.ys
```
