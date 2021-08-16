# dvsdclaa4bit_1v8
The object of this project to design a 4-bit CLA adder using open source EDA tools with SKYwater 130nm technology node. Here we also perform [RTL to GDSII flow](https://en.wikipedia.org/wiki/Design_flow_(EDA)) with all steps.

# Table of Contents
- [Prerequisites](#prerequisites)
- [Opensource Tools used](#opensource-tools-used)
- [Performance Specifications](#performance-specifications)
- [Block Diagram](#block-diagram)
- [Installation Instructions](#installation-instructions)
  * [eSim Installation](#esim-installation)
  * [Ngspice Installation](#ngspice-installation)
  * [Skywater Pdk Installation(Ubuntu)](#skywater-pdk-installation-ubuntu-)
  * [Magic Installation(Ubuntu)](#magic-installation-ubuntu-)
- [Prelayout Simulation in eSim and Ngspice](#prelayout-simulation-in-esim-and-ngspice)
  * [Schematic:](#schematic-)
  * [Adding Simulation parameters:](#adding-simulation-parameters-)
  * [Adding Sky130 parameters](#adding-sky130-parameters)
  * [Simulations in Ngspice](#simulations-in-ngspice)
      - [Output Vs. Input Plot](#output-vs-input-plot)
      - [Frequency Response Plot](#frequency-response-plot)
      - [Output Vs.Supply Plot](#output-vssupply-plot)
      - [Current Gain Vs. Output](#current-gain-vs-output)
- [Layout design in Magic](#layout-design-in-magic)
- [Post Layout Simulation](#post-layout-simulation)
  * [Output Vs. Input](#output-vs-input)
  * [Frequency Response Plot](#frequency-response-plot-1)
  * [Output Vs.Supply Plot](#output-vssupply-plot-1)
  * [Current Gain Vs. Output Plot](#current-gain-vs-output-plot)
- [Executing the Simulations](#executing-the-simulations)
  * [To execute prelayout simulations](#to-execute-prelayout-simulations-)
  * [To execute postlayout simulations](#to-execute-postlayout-simulations-)
- [Differences between Prelayout and Postlayout and Why?](#differences-between-prelayout-and-postlayout-and-why-)
- [Error Debugging help desk](#error-debugging-help-desk)
- [Future Scope](#future-scope)
- [Contributor](#contributor)
- [Acknowledgments](#acknowledgments)

# Prerequisites
- Ubuntu(prefer V18.0)
- min RAM 4GB
- Analog Electronics(cmos tech)
- git install in terminal and understanding of tcl language

# Opensource Tools used

- ## esim: 
eSim creates a circuit schematic using eeschema editor of Kicad. It allows the creation and modification of components and symbol libraries. It can serve as an alternative to commercially available/licensed software tools like OrCAD, Xpedition and HSPICE. For more info [refer](https://esim.fossee.in/home)
- ## ngspice:
Ngspice is a mixed-level/mixed-signal open source circuit simulator. Its code is based on three open source software packages: Spice3f5, Cider1b1 and Xspice. It is the open source successor of these venerable packages. Many, many modifications, bug fixes and improvements have been added to the code, yielding a stable and reliable simulator. Therefore, besides being used as a standalone simulator, Ngspice has been incorporated into many projects. For more info [refer](http://ngspice.sourceforge.net/)
- ## iverilog:
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the `vvp` command. For synthesis, the compiler generates netlists in the desired format. For more info [refer](http://iverilog.icarus.com/)
- ## gtk wave:
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. For more info [refer](http://gtkwave.sourceforge.net/)
- ## Skywater pdk:
The SkyWater Open Source PDK is a collaboration between Google and SkyWater Technology Foundry to provide a fully open source Process Design Kit and related resources, which can be used to create manufacturable designs at SkyWater's facility. As of May 2020, this repository is targeting the SKY130 process node. For more info [refer](https://skywater-pdk.readthedocs.io/en/latest/)
- ## Openlane:
OpenLANE is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault, OpenPhySyn, CVC, SPEF-Extractor, CU-GR, Klayout and custom methodology scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII - this capability will be released in the coming weeks with completed SoC design examples that have been sent to SkyWater for fabrication. For more info [refer](https://openlane.readthedocs.io/en/latest/)


# Performance Specifications

# Block Diagram
![image](https://github.com/AmanVerma-21/dvsdclaa4bit_1v8/blob/ad01ffe8c861473edc7242b49be7c29a54198739/g1.JPG)
# Installation guide
## eSim Installation
 Refer the following websites for installation of eSim :
 - https://esim.fossee.in/downloads
 - https://github.com/FOSSEE/eSim/blob/master/INSTALL
 
## Ngspice Installation
Ngspice gets installed alongwith eSim. If any other version ids to be installed refer: http://ngspice.sourceforge.net/download.html






































