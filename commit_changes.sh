#!/bin/bash

rm .git/index.lock
cd /home/christian/saves
cp -r /c/RetroArch-Win64/saves/* .
cp -r /d/Documents/PCSX2/memcards ./PCSX2
cp -r /home/christian/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC ./Dolphin
cp -r /d/Games/emulators/ppsspp-dev/memstick/* ./PPSSPP-standalone
if [[ `git status --porcelain` ]]; then
	echo "Changes detected"
else
	echo "No changes detected"
	exit 0
fi
pwd
echo "adding"
git add -A
echo "committing"
date_str=$(date +%Y-%m-%d\ %H:%M:%S\ ET)
git commit -m "Update [$date_str]"
echo "pushing"
git push
