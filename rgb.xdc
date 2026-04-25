# arty_a7_exact.xdc - COMPLETE FIXED VERSION

## Clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Tell Vivado this is a 100 MHz clock (10 ns period)
create_clock -name sys_clk -period 10.000 [get_ports clk]
## Button - BTN0 for write operation 
# Note: We're using BTN0 for both reset and write, so we need to choose one
# Let's use BTN0 for reset and use a different approach for write

## Switches
set_property PACKAGE_PIN A8 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN C11 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN C10 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN A10 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

## LEDs LD4-LD7
set_property PACKAGE_PIN H5 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]
set_property PACKAGE_PIN J5 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property PACKAGE_PIN T9 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]
set_property PACKAGE_PIN T10 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]

## RGB LED LD0
set_property PACKAGE_PIN G6 [get_ports LD0_R]
set_property IOSTANDARD LVCMOS33 [get_ports LD0_R]
set_property PACKAGE_PIN F6 [get_ports LD0_G]
set_property IOSTANDARD LVCMOS33 [get_ports LD0_G]
set_property PACKAGE_PIN E1 [get_ports LD0_B]
set_property IOSTANDARD LVCMOS33 [get_ports LD0_B]

## Button - BTN0 for write operation
set_property PACKAGE_PIN D9 [get_ports btn]
set_property IOSTANDARD LVCMOS33 [get_ports btn]
## -------- Input Delay Constraints (ideal, on-board switches & button) -----
## Ignore timing on human-operated inputs (switches, button)
set_false_path -from [get_ports {sw[*] btn}]

## Ignore timing on indicator outputs (LEDs and RGB)
set_false_path -to [get_ports {leds[*] LD0_R LD0_G LD0_B}]
