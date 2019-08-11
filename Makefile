# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#

all:
		-mkdir -p build/
		cat util dictionary contator main > build/contate
		chmod +x build/contate
	
examples: all
		mkdir -p output
		rm -fr output/**
		./build/contate -ro output/ example/
		tree output

test: all examples
		diff output/ example_output/ -r
		for file in *_test; do bash $$file; done
