#!/bin/bash

if [ ! -d sheet ]; then
	mkdir sheet
fi
cp *.png sheet

cat <<EOF > sheet/qrcodes.html
<html>
<head><title>QR Codes</title>
<style>
table td {
	border: solid 1px;
}
</style>
</head>
<body>
<table>
EOF
(
cd sheet
echo "<tr><th>filename</th>"
echo "<th>on ticket</th>"
echo "<th>scanned</th>"
echo "</tr>"
for f in *.png; do
echo "<tr><td>$f</td>"
echo "<td><img src='$f'/></td>"
echo "<td><img src='$f'/></td>"
echo "</tr>"
done
) >> sheet/qrcodes.html
cat <<EOF >> sheet/qrcodes.html
</table>
</body>
</html>
EOF
