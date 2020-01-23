#!/bin/bash

PREFIX=${PREFIX-qr-}
SUFFIX=${SUFFIX-png}
TYPE=${TYPE-png}
function generate_qr() {
	while read name; do
		qrencode \
			--output $PREFIX$name.$SUFFIX \
		       	--type $TYPE \
			lucia-$name
	done
}

generate_qr
