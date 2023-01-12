#!/bin/bash

echo "Executing create_pkg.sh"

echo "Checking if lambda distribution directory exist"
if [ -d "lambda-dist" ]
then
    echo "Directory already exist. Deleteing......"
    rm -rf lambda-dist
fi

echo "Creating lambda distribution directory"
mkdir lambda-dist

echo "Copying files"
cp -r lambda-function/* lambda-dist

echo "Installing dependencies"
pip3 install -r lambda-dist/requirements.txt -t lambda-dist
