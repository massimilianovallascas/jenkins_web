#!/bin/bash

BUILD_NUMBER="${1}"
cat index.html | grep "<p><small>Deployed by Jenkins job: ${BUILD_NUMBER}</small></p>"
