#!/bin/bash

if [ ! -d sheet ]; then
	mkdir sheet
fi
cp *.png sheet
cp *.png.secret sheet

test -z "$COLUMNS" && printf "You may specify the number of COLUMNS in the resulting sheet"
COLUMNS=${COLUMNS-3}

cat <<EOF > sheet/qrcodes.html
<html>
<head><title>QR Codes</title>
<style>
table {
	width: 100%;
}
table td {
	border: solid 1px;
}
td {
	vertical-align: top;
}
</style>
</head>
<body>
<table>
EOF


function tabulate {
	local f=$1
	echo "<td><img src='$f'/></td>"
	echo "<td>$f<br/>"
	awk 1 ORS="<br/>" $f.secret
	echo "</td>"
}

(
	cd sheet
	echo "<tr>"
	for _ in $(seq 1 $COLUMNS); do
		echo "<th>on ticket</th>"
		echo "<th>scanned</th>"
	done
	echo "</tr>"
	ls *.png | pr -l 20 -$COLUMNS -t | while read line; do
		echo "<tr>"
		for f in $line; do
			tabulate $f
		done
		echo "</tr>"
	done
) >> sheet/qrcodes.html
cat <<EOF >> sheet/qrcodes.html
</table>
</body>
</html>
EOF
