#!/bin/bash

docker build . -t snmpbox
alias snmpbox='docker run --rm -it -v $(pwd):/app snmpbox'