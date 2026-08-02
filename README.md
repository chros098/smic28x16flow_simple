# smic28x16flow_simple → SMIC 40nm GDS-only flow

最简物理设计流程：只跑到 **GDS 输出**。已按 `complex_mul32`（SMIC 40nm、
SCC40NLL VHSC40 LVT、12T）脚本的数据改造，纯 LEF 模式，无时序库 / QRC /
MMMC / SDC，无 CTS，无 StarRC/PT/RedHawk/Formality/Calibre。

## 流程

```
init → fp → place → route → dataout (GDS)
```

| 阶段 | 脚本 | 内容 |
|---|---|---|
| init | `pr/scr/01_invs_init.tcl` | 纯 LEF 模式导入网表 |
| fp | `pr/scr/02_invs_floorplan.tcl` + `002_floorplan_customize_template.tcl` | floorPlan -r 1.2 0.7 5 5 5 5、3 个固定面积 60000 µm² 宏 keep-out 区域（顶部 300×200、右下角 300×200、左下 L 形 250×160+100×200）、M7/M6 电源环 + M6 条纹 + sroute |
| place | `pr/scr/03_invs_place.tcl` | placeDesign（无时序优化） |
| route | `pr/scr/04_invs_route.tcl` | routeDesign（关闭 timing/SI driven） |
| dataout | `pr/scr/05_invs_dataout.tcl` | filler + netlist + GDS（pr/mergecell）+ DEF |

## 关键数据（来自 40nm 脚本）

- 设计名：`swerv_dual`（SweRV EH1 双核，约 160K std cell，无 SRAM）
- 网表：`netlist/cdl/swerv_dual.smic.gate.v`（相对 pr/work 解析为 `../../netlist/cdl/...`）
- Tech LEF：`/tgzn/data/techfile/smic40/std/librarya/Design_Start/SMIC/40nm_logic/lib/stdcell/smic/SCC40NLL_VHSC40_LVT/V0p1/lef/tf/scc40nll_10lm_2tm.lef`
- 单元 LEF：`.../V0p1/lef/macro/scc40nll_vhsc40_lvt.lef`
- 单元 GDS：`.../V0p1/gds/scc40nll_vhsc40_lvt.gds`
- Stream map：`/tgzn/project/user03/k/inn/smic40_ad/lib/streams.map`
- Filler：`F_FILL1_12TL40 ... F_FILL128_12TL40`（12T L40）
- Tap cell：`FILLTIE3_12TL40 ... FILLTIE128_12TL40`（12T L40，fp 阶段 `addWellTap` 插入，间隔 60 site）
- 电源：core ring M7(top/bottom)+M6(left/right) width 3 / spacing 2；M5-M8 条纹 width 4.5 / spacing 30（M5/M7 竖、M6/M8 横）
- Floorplan：aspect ratio 1.2、core utilization 0.7、margin 5

## 使用方法

```bash
./setup.sh <design> <netlist> [floorplan_def]
make dataout        # 或分步 make init / fp / place / route / dataout
```

输出在 `dataout/`：`gds/<design>.pr.gds.gz`、`gds/<design>.mergecell.gds.gz`（最终 GDS）、
`netlist/<design>.pr.vg.gz`、`def/<design>.def.gz`、`db/<design>.enc`。

## 运行前必须准备

1. `netlist/cdl/swerv_dual.smic.gate.v` 必须存在（或改 common_setup.tcl 里的路径）。
2. `lib/streams.map` 必须存在（40nm 工艺的 Innovus→GDS 层映射文件），
   目前只有目录，文件内容需从工艺库/公共目录拷贝，否则 `make dataout` 的
   streamOut 会失败。
3. `/tgzn/data/techfile/smic40/...` 等库路径在公司 EDA 服务器上必须可访问。

## 注意事项

- 无 CTS：时钟端口按普通信号线绕线。
- 无时序修复：place/route 不查时序，只保证物理正确性；可看
  `pr/rpts/place/*.checkPlace.rpt` 和 `pr/rpts/route/*.unrouted.rpt`。
- 原 40nm 脚本的输出目录/文件名（`batch_output/complex_mul323`、
  `${DESIGN_NAME}3.gds`）疑似多了个 "3"，本流程统一使用
  `<design>.pr.gds.gz` / `<design>.mergecell.gds.gz`。
- 若提供 floorplan DEF，`vars(fp_def_file)` 设置后 fp 步骤会自动加载，
   否则使用默认 `floorPlan -r 1.2 0.7 5 5 5 5`。
