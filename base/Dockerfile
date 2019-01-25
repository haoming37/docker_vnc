FROM ubuntu:16.04
#install packages
RUN apt-get update && apt-get install -y \
    openbox \
    obmenu \
    obconf \
    tint2 \
    xfce4-terminal \
    x11vnc \
    xvfb \
    x11-xserver-utils \
    net-tools \
    curl \
    htop \
    scrot \
    python3 \
    python3-pip \
    language-pack-ja-base \
    language-pack-ja \
    fonts-takao \
    fcitx-mozc \
    fonts-inconsolata \
    software-properties-common \
    sudo \
    && add-apt-repository ppa:git-core/ppa \
    && apt-get update \
    && apt-get install git -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Japanese environment
ENV LANG ja_JP.UTF-8
RUN locale-gen en_US.UTF-8 && locale-gen ja_JP.UTF-8

# TimeZone
RUN echo "tzdata tzdata/Areas select Asia" > /tmp/tzdata \
    && echo "tzdata tzdata/Zones/Asia select Tokyo" >> /tmp/tzdata \
    && debconf-set-selections /tmp/tzdata \
    && rm /etc/timezone \
    &&rm /etc/localtime \
RUN dpkg-reconfigure -f noninteractive tzdata

# allow normal user to change user/group
# this will be restored in starup.sh
RUN chmod u+s /usr/sbin/useradd \
    && chmod u+s /usr/sbin/groupadd

ENV USER_NAME=developer
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}
USER developer

# ubuntu user to run mozc_server
#RUN useradd -G sudo -m -s /bin/bash ubuntu && echo 'ubuntu:ubuntu' | chpasswd

WORKDIR /home/developer
COPY data /home/developer



#RUN chown -R ubuntu.ubuntu * .*

ENTRYPOINT ["bash","./startup.sh"]

