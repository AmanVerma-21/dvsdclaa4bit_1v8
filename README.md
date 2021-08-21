# dvsdclaa4bit_1v8
The object of this project to design a 4-bit CLA adder using open source EDA tools with SKYwater 130nm technology node. Here we also perform [RTL to GDSII flow](https://en.wikipedia.org/wiki/Design_flow_(EDA)) with all steps.

# Table of Contents
- [Prerequisites](#prerequisites)
- [Opensource Tools used](#opensource-tools-used)
- [Performance Specifications](#performance-specifications)
- [Block Diagram](#block-diagram)
- [Installation Instructions](#installation-instructions)
  * [eSim and Ngspice Installation (Ubuntu)](#esim-and-ngspice-installation-ubuntu)
  * [Icarus Verilog and GTK wave Installation (Ubuntu)](#icarus-verilog-and-gtk-wave-installation-ubuntu)
  * [Openlane and sky130 pdk Installation](#openlane-and-sky130-pdk-installation)
- [Prelayout Simulation](#prelayout-simulation)
  * [In eSim and Ngpice](#in-esim-and-ngspice)
    * [Schematic](#schematic)
    * [Edit Netlist using sky130 pdk](#edit-netlist-using-sky130-pdk)
    * [Simulation in Ngspice](#simulation-in-ngspice)
        > [pre spice Output Vs. Input plot](#pre-spice-output-vs-input-plot)<br>
        > [Propagation Delay](#propagation-delay)
  * [In Iverilog and GTKwave](#in-iverilog-and-gtkwave)
    * [RTL code](#rtl-code)
    * [Simulation in GTKwave](#simulation-in-gtkwave)
        > [pre Output Vs. Input Plot](#pre-output-vs-input-plot)<br>
- [Physical Layout design flow](#physical-layout-design-flow)
  * [OpenLane Design Stages](#openlane-design-stages)
  * [Post Layout Simulation: In Iverilog and GTKwave](#post-layout-simulation-in-iverilog-and-gtkwave)
    * [Updated RTL code](#updated-rtl-code)
    * [Updated Simulation in GTKwave](#updated-simulation-in-gtkwave)
        > [post Output Vs. Input Plot](#post-output-vs-input-plot)<br>
- [Differences between Prelayout and Postlayout and Why?](#differences-between-prelayout-and-postlayout-and-why-)
- [Error Debugging help desk](#error-debugging-help-desk)
- [Future Scope](#future-scope)

# Prerequisites
- Ubuntu(prefer V18.0)
- min RAM 4GB
- Analog Electronics(cmos tech)
- git install in terminal and understanding of tcl language

# Opensource Tools used

> - [esim:](https://esim.fossee.in/home)   
eSim creates a circuit schematic using eeschema editor of Kicad. It allows the creation and modification of components and symbol libraries. It can serve as an alternative to commercially available/licensed software tools like OrCAD, Xpedition and HSPICE.
> - [ngspice:](http://ngspice.sourceforge.net/)  
Ngspice is a mixed-level/mixed-signal open source circuit simulator. Its code is based on three open source software packages: Spice3f5, Cider1b1 and Xspice. It is the open source successor of these venerable packages. Many, many modifications, bug fixes and improvements have been added to the code, yielding a stable and reliable simulator. Therefore, besides being used as a standalone simulator, Ngspice has been incorporated into many projects.
> - [iverilog:](http://iverilog.icarus.com/)  
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the `vvp` command. For synthesis, the compiler generates netlists in the desired format.
> - [gtk wave:](http://gtkwave.sourceforge.net/)  
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing.
> - [Skywater pdk:](https://skywater-pdk.readthedocs.io/en/latest/)  
The SkyWater Open Source PDK is a collaboration between Google and SkyWater Technology Foundry to provide a fully open source Process Design Kit and related resources, which can be used to create manufacturable designs at SkyWater's facility. As of May 2020, this repository is targeting the SKY130 process node.
> - [Openlane:](https://openlane.readthedocs.io/en/latest/)  
OpenLANE is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault, OpenPhySyn, CVC, SPEF-Extractor, CU-GR, Klayout and custom methodology scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII - this capability will be released in the coming weeks with completed SoC design examples that have been sent to SkyWater for fabrication.


# Performance Specifications
![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/69359785b2e4c62fca5e122ceacd12335502671a/spec.JPG)
# Block Diagram
![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/ad01ffe8c861473edc7242b49be7c29a54198739/g1.JPG)
- Internal flow of dvsdclaa4bit_1v8 chip  
![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/d04518e41b8c98ba54113d942bd54fa916596be7/g2.JPG)

# Installation Instructions
 ## eSim and Ngspice Installation (Ubuntu)
  Refer the following websites for installation of eSim :
  - https://esim.fossee.in/downloads
  - https://github.com/FOSSEE/eSim/blob/master/INSTALL
  Ngspice gets installed alongwith eSim. If any other version ids to be installed refer: http://ngspice.sourceforge.net/download.html

 ## Icarus Verilog and GTK wave Installation (Ubuntu)
  In terminal window run this command:
  `sudo apt install iverilog gtkwave`
  Enter the password.(if you have)

 ## Openlane and sky130 pdk Installation
  In terminal window run below given commands one by one:
  ```bash
     git clone https://github.com/The-OpenROAD-Project/OpenLane.git
     cd OpenLane/
     make openlane
     make pdk
     make test # This a ~5 minute test that verifies that the flow and the pdk were properly installed
 ```
# Prelayout Simulation 
 ## In eSim and Ngspice
 Refer following manual to know how to operate eSim:
 https://static.fossee.in/esim/manuals/eSim_Manual_2020_August.pdf
  - ### Schematic
  ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/88a55b0e11e86e4f49996dec90fcf0333bd42194/pre_design_spec_sheet/blck_dg.JPG)

  - individual block diagram using n- and p-mosfets:
  
  ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/88a55b0e11e86e4f49996dec90fcf0333bd42194/pre_design_spec_sheet/circuit_1.JPG)
  
  - ### Edit Netlist using sky130 pdk
  Add the sky130 devices and the libraries in .cir.out file
  For more [info](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/90991faf1390d26bbfa89970b4fae71d0e57ff2a/pre_design_spec_sheet/pdk_editing.md)
  After Editing we got this file:<br>
  [4b_cla_adder_test_1.cir](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/dcb911bd2fdf23a513d99c328bbc45a484c48ed7/pre_design_spec_sheet/spice_netlist/4b_cla_adder_test_1.cir)
  - ### Simulation in Ngspice
  Check here how to run Ngspice: http://ngspice.sourceforge.net/ngspice-tutorial.html
  ```
  $cd dvsdclaa4bit_1v8/pre_design_spec_sheet/spice_netlist
  $ngspice 4b_cla_adder_test_1.cir
  ```
   #### pre spice Output Vs. Input plot
   ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/26e1bc254d5ee79d5b9a9252eb4bad2eb8bb468b/pre_design_spec_sheet/out_img_2.JPG)
   #### Propagation Delay
   - approx 5ns propagation delay took for each output generating:  
   ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/e71be27970501889ab035358b31a37a92ceffc8f/pre_design_spec_sheet/out1.JPG)
  ## In Iverilog and GTKwave
  Refer following manual to know how to operate icarus verilog:
  https://iverilog.fandom.com/wiki/Getting_Started
   - ### RTL code  
   Here is the full code and test bench for 4-bit CLA adder:  
   [dvsdclaa_1v8.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/0a8c33a4e88a8006dfe124de7858168c8c74c08b/pre_design_spec_sheet/rtl_code/dvsdclaa_1v8.v)  
   [tb.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/0a8c33a4e88a8006dfe124de7858168c8c74c08b/pre_design_spec_sheet/rtl_code/tb.v)
   - ### Simulation in GTKwave
   run below terminal command:
   ```
   $cd dvsdclaa4bit_1v8/pre_design_spec_sheet/rtl_code
   $iverilog -o res tb.v dvsdclaa_1v8.v
   ```
   Now create the dumpfile(tb.vcd) of testbench flow:  
   `$vvp res.out`<br>
   And use gtkwave for visualisation <br>
   `$gtkwave tb.vcd`
   #### pre Output Vs. Input Plot
   ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/7f79996a208cc67d742dbe890bb63a1ae63df0d0/pre_design_spec_sheet/gtk_ubu.JPG)
# Physical Layout design flow
  ## OpenLane Design Stages

  OpenLane flow consists of several stages. By default all flow steps are run in sequence. Each stage may consist of multiple sub-stages. OpenLane can also be run interactively as shown [here](https://github.com/The-OpenROAD-Project/OpenLane/blob/40ada4699c2bbee45b273d5683849331e963488a/docs/source/advanced_readme.md).<br>
  run given command in terminal and pwd should be `/Openlane`<br>
  `make mount`  
  Now, we are in docker<br>  
  ```bash
        ./flow.tcl -interactive  
        package require openlane  
        prep -design cla_adder_4bit -tag rn_1 -init_design_config -src cla_adder_4it.v  
  ```
![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/5ca2c302bddf12c670b96d8bee9c51dded52a3b5/post_layout/invoki_opnln.JPG)
after this there are some steps we need to do:

  1. **Synthesis**
      ```bash
             run_synthesis
      ```
      1. `yosys` - Performs RTL synthesis
      2. `abc` - Performs technology mapping
      3. `OpenSTA` - Performs static timing analysis on the resulting netlist to generate timing reports
      ### synthesis statistics view
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_synth_statis.JPG)
      ### synthesis generated netlist
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_synth_netlist.JPG)
  2. **Floorplan and PDN**
      ```bash
      run_floorplan
      ```
      
      1. `init_fp` - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
      2. `ioplacer` - Places the macro input and output ports
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_florpln_ioplcaer.JPG)
      4. `pdn` - Generates the power distribution network
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_florpln_pdn.JPG)
      6. `tapcell` - Inserts welltap and decap cells in the floorplan
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_florpln_tapecell.JPG)
      ### floorplan view 
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_florpln_deffile.JPG)
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_florpln_msgview.JPG)
  3. **Placement**
      ```bash
      run_placement
      ```
      1. `RePLace` - Performs global placement
      2. `Resizer` - Performs optional optimizations on the design
      3. `OpenDP` - Perfroms detailed placement to legalize the globally placed components
      ### after placement
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_placement.JPG)
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_placement_magview.JPG)
      
  4. **CTS**
      ```bash
      run_cts
      ```
      1. `TritonCTS` - Synthesizes the clock distribution network (the clock tree)
  5. **Routing**
      ```bash
      run_routing
      ```
      1. `FastRoute` - Performs global routing to generate a guide file for the detailed router
      2. `CU-GR` - Another option for performing global routing.
      3. `TritonRoute` - Performs detailed routing
      4. `SPEF-Extractor` - Performs SPEF extraction
      ### after routing
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_routing_magview.JPG)
      
  6. **GDSII Generation**
      
      ```bash
      run_magic
      run_magic_spice_export
      ```
      1. `Magic` - Streams out the final GDSII layout file from the routed def
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/fa9ebb45db4c2fc05d378575444882bbdfb570d2/post_layout/ss_magicview.JPG)
      3. `Klayout` - Streams out the final GDSII layout file from the routed def as a back-up
      ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/5ca2c302bddf12c670b96d8bee9c51dded52a3b5/post_layout/layout_gds_view.JPG)
  7. **Checks**
      ```bash
      run_magic_drc
      run_lvs
      run_antenna_check
      ```
      1. `Magic` - Performs DRC Checks & Antenna Checks
      2. `Klayout` - Performs DRC Checks
      3. `Netgen` - Performs LVS Checks
      4. `CVC` - Performs Circuit Validity Checks

## Post Layout Simulation: In Iverilog and GTKwave
   ### Updated RTL code
   Here is the full code of updated code by using sky130 pdk and test bench for 4-bit CLA adder:  
   [cla_adder_4bit.synthesis.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/6b65292b4650795e384054156e68353371512ee3/post_layout/rtl_code/cla_adder_4bit.synthesis.v)  
   [tb_1.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/6b65292b4650795e384054156e68353371512ee3/post_layout/rtl_code/tb_1.v)
   here we also need sky130 rtl libary for executing above files:
   [primitives.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/4ea59c7982353a97e1d7d8cc4158bfe03da378f5/post_layout/rtl_code/primitives.v)
   [sky130_fd_sc_hd.v](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/4ea59c7982353a97e1d7d8cc4158bfe03da378f5/post_layout/rtl_code/sky130_fd_sc_hd.v)
   ### Updated Simulation in GTKwave
   run below code in terminal command:
   ```
   $cd dvsdclaa4bit_1v8/post_layout/rtl_code
   $iverilog -o res tb_1.v cla_adder_4bit.synthesis.v
   ```
   Now create the dumpfile(tb.vcd) of testbench flow:  
   `$vvp res.out`<br>
   And use gtkwave for visualisation <br>
   `$gtkwave tb_1.vcd`
   #### post Output Vs. Input Plot
   ![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/7f79996a208cc67d742dbe890bb63a1ae63df0d0/pre_design_spec_sheet/gtk_ubu.JPG)
   
# Future Scope
  >> **Design more ips and assemble all of them in single ip to design ALU and try to make accurate iterfacing with each other by using protocols.** 
