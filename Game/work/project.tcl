set projDir "C:/Users/Kaye/Desktop/DropperTest/work/vivado"
set projName "DropperTest"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Kaye/Desktop/DropperTest/work/verilog/au_top_0.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/score_to_4_digits_1.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/bin_to_led_2.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu__3.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/basket_fsm_4.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/regfile_5.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/main_fsm_6.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/rand_gen_7.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/rand_gen2_8.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/multi_seven_seg_9.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/reset_conditioner_10.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/button_conditioner_11.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/edge_detector_12.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_mod_13.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_adder_14.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_shifter_15.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_bool_16.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_cmp_17.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_mul_18.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_shift_add_19.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_20.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_21.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_22.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_23.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_24.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/edge_detector_25.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_26.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/pn_gen_27.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_28.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/counter_29.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/seven_segment_30.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/decoder_31.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/pipeline_32.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/full_adder_33.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_adder_XB_34.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_shiftleft_35.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_shiftright_36.v" "C:/Users/Kaye/Desktop/DropperTest/work/verilog/alu_shiftright_mux_37.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Kaye/Desktop/DropperTest/work/constraint/custom.xdc" "C:/Users/Kaye/Desktop/DropperTest/constraint/customised.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
