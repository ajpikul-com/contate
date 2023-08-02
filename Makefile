# Contate Makefile
# Author: Andrew Pikul (ajp@circuitandcode.com)
# 
#
#
.PHONE: all examples test
all: build/contate

build/contate:
		-mkdir -p build/
		cat util dictionary contator main > build/contate
		chmod +x build/contate
	
examples: build/contate
		mkdir -p output
		rm -fr output/**
		./build/contate -ro output/ example/
		tree output

test: build/contate examples
		diff output/ example_output/ -r
		for file in *_test; do bash $$file; done
