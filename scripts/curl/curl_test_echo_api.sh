#!/usr/local/bin/bash

curl -v localhost:8080/v0/echo --data-raw "{ \"echo\": \"swag\" }"
