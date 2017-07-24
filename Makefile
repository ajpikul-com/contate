# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#
CNTT=./bin.contate/contate
BUILD_DIR=build.contate
STAGE_DIR=..
RELEASE_DIR=

#idea is that might use make properly instead of using big
#which just recompiles everything everytime
all: big



# contate developers: this is supposed to recurse and operate atomatically 
# generate html files from .content files
# copy all directories to $(BUILD_DIR)
# turns out, GNU Make doesn't have easy implementation of recursion/regex
# so maybe implement a --recursive flag in ./contate and call it on some wildcard stuff
# contate developers: media without .contate*, .template*, .content* should be recursively copied
big:

	${CNTT} index.content > ${BUILD_DIR}/index.html
	
	mkdir ${BUILD_DIR}/subpage
	${CNTT} subpage/index.content > ${BUILD_DIR}/subpage/index.html
	
	cp images ${BUILD_DIR}/images -r #maybe need a way to make arbitrary file types contatable (.css.content... makes sense)
	cp css ${BUILD_DIR}/css -r
	@#run a diff with stage here

stage:
	rsync $(BUILD_DIR)/ $(STAGE_DIR) -vr #this is using modified time now which isn't apppropriate because it's always different

release:


clean:
	rm -f $(BUILD_DIR)/* -r #this has to be run everytime because `mkdir` fails
