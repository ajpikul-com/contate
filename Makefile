# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#
CNTT= ./contate/contate -s
BUILD_DIR=build.contate
STAGE_DIR=../circuitandcode.com/
RELEASE_DIR=

#idea is that we might use make properly instead of using big
#which just recompiles everything everytime
#it's pretty fucked at this point
all: big


big:
	@# execute rsync on everything but .contate things
	@mkdir -p ${BUILD_DIR}
	@touch ignore.contate
	@echo "Rsync will delete files in the destination folder. If this list doesn't look dangerous, edit the Makefile and remove the -n option from rsync in big"	
	@echo "Add folders to protect to ignore.contate, and makes sure the variables at the top of this Makefile are correct!"
	@echo ""
	@rsync -av . ${BUILD_DIR}/ --exclude=.* --exclude=*.contate --exclude=contate --exclude=Makefile --exclude-from=ignore.contate --delete -n | grep deleting; true
	${CNTT} ${BUILD_DIR} -r

stage:
	@echo "STAGE: Rsync will delete files in the destination folder. If this list doesn't look dangerous, edit the Makefile and remove the -n option from rsync in stage"	
	rsync $(BUILD_DIR)/ $(STAGE_DIR) -va --exclude=.* --exclude=*.contate --exclude=contate --exclude=Makefile --exclude-from=ignore.contate --delete -n | grep deleting; true

release:


clean:
	rm -f $(BUILD_DIR)/* -r 
