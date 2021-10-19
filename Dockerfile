# docker build -t leehom/nginx.ssl2 .
FROM ubuntu:16.04
RUN printf 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse\n' > /etc/apt/sources.list && \
    printf 'deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse\n' >> /etc/apt/sources.list && \
    printf 'deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse\n' >> /etc/apt/sources.list

RUN apt update \
    && apt-get install -y nginx curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY res/etc.nginx.nginx.conf /etc/nginx/nginx.conf
COPY res/lib.x86_64-linux-gnu.libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.1.0.0
COPY res/lib.x86_64-linux-gnu.libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.1.0.0
COPY res/usr.bin.openssl /usr/bin/openssl
COPY res/usr.sbin.nginx /usr/sbin/nginx
COPY certs /certs

EXPOSE 80
EXPOSE 443
# CMD [ "yes" ]
CMD ["nginx","-g","daemon off;"]
