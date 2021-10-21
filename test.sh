#!/bin/bash

STRING="${1}"
cat index.html | grep "${STRING}"
