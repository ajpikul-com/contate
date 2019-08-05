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
		CONTATE_DEBUG=true ./build/contate -ro output/ example/
		tree output

