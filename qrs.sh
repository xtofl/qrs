#!/bin/bash

PREFIX=${PREFIX-qr-}
SUFFIX=${SUFFIX-png}
MESSAGE=${MESSAGE-"ontbijtje"}
TYPE=${TYPE-png}
function generate_qr() {
	while read id; do
		L_OUTPUT=${OUTPUT-$PREFIX$id.$SUFFIX}
		echo writing to $L_OUTPUT
		qrencode \
			--output $L_OUTPUT \
		       	--type $TYPE \
			"$MESSAGE-$id"
	done
}

generate_qr
