#!/bin/bash

N=${N-10}
seq 1 $N \
	| xargs printf "%03d\n" 1 \
	| ./qrs.sh
