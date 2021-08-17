- In generated netlist mosfet representation look like:
    ``M9  Net-_M14-Pad2_ /B1 /vdd /vdd mosfet_p		
      M7  Net-_M14-Pad2_ /B1 GND GND mosfet_n	``
      edit this with:
      ``xM9  Net-_M14-Pad2_ B1 vdd vdd sky130_fd_pr__pfet_01v8 w=.55 l=.15		
        xM7  Net-_M14-Pad2_ B1 GND GND sky130_fd_pr__nfet_01v8 w=.42 l=.15``
- Add the pdk library path in netlist and put it in the same folder where pdk lib is.
  `.lib "skywater-pdk-libs-sky130_fd_pr-main/models/sky130.lib.spice" tt`
- set the input parameters and power supply values:
  ``vdd vdd 0 1.95
    vc0 C0 0 pulse(0 1.88 0ps 1ps 1ps 2.5us 5us)
    va0 A0 0 pulse(0 1.88 0ps 1ps 1ps 5us 10us)
    va1 A1 0 pulse(0 1.88 0ps 1ps 1ps 10us 20us)
    va2 A2 0 pulse(0 1.88 0ps 1ps 1ps 20us 40us)
    va3 A3 0 pulse(0 1.88 0ps 1ps 1ps 40us 80us)
    vb0 B0 0 pulse(0 1.88 0ps 1ps 1ps 80us 160us)
    vb1 B1 0 pulse(0 1.88 0ps 1ps 1ps 160us 320us)
    vb2 B2 0 pulse(0 1.88 0ps 1ps 1ps 320us 640us)
    vb3 B3 0 pulse(0 1.88 0ps 1ps 1ps 640us 1280us)
    .tran .5us 100us``
- write code for plot output values inside run statement:
  ``plot v(C0)-8 v(A0)-6 v(A1)-4 v(A2)-2 v(A3) v(B0)+2 v(B1)+4 v(B2)+6 v(B3)+8
    plot v(S0_0)-4 v(S1)-2 v(S2) v(S3)+2 v(C4)+4``
- That's it, save and run this file
