#!/bin/bash

if [ ! -d sheet ]; then
	mkdir sheet
fi
cp *.png sheet
cp *.png.secret sheet

cat <<EOF > sheet/qrcodes.html
<html>
<head><title>QR Codes</title>
<style>
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
(
cd sheet
echo "<tr>"
echo "<th>on ticket</th>"
echo "<th>scanned</th>"
echo "</tr>"
for f in *.png; do
echo "<tr>"
echo "<td><img src='$f'/></td>"
echo "<td>$f<br/>"
awk 1 ORS="<br/>" $f.secret
echo "</td>"
echo "</tr>"
done
) >> sheet/qrcodes.html
cat <<EOF >> sheet/qrcodes.html
</table>
</body>
</html>
EOF
