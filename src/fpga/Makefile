

QUARTUS_DIR := /opt/intelFPGA_lite/22.1std/quartus/bin


all: synthesize fit assemble

synthesize:
	@ $(QUARTUS_DIR)/quartus_map --read_settings_files=on --write_settings_files=off ap_core -c ap_core

fit:
	@ $(QUARTUS_DIR)/quartus_fit --read_settings_files=on --write_settings_files=off ap_core -c ap_core

assemble:
	@ $(QUARTUS_DIR)/quartus_asm --read_settings_files=on --write_settings_files=off ap_core -c ap_core



clean:
	@ rm -rf db/ output_files/ incremental_db/ 


