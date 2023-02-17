#!/bin/sh

# Install Language-Packs
LANGSHORTNAME=$(echo $LANG | cut -d _ -f1)
apt-get install -y language-pack-$LANGSHORTNAME
apt-get install -y language-pack-gnome-$LANGSHORTNAME

# Create User and Group:

groupadd -r $USER -g 433 \
&& useradd -u 431 -r -g $USER -d /home/$USER -s /bin/bash -c "$USER" $USER \
&& adduser $USER sudo \
&& mkdir /home/$USER \
&& chown -R $USER:$USER /home/$USER \
&& echo $USER':'$PASSWORD | chpasswd
userdel -r mint

# Set Timezone
rm -Rf /etc/localtime
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set System-Language:
echo $LANG UTF8 > /etc/locale.gen && update-locale LANG=$LANG LANGUAGE

# Start nxserver-software
/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log
