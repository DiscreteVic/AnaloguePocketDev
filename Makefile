
JSON_FILE := core.json

AUTHOR := $(shell jq -r '.core.metadata.author' $(JSON_FILE))
CORE_NAME := $(shell jq -r '.core.metadata.platform_ids[]' $(JSON_FILE))
VERSION := $(shell jq -r '.core.metadata.version' $(JSON_FILE))
DATE := $(shell jq -r '.core.metadata.date_release' $(JSON_FILE))
PACK_NAME := $(AUTHOR).$(CORE_NAME)_$(VERSION)_$(DATE)

all: clean bitstream pack

info:
	echo $(CORE_NAME)

pack: 
	@ mkdir -p $(PACK_NAME)/Cores/$(AUTHOR).$(CORE_NAME)
	@ mkdir -p $(PACK_NAME)/Platforms/_images

	@ cp *.json $(PACK_NAME)/Cores/$(AUTHOR).$(CORE_NAME)/.
	@ cp output/*.rbf_r $(PACK_NAME)/Cores/$(AUTHOR).$(CORE_NAME)/.
	@ cp dist/*.bin $(PACK_NAME)/Cores/$(AUTHOR).$(CORE_NAME)/.
	@ cp -r dist/platforms/_images/*.bin $(PACK_NAME)/Platforms/_images/$(CORE_NAME).bin
	@ cp -r dist/platforms/*.json $(PACK_NAME)/Platforms/$(CORE_NAME).json

	@ cd $(PACK_NAME) && zip -r ../$(PACK_NAME).zip .

bitstream:
	@ rbf_r_tool/rbf_r_tool src/fpga/output_files/*.rbf output/bitstream.rbf_r


clean:
	@ rm -rf $(AUTHOR)*/ *.zip
