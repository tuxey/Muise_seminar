

TOPLEVEL_LANG ?= vhdl
SIM=ghdl
SIM_ARGS=--vcd=func.vcd

PWD=$(shell pwd)

ifeq ($(OS),Msys)
WPWD=$(shell sh -c 'pwd -W')
else
WPWD=$(shell pwd)
endif

PYTHONPATH := $(PWD):$(PYTHONPATH)

ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES = $(PWD)/../src/average.v
else ifeq ($(TOPLEVEL_LANG),vhdl)
    VHDL_SOURCES = $(PWD)/../src/average.vhd
else
    $(error "A valid value (verilog or vhdl) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG)")
endif

TOPLEVEL := average
MODULE   := average_tb

include $(shell cocotb-config --makefiles)/Makefile.sim
