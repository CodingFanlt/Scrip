FROM ubuntu:18.04

LABEL author="codingfanlt"
LABEL maintainer="codingfanlt@gmail.com"
LABEL version="1.0"

WORKDIR /


RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse' > /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo '## Not recommended' >> /etc/apt/sources.list \
    && echo '# deb http://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '# deb-src http://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
    && apt-get update && apt-get upgrade -y \
    && apt-get install -y git make build-essential gdb gcc-multilib qemu \
    && apt-get clean

RUN cd / && git clone https://github.com/mit-pdos/xv6-public

CMD ["/bin/bash"]
