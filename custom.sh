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

# Install Visual Studio
# -----------------------
# To Get the download-link, install the Video-Download-Helper-Plugin for your browser. Navigate to https://code.visualstudio.com.
# Navigate to the bottom and dowload the arm-64 Version manually. Then use the Video-Download-Helper to get the link and paste it below:

wget -O /tmp/vstudio.deb "https://az764295.vo.msecnd.net/stable/e2816fe719a4026ffa1ee0189dc89bdfdbafb164/code_1.75.0-1675266613_amd64.deb" && apt-get install /tmp/vstudio.deb


# Cleanup
# -------

rm -Rf /var/cache/apt/archives
