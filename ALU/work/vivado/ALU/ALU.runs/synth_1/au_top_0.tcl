# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.runs/synth_1/au_top_0.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a35tftg256-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib {
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu__1.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_adder_9.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_adder_XB_26.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_bool_11.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_cmp_12.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_mod_14.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_mul_13.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_shift_add_15.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_shifter_10.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_shiftleft_27.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_shiftright_28.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/alu_shiftright_mux_29.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/basket_fsm_2.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/button_conditioner_7.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_16.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_17.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_18.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_19.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_20.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/counter_22.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/edge_detector_21.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/edge_detector_8.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/full_adder_25.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/main_fsm_4.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/pipeline_24.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/pn_gen_23.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/rand_gen_5.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/regfile_3.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/reset_conditioner_6.v}
  {C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/vivado/ALU/ALU.srcs/sources_1/imports/verilog/au_top_0.v}
}
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/constraint/custom.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/work/constraint/custom.xdc}}]

read_xdc {{C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/constraint/customised.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Kaye/Desktop/ComStruc 50.002/alchitry/500021D/constraint/customised.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top au_top_0 -part xc7a35tftg256-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef au_top_0.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file au_top_0_utilization_synth.rpt -pb au_top_0_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
