ARG VER=cinnamon-latest
FROM ramirezfx/linuxmint-baseimage:$VER
ENV SHELL=/bin/bash

RUN apt-get update -y
RUN apt-get install -y git cups wget mint-meta-codecs

# Download latest nomachine-server
RUN wget -O /tmp/nomachine.deb "https://www.nomachine.com/free/linux/64/deb" && apt-get install -y /tmp/nomachine.deb

# ADD nxserver.sh
RUN wget -O /nxserver.sh https://github.com/ramirezfx/linuxmint-desktop/raw/main/nxserver.sh && chmod +x /nxserver.sh

# Custom Packages And Sripts:
RUN wget -O /custom.sh https://github.com/ramirezfx/linuxmint-desktop/raw/main/custom.sh && chmod +x /custom.sh

# Create DATA-DIR
RUN mkdir /data && chmod 777 /data

RUN /custom.sh

ENTRYPOINT ["/nxserver.sh"]
