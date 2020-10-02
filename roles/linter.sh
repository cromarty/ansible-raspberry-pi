#!/bin/bash

find . -name *.yml -exec ansible-lint {} \;

