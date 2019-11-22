#!/bin/bash

for file in *.pde; do
    mv "$file" "${file%.pde}.java"
done