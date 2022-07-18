FROM ubuntu:20.04 
# copy Packetsender to Docker
COPY Packet_Sender-v8.0.9-x86_64.AppImage .
# get update & upgrade
RUN apt update && apt upgrade -y
# install needed package for Packetsender
RUN apt install libgl1-mesa-glx -y
# install needed package for Packetsender
RUN DEBIAN_FRONTEND=nointeractive apt-get install libharfbuzz-dev -y
# extract the Packetsender
RUN ./Packet_Sender-v8.0.9-x86_64.AppImage --appimage-extract
# copy the script, which is automatically executing commands, to Docker
COPY traffic.sh /squashfs-root
# copy the file in which the commands are stored to Docker
COPY  commands.txt /squashfs-root
# set the working directory
WORKDIR /squashfs-root
# start the script
ENTRYPOINT ["/squashfs-root/traffic.sh"]
