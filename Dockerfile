FROM debian:buster

RUN apt-get update -qq && apt-get install -qq gnupg ca-certificates curl desktop-file-utils ibus ibus-gtk lib32z1 libx11-6 libasound2-dev libegl1-mesa libxcb-shm0 libglib2.0-0 libgl1-mesa-glx libxrender1 libxcomposite1 libxslt1.1 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxi6 libsm6 libfontconfig1 libpulse0 libsqlite3-0 libxcb-shape0 libxcb-xfixes0 libxcb-randr0 libxcb-image0 libxcb-keysyms1 libxcb-xtest0 libnss3 libxss1 libcanberra-gtk-module

RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" > /etc/apt/sources.list.d/signal-xenial.list
RUN apt-get update && apt-get install -qq signal-desktop

RUN chmod 4755 /opt/Signal/chrome-sandbox
#RUN chmod +s /opt/Signal/chrome-sandbox

RUN mkdir /data

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

