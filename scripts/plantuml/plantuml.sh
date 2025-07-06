#!/bin/sh
filename=${1%.txt}
java -jar /Users/rjm995/Downloads/plantuml-1.2024.4.jar $1
open $filename.png
