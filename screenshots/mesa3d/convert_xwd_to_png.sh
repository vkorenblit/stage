#!/bin/bash
ext=".png"
for f in *.xwd
do
	convert $f  $f$ext
done
rm *xwd
