#!/bin/bash

WorkingDirectory=$(pwd)
inFile="$WorkingDirectory/gg1.bin"

echo " .------------------------------."
echo " |Building Makaimura ROMs       |"
echo " '------------------------------'"

mkdir -p "$WorkingDirectory/arcade/gng"

echo "Building CPU ROM"
cat 8n.rom 10n.rom 12n.rom > "$WorkingDirectory/arcade/gng/rom1.bin"
echo "Splitting Character ROM"


split -b 8192 "$WorkingDirectory/gg1.bin"
mv	xaa "$WorkingDirectory/arcade/gng/gg1_1.bin"
mv	xab "$WorkingDirectory/arcade/gng/gg1_2.bin"

echo "Copying Sound CPU ROM"
cp gg2.bin "$WorkingDirectory/arcade/gng/"
echo "Building Tile ROMs"
cat gg7.bin gg6.bin > "$WorkingDirectory/arcade/gng/rom76.bin"
cat gg9.bin gg8.bin > "$WorkingDirectory/arcade/gng/rom98.bin"
cat gg11.bin gg10.bin > "$WorkingDirectory/arcade/gng/rom1110.bin"
echo "Building Sprite ROMs"
cat gng13.n4 gg16.bin gg15.bin gg15.bin > "$WorkingDirectory/arcade/gng/spr1.bin"
cat gng16.l4 gg13.bin gg12.bin gg12.bin > "$WorkingDirectory/arcade/gng/spr2.bin"

echo "Generate config file"
dd if=/dev/zero bs=1 count=53 | tr "\000" "\377" > "$WorkingDirectory/arcade/gng/gngcfg"

echo "All Done!"