

README
------
Last Full Review September 2017-09-29 by ayjayt
------

Contate is a static website generator that allows you to embed bash commands in your webpages. It relies on rsync and make.
It ignores all folders/files ending in "contate", as well as Makefile and ReADME.md in the root directory.
1) Create a development directory for your website
2) Clone contate into it
3) Copy the Makefile into the root directory for your website
4) At least add a couple variabels at the top of the Makefile
5) Use <!-- contate:command flag1 flag2 --> to run your commands
	a) ${pwd} could be useful (to check if works)
	b) Use `contate -e` to include files that also have base commands (to check if works)
6) use `make` and `make stage`
Anyway,


INSPIRATION
-----------
I DID NOT WANT TO INSTALL RUBY WHEN I WAS CRANKING OUT MY WEBSITE (jekyll)
This programs allows you to use ANY language that a bash script can run as a dynamic static page generator

USE CASE
--------
You're using a CDN (Akimai, Cloudflare) for static content and webapps for dynamic content (node.js, maybe).
So you don't want to use PHP be scaling issues + setup

Command List (Out of date)
------------
make clean: clears out build.contate
make: builds pages based off template (replaces <!-- content --> with contenti
make stage: installs built pages into a build folder which is probably served for previewing changes. diffs with active site nad prints differences
make install: installs built pages live

The program is SHORT so it shoudln't be a problem reading through it

