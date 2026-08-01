##################################
## Simplified procs for the GDS-only flow
##################################

proc invsRunTimeCalculation {args} {
  global vars
  set action [lindex $args 0]
  if {$action == "-start"} {
    set vars(run_start_time) [clock seconds]
    puts "<ICL> step started at [clock format $vars(run_start_time) -format {%Y-%m-%d %H:%M:%S}]"
  } else {
    set end [clock seconds]
    set elapsed [expr $end - $vars(run_start_time)]
    puts "<ICL> step ended at [clock format $end -format {%Y-%m-%d %H:%M:%S}], elapsed ${elapsed}s"
  }
}

proc invs_exit {} {
  global vars
  exec touch ../../.flag/$vars(step)
  puts "<ICL> touched ../../.flag/$vars(step)"
  exit
}

proc invsReportLogErrors {} {
  if { [catch {exec grep -i Error [getLogFileName]} ret_var] == 0 } {
    puts "Info: Error keyword detected in [getLogFileName]"
    puts "$ret_var"
  }
}

proc invsAddFillerCells {} {
  global vars
  setFillerMode -reset
  setFillerMode -fitGap true
  addFiller -cell $vars(filler_cells) -prefix FILLER
}

proc invsSaveNetlist {} {
  global vars
  set base_path [pwd]
  set dsn_gate_dir "$base_path/../../dataout/netlist"
  exec mkdir -p $dsn_gate_dir
  deleteDanglingPort
  deleteEmptyModule
  saveNetlist $dsn_gate_dir/[dbgDesignName].pr.vg.gz
  puts "<ICL> netlist saved: $dsn_gate_dir/[dbgDesignName].pr.vg.gz"
}

proc invsSaveGds {} {
  global vars
  set base_path [pwd]
  set dsn_gds_dir "$base_path/../../dataout/gds"
  exec mkdir -p $dsn_gds_dir
  setStreamOutMode -reset
  setStreamOutMode -labelAllPinShape true -virtualConnection false
  streamOut $dsn_gds_dir/[dbgDesignName].pr.gds.gz \
    -mapFile $vars(TECH_MAP_INVS) -libName [dbgDesignName] \
    -structureName [dbgDesignName] -stripes 1 -units 1000 \
    -mode ALL -dieAreaAsBoundary
  puts "<ICL> GDS saved: $dsn_gds_dir/[dbgDesignName].pr.gds.gz"
  if {$vars(merge_gds) == "true"} {
    streamOut $dsn_gds_dir/[dbgDesignName].mergecell.gds.gz \
      -merge $vars(GDS_LIBS) -mapFile $vars(TECH_MAP_INVS) -libName [dbgDesignName] \
      -structureName [dbgDesignName] -stripes 1 -units 1000 -uniquifyCellNames \
      -mode ALL -dieAreaAsBoundary
    puts "<ICL> merged GDS saved: $dsn_gds_dir/[dbgDesignName].mergecell.gds.gz"
  }
  exec mkdir -p $base_path/../../dataout/db
  saveDesign $base_path/../../dataout/db/[dbgDesignName].enc -tcon
}

proc invsSaveAllDef {} {
  global vars
  set base_path [pwd]
  set dsn_def_dir "$base_path/../../dataout/def"
  exec mkdir -p $dsn_def_dir
  defOut $dsn_def_dir/[dbgDesignName].def.gz
  puts "<ICL> DEF saved: $dsn_def_dir/[dbgDesignName].def.gz"
}
