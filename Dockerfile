ARG VER=cinnamon-latest
FROM ramirezfx/linuxmint-baseimage:$VER
ENV SHELL=/bin/bash

RUN apt-get install -y git cups wget

# Download latest nomachine-server
RUN DLLINK=$(wget --save-headers --output-document - https://downloads.nomachine.com/de/download/?id=5 | grep download.nomachine.com | cut -d '"' -f6 | head -1) && wget -O nomachine.deb $DLLINK && dpkg -i nomachine.deb

# ADD nxserver.sh
RUN wget -O /nxserver.sh https://github.com/ramirezfx/linuxmint-desktop/raw/main/nxserver.sh && chmod +x /nxserver.sh

# Custom Packages And Sripts:
RUN wget -O /custom.sh https://github.com/ramirezfx/linuxmint-desktop/raw/main/custom.sh && chmod +x /custom.sh
RUN /custom.sh

ENTRYPOINT ["/nxserver.sh"]
