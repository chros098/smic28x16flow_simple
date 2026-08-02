# SweRV EH2 (Veer) 双核设计（~166K std cell）

## 来源

- RTL：Western Digital SweRV EH2（代号 Veer），
  https://github.com/chipsalliance/Cores-SweRV
- `veer.sv2v.v`：sv2v 转换后的纯 Verilog（925KB，110 个模块，顶层 `veer`）
- `veer_dual.v`：由 `../swerv/gen_swerv_dual.py` 生成的双核包装
  （两个 veer 实例共享 clk/rst_l，其余端口复制为 `_0`/`_1`）

## 转换步骤（可复现）

```bash
# 1) 生成 ASIC 配置（关闭 fpga_optimize，保留时钟门控模块定义）
RV_ROOT=$PWD BUILD_PATH=veer_config perl configs/veer.config -unset=fpga_optimize

# 2) 时钟门控锁存改为透传（GDS-only 流程不需要真实 ICG）
#    修改 design/lib/beh_lib.sv 中 `TEC_RV_ICG 模块：assign Q = CP;

# 3) sv2v 转纯 Verilog（defines 文件放在最前）
sv2v -I design/include -I veer_config --write=veer.sv2v.v \
     veer_config/common_defines.vh veer_config/pd_defines.vh \
     $(find design -name '*.sv')
```

## 规模（本地 SMIC40 lib 实测，展平统计）

| 设计 | 顶层 | std cell 数 | 触发器数 |
|---|---|---|---|
| veer 单核 | `veer` | 83,255 | 14,320 |
| **veer 双核** | `veer_dual` | **166,512** | **28,640** |

双核网表：`netlist/cdl/veer_dual.smic.gate.v`（7.7MB）

## 质量保证

- 纯结构网表：0 个 always 块、0 个 Yosys 内部单元、0 个 X 常量、
  0 个路径标注，Innovus 可直接读取
- 无 SRAM：全标准单元实现（无宏实例、无黑盒）
- 时钟门控（CKLNQD/ICG）为透传实现，不影响物理流程

## 重新生成

```bash
python3 ../swerv/gen_swerv_dual.py veer.sv2v.v veer_dual.v veer
yosys -s synth_veer_dual.ys
```
