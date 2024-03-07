phony := all
all:

include config.mk

OUTPUT_DIR := $(BSP_ROOT)/output
ifneq ($(MAKE_LIB),1)
TARGET := $(OUTPUT_DIR)/rtthread.elf
include src.mk
endif

$(if $(strip $(RTT_ROOT)),,$(error RTT_ROOT not defined))

include $(RTT_ROOT)/tools/rtthread.mk
