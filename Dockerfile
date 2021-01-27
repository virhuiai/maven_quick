FROM maven:3.6.3-jdk-8-slim
# apt update 加速
RUN echo '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释' > /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list && \
# 安装 常用的 vim mlocate unzip wget
set -eux; \
	apt-get update && \
	apt-get install -y --no-install-recommends \
        vim \
        mlocate \
        unzip \
        tree \
        wget && \
	rm -rf /var/lib/apt/lists/* && \
  apt-get clean
COPY ./settings-aliyun.xml /usr/share/maven/conf/settings.xml
# docker build . -t maven_quick_tmp
# docker run -itd --rm --name maven-tmp maven_quick_tmp /bin/bash
# docker exec -it maven-tmp /bin/sh;
# updatedb
# locate settings.xml
# /usr/share/maven/conf/settings.xml
# # locate .m2
# /root/.m2
# /root/.m2/copy_reference_file.log
# /root/.m2/repository
# /root/.m2/settings-docker.xml
# docker cp maven-tmp:/usr/share/maven/conf/settings.xml ./
