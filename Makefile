# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#
CNTT= ./contate/contate
BUILD_DIR=build.contate
STAGE_DIR=..
RELEASE_DIR=

#idea is that we might use make properly instead of using big
#which just recompiles everything everytime
#it's pretty fucked at this point
all: big


big:
	# execute rsync on everything but .contate things
	mkdir -p ${BUILD_DIR}
	touch ignore.contate
	rsync -av . ${BUILD_DIR}/ --delete --exclude=.* --exclude=*.contate --exclude=contate --exclude=Makefile --exclude-from=ignore.contate
	${CNTT} ${BUILD_DIR} -r

stage:
	rsync $(BUILD_DIR)/ $(STAGE_DIR) -vr #this is using modified time now which isn't apppropriate because it's always different

release:


clean:
	rm -f $(BUILD_DIR)/* -r 
