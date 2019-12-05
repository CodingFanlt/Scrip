FROM ubuntu:16.04

LABEL author="CodingFanlt"
LABEL maintainer="CodingFanlt@Gmail.com"
LABEL version="1.0"

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse' > /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '#deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    \
    && echo '## Not recommended' >> /etc/apt/sources.list \
    && echo '# deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo '# deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
    && apt-get clean
CMD ["/bin/bash"]