# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#

CNTT= ./contate/contate 
BUILD_DIR=build.contate
STAGE_DIR=
RELEASE_DIR=

ifndef STAGE_DIR
$(error stage directory is not set- do so or surpress this)
endif
ifndef RELEASE_DIR
$(error release directory is not set- do so or surpress this)
endif

# no deps, just does everything w/e, contate doesn't even take lists
# so this could be better, like apps/ should be a variable that takes deliminated directories
# contate should probably also read a file named copy.contate
all: 
	@# execute rsync on everything but .contate things
	@mkdir -p ${BUILD_DIR}
	${CNTT} -i . -o ${BUILD_DIR} -r -c "apps/*" -c "images/*" -c "media/*" -c "css/*" -c "js/*"

# we need a direct stage- so -o $(STAGE_DIR)
stage:
	@echo "STAGE: Rsync will delete files in the destination folder. If this list doesn't look dangerous, edit the Makefile and remove the -n option from rsync in stage"	
	rsync $(BUILD_DIR)/ $(STAGE_DIR) -va --delete -n | grep deleting; true

release:
	@echo "STAGE: Rsync will delete files in the destination folder. If this list doesn't look dangerous, edit the Makefile and remove the -n option from rsync in stage"	
	rsync $(BUILD_DIR)/ $(RELEASE_DIR) -va --delete -n | grep deleting; true

clean:
	rm -f $(BUILD_DIR)/* -r 
