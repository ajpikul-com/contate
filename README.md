

README
------

Contate is a static website generator that allows you to embed bash commands in your webpages. It relies on rsync and make.
It ignores all folders/files ending in "contate", as well as Makefile and README.md in the root directory.
1) Create a development directory for your website
2) Clone contate into it
3) Copy the Makefile into the root of the development directory
4) Add a couple variables at the top of the Makefile
5) Use <!-- contate:command flag1 flag2 --> to run your commands
6) Use `contate -e` to include files that also have base commands (to check if works)
7) use `make` and `make stage`


INSPIRATION
-----------
I DID NOT WANT TO INSTALL RUBY WHEN I WAS CRANKING OUT MY WEBSITE (jekyll)
This programs allows you to use ANY language that a bash script can run as a dynamic static page generator

USE CASE
--------
You're using a CDN (Akimai, Cloudflare) for static content and webapps for dynamic content (node.js, maybe).
So you don't want to use PHP be scaling issues + setup
