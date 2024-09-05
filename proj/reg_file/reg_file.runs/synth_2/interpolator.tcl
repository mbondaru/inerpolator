# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
create_project -in_memory -part xc7a200tifbg484-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.cache/wt [current_project]
set_property parent.project_path /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/RS_2.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/add_1b.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/add_8b.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/add_9b.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/avger.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/avger_g.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/converter.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/counter_3b.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/interp_1_sqrt5_3.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/line_counter.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/reg_column.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/reg_file.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/imports/new/register_8b.vhd
  /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/new/interpolator.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/constrs_1/imports/new/interpolator_8b_constraints.xdc
set_property used_in_implementation false [get_files /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/constrs_1/imports/new/interpolator_8b_constraints.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top interpolator -part xc7a200tifbg484-1L -verbose


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef interpolator.dcp
create_report "synth_2_synth_report_utilization_0" "report_utilization -file interpolator_utilization_synth.rpt -pb interpolator_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]