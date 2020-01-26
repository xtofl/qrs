#!/bin/bash

PREFIX=${PREFIX-qr-}
SUFFIX=${SUFFIX-png}
MESSAGE=${MESSAGE-"ontbijtje"}
TYPE=${TYPE-png}
function generate_qr() {
	while read id; do
		L_OUTPUT=${OUTPUT-$PREFIX$id.$SUFFIX}
		echo writing to $L_OUTPUT
		CONTENT=$MESSAGE-$id
		THIS_SECRET=$(echo $SECRET-$CONTENT | md5sum | cut -c 1-10)
		echo $THIS_SECRET
		echo $CONTENT > $L_OUTPUT.secret
		echo $THIS_SECRET >> $L_OUTPUT.secret
		qrencode \
			--output $L_OUTPUT \
		       	--type $TYPE \
			"$CONTENT-$THIS_SECRET"
	done
}

generate_qr
