# Download and install latest Google Chrome-Browser
# -------------------------------------------------

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb && \
apt-get install -y /tmp/google-chrome-stable_current_amd64.deb
rm /tmp/google-chrome-stable_current_amd64.deb

# Install Seafile-Cloud-Sync-Client
# ---------------------------------

wget https://linux-clients.seafile.com/seafile.asc -O /usr/share/keyrings/seafile-keyring.asc
OSRELEASE=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d "=" -f2)
if [ $OSRELEASE == 'jammy'  ]
then
 echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/jammy/ stable main' > /etc/apt/sources.list.d/seafile.list
fi
apt update
apt install -y seafile-gui

# Install Mobirise Website-Builder
# --------------------------------

DLLINK=$(wget --save-headers --output-document - https://mobirise.com/history.html | grep .deb | grep -Eo 'https://[^ >]+'|head -1 | cut -d'"' -f 1)
wget -O /tmp/mobirise-latest.deb $DLLINK
apt-get install -y /tmp/mobirise-latest.deb
rm /tmp/mobirise-latest.deb

# Cleanup
# -------

rm -Rf /var/cache/apt/archives
