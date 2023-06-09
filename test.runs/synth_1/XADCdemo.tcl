# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.runs/synth_1/XADCdemo.tcl"
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
set_param chipscope.maxJobs 2
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_mem {
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/pal_file.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/bullet_blackbg.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Heart.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien1.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/pal24bit.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien3.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien2.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Heart_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/bullet_blackbg_PAL.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Rocket_v2_Pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Rocket_v2.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/StartScreen_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/StartScreen.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/eight.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/five.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/nine.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/four.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/one.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/six.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/two.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/seven.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/three.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/three_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/two_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/one_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/zero.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/zero_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/GameOver.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/GameOver_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/six_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/five_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/four_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/nine_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/seven_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/eight_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/star_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/star.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/planet02_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/planet01_pal.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/planet02.mem}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/planet01.mem}
}
read_verilog -library xil_defaultlib {
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien1Rom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien2Rom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Alien3Rom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/AlienSprites_2.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/DigitToSeg.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/EightRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/EndSprite.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/FiveRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/FourRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/LiveRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/NineRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/OneRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/PlanetROM1.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/PlanetROM2.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/RealEndScreenRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/RealStartScreenRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/RocketRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/RocketSprite.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/SevenRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/SixRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/StarRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/StartScreenRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/StartSprite.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/ThreeRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/Top.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/TwoRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/ZeroRom.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/new/bulletROM.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/new/bulletSprite.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/counter3bit.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/decoder3_8.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/mux4_4bus.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/segClkDevider.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/sevensegdecoder.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/new/vga640x480.v}
  {C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/imports/hdl/XADCdemo.v}
}
read_ip -quiet {{C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xdc}}]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/constrs_1/imports/constraints/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Jampack/OneDrive - Habib University/DLD Project/FinalProject2/test.srcs/constrs_1/imports/constraints/Basys3_Master.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top XADCdemo -part xc7a35tcpg236-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef XADCdemo.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file XADCdemo_utilization_synth.rpt -pb XADCdemo_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
