# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /media/data/jychang/zcu106_freertos_demo/zcu106/platform.tcl
# 
# OR launch xsct and run below command.
# source /media/data/jychang/zcu106_freertos_demo/zcu106/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zcu106}\
-hw {/media/ylab115/Xilinx/Vitis/2021.2/data/embeddedsw/lib/fixed_hwplatforms/zcu106.xsa}\
-fsbl-target {psu_cortexr5_0} -out {/media/data/jychang/zcu106_freertos_demo}

platform write
domain create -name {freertos10_xilinx_psu_cortexr5_0} -display-name {freertos10_xilinx_psu_cortexr5_0} -os {freertos10_xilinx} -proc {psu_cortexr5_0} -runtime {cpp} -arch {32-bit} -support-app {freertos_hello_world}
platform generate -domains 
platform active {zcu106}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {freertos10_xilinx_psu_cortexr5_0}
platform generate -quick
platform generate
