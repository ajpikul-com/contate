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
		-rm -r output/**
		./build/contate -ro output/ example/
		tree output
		diff output/ example_output/ -r

test: all
		bash *_test
