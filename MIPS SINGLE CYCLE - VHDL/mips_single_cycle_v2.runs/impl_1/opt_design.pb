
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px? 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px? 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px? 
?

%s
*constraints2n
ZTime (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 500.789 ; gain = 7.6372default:defaulth px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px? 
A
,Implement Debug Cores | Checksum: 179a0f4f9
*commonh px? 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px? 
<
'Phase 1 Retarget | Checksum: 121e3ae3b
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.063 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
I
Eliminated %s cells.
10*opt2
02default:defaultZ31-10h px? 
H
3Phase 2 Constant propagation | Checksum: 121e3ae3b
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.098 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px? 
]
 Eliminated %s unconnected nets.
12*opt2
74742default:default8Z31-12h px? 
\
!Eliminated %s unconnected cells.
11*opt2
0	02default:default8Z31-11h px? 
8
#Phase 3 Sweep | Checksum: c220da53
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.149 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px? 
[
 Eliminated %s unconnected nets.
12*opt2
002default:default8Z31-12h px? 
\
!Eliminated %s unconnected cells.
11*opt2
0	02default:default8Z31-11h px? 
D
/Phase 4 BUFG optimization | Checksum: c220da53
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.255 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.002 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
I
4Ending Logic Optimization Task | Checksum: c220da53
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.260 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px? 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px? 
I
4Ending Power Optimization Task | Checksum: c220da53
*commonh px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.011 . Memory (MB): peak = 919.359 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:172default:default2
00:00:172default:default2
919.3592default:default2
426.2072default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0702default:default2
919.3592default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
sC:/Users/Hp/Desktop/an II/sem II/AC/Projects/mips_single_cycle_v2/mips_single_cycle_v2.runs/impl_1/test_env_opt.dcp2default:defaultZ17-1381h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
yC:/Users/Hp/Desktop/an II/sem II/AC/Projects/mips_single_cycle_v2/mips_single_cycle_v2.runs/impl_1/test_env_drc_opted.rptyC:/Users/Hp/Desktop/an II/sem II/AC/Projects/mips_single_cycle_v2/mips_single_cycle_v2.runs/impl_1/test_env_drc_opted.rpt2default:default8Z2-168h px? 


End Record