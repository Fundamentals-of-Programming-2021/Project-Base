#!/bin/bash

set -e

PROJECT_NAME=state
PROJECT_DIR="$PROJECT_NAME.io"

sudo apt install git -y

# git clone https://github.com/Fundamentals-of-Programming-2021/Project-Base $PROJECT_DIR
git clone https://github.com/sut-ce-fop-97/base $PROJECT_DIR

sudo apt install libsdl2-dev libsdl2-gfx-dev cmake -y

cat $PROJECT_DIR/cmake_linux.txt > $PROJECT_DIR/CMakeLists.txt
sed -i "s/project_name/state/g" $PROJECT_DIR/CMakeLists.txt

cd $PROJECT_DIR
mv src/simple_snake.c src/main.c

cmake .
cmake --build .

sed -i "s/simple_snake/main/g" Makefile

rm -rf cmake_*
rm -rf .git README.md

echo """
####################
help:
Use ${PROJECT_DIR}/src/main.c as a sample.
Add your .c or .h files to ${PROJECT_DIR}/src/


	to build:
		cmake --build .
	to run:
		./state

	
enjoy!	
"""
