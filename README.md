![chart](https://github.com/circuitandcode/contate/raw/master/images/contate.png "infographic")

README
------
Last Full Review July 2017-07-24 by ayjayt
------
Contate is a static webpage generator, right now <100 lines of code.

< 100 lines of code! Just look at these files:
./index.content
./bin.concate/contate
./Makefile
./templates.concate/main.template

Anyway,

This folder is the program+example use (they aren't seperated at the moment)
The idea (is not implemented perfectly) is:

Find all "name.content.extension" files (ex: index.content.html) and parse them for:

a) includes (.template files)
b) functions (anything in the /bin.contate folder)
c) variables (strings that the .template files might use)

Then, rename them "name.extension" (ex: index.html) and put them in same directory structure you found them, but in ./build.contate/

./templates.concate/*.template should be able to use functions, maybe vars+includes?

ALl other non ./*.contate.* files are copied over statically (images, css, media)

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
make preview: installs built pages into a build folder which is probably served for previewing changes. diffs with active site nad prints differences
make install: installs built pages live

The program is SHORT so it shoudln't be a problem reading through it

