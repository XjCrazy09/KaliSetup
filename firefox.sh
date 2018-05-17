#!/bin/bash

# Purge the old firefox
apt-get purge firefox
apt-get autoclean
unlink /usr/bin/firefox
mv /usr/bin/firefox /usr/bin/firefox_bak

# Get the new firefox and link everything up
cd /usr/local
pwd
wget https://ftp.mozilla.org/pub/firefox/releases/60.0/linux-x86_64/en-US/firefox-60.0.tar.bz2
tar xvjf firefox-60.0.tar.bz2
rm firefox-60.0.tar.bz2
ln -s /usr/local/firefox/firefox /usr/bin/firefox
rm /usr/share/applications/firefox-esr.desktop

# Now add the item to the favorites bar and the menu
echo "[Desktop Entry]
Version=60.0
Name=Firefox
Comment=This is a test
Exec=/usr/bin/firefox
Icon=/usr/local/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Utility;Application;" > /usr/share/applications/firefox.desktop

# Should be finished/ launch firefox
firefox &
