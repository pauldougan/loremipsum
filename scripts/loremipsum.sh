#!/usr/bin/env bash

faker sentence -r 3 -s '' | gsed 's/\.//g'
