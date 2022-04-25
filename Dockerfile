FROM ubuntu:20.04

COPY Packet_Sender-v8.0.9-x86_64.AppImage .

RUN apt update && apt upgrade -y

RUN apt install libgl1-mesa-glx -y

RUN DEBIAN_FRONTEND=nointeractive apt-get install libharfbuzz-dev -y

RUN ./Packet_Sender-v8.0.9-x86_64.AppImage --appimage-extract

COPY traffic.sh /squashfs-root

COPY  commands.txt /squashfs-root

WORKDIR /squashfs-root

ENTRYPOINT ["/squashfs-root/traffic.sh"]