#!/bin/bash

set -e

PROJECT_NAME=state
PROJECT_DIR="$PROJECT_NAME.io"

brew install git

git clone --branch ${CPU}-mac https://github.com/Fundamentals-of-Programming-2021/Project-Base $PROJECT_DIR

brew install Sdl2 Sdl2_Gfx cmake

cd $PROJECT_DIR
rm -rf README.md config-* .git
mv ./snake-project/* .
rm -rf ./snake-project

cmake .
cmake --build .

echo """
####################
help:
Use ${PROJECT_DIR}/main.c as a sample.


	to build:
		cmake --build .
	to run:
		./state


enjoy!
"""
