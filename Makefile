# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#

BUILD_DIR=build.contate/
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

	./contate index.content > build/index.html
	mkdir build/subpage
	./contate subpage/index.content > build/subpage/index.html
	mkdir build/about
	
	cp images build/images -r #maybe need a way to make arbitrary file types contatable (.css.content... makes sense)
	cp css build/css -r
	#run a diff with stage here
stage:
	rsync $(BUILD_DIR) $(STAGE_DIR) -vr #this is using modified time now which isn't apppropriate because it's always different

release:


clean:
	rm -f $(BUILD_DIR)/* -r #this has to be run everytime because `mkdir` fails
