#!/bin/bash

if [ $# -eq 0 ] 
then
	name="themer"
else
	name=$1
fi
main_file="themer.py"


mkdir themer
cp $main_file ./themer/__main__.py
cp $(ls *.py | grep -v $main_file) ./themer/
cd ./themer
zip ../$name $(ls *.py)
cd ..

if [ ! -d "output" ]
then
	mkdir output
fi

mv $name.zip ./output
chmod 777 ./output/$name.zip
rm -r themer
mv ./output/$name.zip ./output/$name
