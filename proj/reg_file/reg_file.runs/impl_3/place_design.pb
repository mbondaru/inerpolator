
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a50t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a50t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
42default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.682default:default2
00:00:00.742default:default2
2659.5392default:default2
0.0002default:default2
1552default:default2
630512default:defaultZ17-722h px� 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: d047f666
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.72 ; elapsed = 00:00:00.87 . Memory (MB): peak = 2659.539 ; gain = 0.000 ; free physical = 155 ; free virtual = 630512default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.662default:default2
00:00:00.662default:default2
2659.5392default:default2
0.0002default:default2
1472default:default2
630432default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place20
PIX_CNT_DISPLAY/t_cnt[2]_i_22default:default2
32default:default2�
�	CONVERTER_CNT_DISPLAY/t_cnt_reg[0] {FDCE}
	CONVERTER_CNT_DISPLAY/t_cnt_reg[1] {FDCE}
	CONVERTER_CNT_DISPLAY/t_cnt_reg[2] {FDCE}
2default:defaultZ30-568h px� 
�
Place Check : %s
543*place2�
�This design requires more Register as Flip Flop cells than are available in the target device. This design requires 74942 of such cell types but only 65200 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device.2default:defaultZ30-640h px� 
�
Place Check : %s
543*place2�
�This design requires more Slice Registers cells than are available in the target device. This design requires 74943 of such cell types but only 65200 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device.2default:defaultZ30-640h px� 
�
Place Check : %s
543*place2�
�This design requires more Slice LUTs cells than are available in the target device. This design requires 99149 of such cell types but only 32600 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device. Please set tcl parameter "drc.disableLUTOverUtilError" to 1 to change this error to warning.2default:defaultZ30-640h px� 
�
Place Check : %s
543*place2�
�This design requires more LUT as Logic cells than are available in the target device. This design requires 99149 of such cell types but only 32600 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device. Please set tcl parameter "drc.disableLUTOverUtilError" to 1 to change this error to warning.2default:defaultZ30-640h px� 
�
Place Check : %s
543*place2�
�This design requires more FDRE cells than are available in the target device. This design requires 74880 of such cell types but only 65650 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device.2default:defaultZ30-640h px� 
�
Place Check : %s
543*place2�
�This design requires more LUT6 cells than are available in the target device. This design requires 35900 of such cell types but only 32600 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device.2default:defaultZ30-640h px� 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1126707f6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:26 ; elapsed = 00:01:03 . Memory (MB): peak = 2666.320 ; gain = 6.781 ; free physical = 113 ; free virtual = 628372default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 1126707f6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:26 ; elapsed = 00:01:03 . Memory (MB): peak = 2666.320 ; gain = 6.781 ; free physical = 112 ; free virtual = 628372default:defaulth px� 
�
�Placer failed with error: '%s'
Please review all ERROR and WARNING messages during placement to understand the cause for failure.
1*	placeflow2�
�Implementation Feasibility check failed, Please see the previously displayed individual error or warning messages for more details.2default:defaultZ30-99h px� 
>
)Ending Placer Task | Checksum: 1126707f6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:26 ; elapsed = 00:01:03 . Memory (MB): peak = 2666.320 ; gain = 6.781 ; free physical = 112 ; free virtual = 628372default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
412default:default2
12default:default2
02default:default2
82default:defaultZ4-41h px� 
N

%s failed
30*	vivadotcl2 
place_design2default:defaultZ4-43h px� 
m
Command failed: %s
69*common28
$Placer could not place all instances2default:defaultZ17-69h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Aug 16 12:02:32 20242default:defaultZ17-206h px� 


End Record