#!/usr/bin/env bash

function get_pom_dir() {
    while :
    do
        if [[ $(ls|grep pom.xml) ]]; then
            echo $(pwd)
            break
        else
            cd ..
        fi
    done
}

