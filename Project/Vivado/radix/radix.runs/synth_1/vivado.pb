
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental S:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/radix/radix.srcs/utils_1/imports/synth_1/radix.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2z
fS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/radix/radix.srcs/utils_1/imports/synth_1/radix.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
r
Command: %s
53*	vivadotcl2A
-synth_design -top radix -part xc7z010clg400-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
487282default:defaultZ8-7075h px? 
?
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
ES:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px? 
?
%s*synth2?
tStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1444.809 ; gain = 409.586
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
radix2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/top_level.vhd2default:default2
242default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
ctr_path2default:default2X
BS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/fsm.vhd2default:default2
552default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ctr_path2default:default2
02default:default2
12default:default2X
BS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/fsm.vhd2default:default2
552default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
uart_rx2default:default2\
FS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/uart_rx.vhd2default:default2
192default:default8@Z8-638h px? 
Y
%s
*synth2A
-	Parameter DBIT bound to: 8 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter SB_TICK bound to: 16 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
uart_rx2default:default2
02default:default2
12default:default2\
FS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/uart_rx.vhd2default:default2
192default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
uart_tx2default:default2\
FS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/uart_tx.vhd2default:default2
202default:default8@Z8-638h px? 
Y
%s
*synth2A
-	Parameter DBIT bound to: 8 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter SB_TICK bound to: 16 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
uart_tx2default:default2
02default:default2
12default:default2\
FS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/uart_tx.vhd2default:default2
202default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2%
input_ram_counter2default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/input_ram_counter.vhd2default:default2
162default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
input_ram_counter2default:default2
02default:default2
12default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/input_ram_counter.vhd2default:default2
162default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	input_ram2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/async_ram.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	input_ram2default:default2
02default:default2
12default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/async_ram.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2#
input_mux_shift2default:default2d
NS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/input_mux_shift.vhd2default:default2
142default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
input_mux_shift2default:default2
02default:default2
12default:default2d
NS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/input_mux_shift.vhd2default:default2
142default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2%
shift_rom_counter2default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_rom_counter.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
shift_rom_counter2default:default2
02default:default2
12default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_rom_counter.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	shift_rom2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_rom.vhd2default:default2
122default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	shift_rom2default:default2
02default:default2
12default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_rom.vhd2default:default2
122default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
shift2default:default2Z
DS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift.vhd2default:default2
122default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
shift2default:default2
02default:default2
12default:default2Z
DS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift.vhd2default:default2
122default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2'
shift_mux_ram_block2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2'
shift_mux_ram_block2default:default2
02default:default2
12default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2)
ram_block_rom_counter2default:default2j
TS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_rom_counter.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2)
ram_block_rom_counter2default:default2
02default:default2
12default:default2j
TS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_rom_counter.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2!
ram_block_rom2default:default2b
LS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_rom.vhd2default:default2
122default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
ram_block_rom2default:default2
02default:default2
12default:default2b
LS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_rom.vhd2default:default2
122default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2*
ram_block_mux_temp_ram2default:default2k
US:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_mux_temp_ram.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2*
ram_block_mux_temp_ram2default:default2
02default:default2
12default:default2k
US:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_mux_temp_ram.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2$
temp_ram_counter2default:default2e
OS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/temp_ram_counter.vhd2default:default2
162default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
temp_ram_counter2default:default2
02default:default2
12default:default2e
OS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/temp_ram_counter.vhd2default:default2
162default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
temp_ram2default:default2]
GS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/temp_ram.vhd2default:default2
222default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
temp_ram2default:default2
02default:default2
12default:default2]
GS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/temp_ram.vhd2default:default2
222default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2&
output_ram_counter2default:default2g
QS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/output_ram_counter.vhd2default:default2
162default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
output_ram_counter2default:default2
02default:default2
12default:default2g
QS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/output_ram_counter.vhd2default:default2
162default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2

output_ram2default:default2_
IS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/output_ram.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

output_ram2default:default2
02default:default2
12default:default2_
IS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/output_ram.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2%
ram_block_counter2default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_counter.vhd2default:default2
162default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
ram_block_counter2default:default2
02default:default2
12default:default2f
PS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block_counter.vhd2default:default2
162default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	ram_block2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block.vhd2default:default2
212default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	ram_block2default:default2
02default:default2
12default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/ram_block.vhd2default:default2
212default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
radix2default:default2
02default:default2
12default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/top_level.vhd2default:default2
242default:default8@Z8-256h px? 
?
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2&
shifted_signal_reg2default:default2
82default:default2
32default:default2Z
DS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift.vhd2default:default2
242default:default8@Z8-3936h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
tick2default:default2
radix2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/top_level.vhd2default:default2
252default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2&
temp_ram_input_mux2default:default2
radix2default:default2^
HS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/top_level.vhd2default:default2
332default:default8@Z8-3848h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2default:default2*
ram_block_mux_temp_ram2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2default:default2*
ram_block_mux_temp_ram2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2default:default2'
shift_mux_ram_block2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2default:default2'
shift_mux_ram_block2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2default:default2#
input_mux_shift2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2default:default2#
input_mux_shift2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
tx_done2default:default2
ctr_path2default:defaultZ8-7129h px? 
?
%s*synth2?
tFinished Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 1541.707 ; gain = 506.484
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1541.707 ; gain = 506.484
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7z010clg400-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1541.707 ; gain = 506.484
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
Loading part %s157*device2#
xc7z010clg400-12default:defaultZ21-403h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
state_reg_reg2default:default2
ctr_path2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
state_reg_reg2default:default2
uart_rx2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
state_reg_reg2default:default2
uart_tx2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                      s0 |                             0001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                      s1 |                             0010 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                      s2 |                             0100 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                      s3 |                             1000 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
state_reg_reg2default:default2
one-hot2default:default2
ctr_path2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    idle |                               00 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                   start |                               01 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                    data |                               10 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                    stop |                               11 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
state_reg_reg2default:default2

sequential2default:default2
uart_rx2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    idle |                               00 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                   start |                               01 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                    data |                               10 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                    stop |                               11 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
state_reg_reg2default:default2

sequential2default:default2
uart_tx2default:defaultZ8-3354h px? 
?
!inferring latch for variable '%s'327*oasys2
out0_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
462default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out1_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
482default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out2_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
502default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out3_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
522default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out4_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
542default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out5_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
562default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out6_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
582default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out7_reg2default:default2h
RS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/Source/shift_mux_ram_block.vhd2default:default2
602default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:06 . Memory (MB): peak = 1548.590 ; gain = 513.367
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 13    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 3     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 13    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 27    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 15    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 83    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 18    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input    1 Bit        Muxes := 8     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
y
/Removed RAM (%s) due to inactive write enable.
4980*oasys2&
output_ram/ram_reg2default:defaultZ8-7257h px? 
u
+Unused sequential element %s was removed. 
4326*oasys2&
output_ram/ram_reg2default:defaultZ8-6014h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$ctr_path/FSM_onehot_state_reg_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$ctr_path/FSM_onehot_state_reg_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$ctr_path/FSM_onehot_state_reg_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$ctr_path/FSM_onehot_state_reg_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2@
,uart_rx_unit/FSM_sequential_state_reg_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2@
,uart_rx_unit/FSM_sequential_state_reg_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2@
,uart_tx_unit/FSM_sequential_state_reg_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2@
,uart_tx_unit/FSM_sequential_state_reg_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out0_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out1_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out2_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out3_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out4_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out5_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out6_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[7]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[6]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[5]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[4]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[3]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[2]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[1]2default:default2
radix2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys23
shift_mux_ram_block/out7_reg[0]2default:default2
radix2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|      |Cell |Count |
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|1     |OBUF |     1|
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|1     |top      |       |     1|
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 93 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1724.871 ; gain = 689.648
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1726.8282default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1830.1092default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
17df5f3f2default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
612default:default2
932default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:152default:default2
00:00:152default:default2
1830.1092default:default2
802.4572default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2j
VS:/Dokumenter/Skole/CS-Master/CS4110/Project/Vivado/radix/radix.runs/synth_1/radix.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2t
`Executing : report_utilization -file radix_utilization_synth.rpt -pb radix_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Dec 11 23:25:48 20222default:defaultZ17-206h px? 


End Record