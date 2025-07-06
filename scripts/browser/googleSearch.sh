#!/bin/sh
toSearch=$@
toSearch="${toSearch// /%20}"
open "http://www.google.com/search?q=$toSearch"
