
.PHONY: build clean

BOARD ?= ul3xs
DENSITY ?= 12k

ifeq ($(BOARD),ulx3s)

build/ul3xs-$(DENSITY).bit: FORCE
	# remove old build, then recreate by copying src
	rm -rf build/
	cp -r src build
	# copy platform-specific files into build folder
	cp -an platform/ulx3s/. build
	cd build &&\
	yosys build.ys &&\
	nextpnr-ecp5 --$(DENSITY) --json build.json --lpf constraints.lcf --textcfg build.config &&\
	ecppack build.config ul3xs-$(DENSITY).bit

else ifeq ($(BOARD), mimasa7)

VIVADO_DIR := /opt/Xilinx/2025.1/Vivado
export PATH := $(VIVADO_DIR)/bin:$(PATH)

build/mimasa7.bit: FORCE
	# remove old build, then recreate by copying src
	rm -rf build/
	cp -r src build
	# copy platform-specific files into build folder
	cp -an platform/mimasa7/. build
	cd build &&\
	vivado -mode batch -nolog -nojournal -source build.tcl

endif

clean:
	rm -rf build/

FORCE:
