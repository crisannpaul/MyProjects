# 
# Synthesis run script generated by Vivado
# 

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
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.cache/wt [current_project]
set_property parent.project_path C:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_repo_paths {{e:/My Shit/facultate/an3/sem I/SSC/vivado-library-2016.4-1/vivado-library}} [current_project]
set_property ip_output_repo c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/hdl/Microblaze_Block_Design_wrapper.v
add_files C:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/Microblaze_Block_Design.bd
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_clk_wiz_0_0/Microblaze_Block_Design_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_clk_wiz_0_0/Microblaze_Block_Design_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_clk_wiz_0_0/Microblaze_Block_Design_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_microblaze_0_0/Microblaze_Block_Design_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_microblaze_0_0/Microblaze_Block_Design_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_microblaze_0_0/Microblaze_Block_Design_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_mdm_1_0/Microblaze_Block_Design_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_mdm_1_0/Microblaze_Block_Design_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_rst_clk_wiz_0_100M_0/Microblaze_Block_Design_rst_clk_wiz_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_rst_clk_wiz_0_100M_0/Microblaze_Block_Design_rst_clk_wiz_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_rst_clk_wiz_0_100M_0/Microblaze_Block_Design_rst_clk_wiz_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_uartlite_0_0/Microblaze_Block_Design_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_uartlite_0_0/Microblaze_Block_Design_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_uartlite_0_0/Microblaze_Block_Design_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_dlmb_v10_0/Microblaze_Block_Design_dlmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_dlmb_v10_0/Microblaze_Block_Design_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_ilmb_v10_0/Microblaze_Block_Design_ilmb_v10_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_ilmb_v10_0/Microblaze_Block_Design_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_dlmb_bram_if_cntlr_0/Microblaze_Block_Design_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_ilmb_bram_if_cntlr_0/Microblaze_Block_Design_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_lmb_bram_0/Microblaze_Block_Design_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/src/PmodTMP3_axi_iic_0_0/PmodTMP3_axi_iic_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/src/PmodTMP3_axi_iic_0_0/PmodTMP3_axi_iic_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/src/PmodTMP3_pmod_bridge_0_0/PmodTMP3_pmod_bridge_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/src/PmodTMP3_pmod_bridge_0_0/src/pmod_concat_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/Microblaze_Block_Design_PmodTMP3_0_2_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodTMP3_0_2/src/PmodTMP3_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_xbar_0/Microblaze_Block_Design_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_gpio_0_0/Microblaze_Block_Design_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_gpio_0_0/Microblaze_Block_Design_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_gpio_0_0/Microblaze_Block_Design_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_intc_0_0/Microblaze_Block_Design_axi_intc_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_intc_0_0/Microblaze_Block_Design_axi_intc_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_axi_intc_0_0/Microblaze_Block_Design_axi_intc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_pmod_bridge_0_0/PmodDPG1_pmod_bridge_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_pmod_bridge_0_0/src/pmod_concat_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/Microblaze_Block_Design_PmodDPG1_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_axi_quad_spi_0_0/PmodDPG1_axi_quad_spi_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_axi_quad_spi_0_0/PmodDPG1_axi_quad_spi_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_axi_quad_spi_0_0/PmodDPG1_axi_quad_spi_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/ip/Microblaze_Block_Design_PmodDPG1_0_0/src/PmodDPG1_axi_quad_spi_0_0/PmodDPG1_axi_quad_spi_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all C:/Users/pault/Desktop/semI/SSC/Microblaze/Microblaze.srcs/sources_1/bd/Microblaze_Block_Design/Microblaze_Block_Design_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top Microblaze_Block_Design_wrapper -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Microblaze_Block_Design_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Microblaze_Block_Design_wrapper_utilization_synth.rpt -pb Microblaze_Block_Design_wrapper_utilization_synth.pb"
