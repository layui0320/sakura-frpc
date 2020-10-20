FROM arm64v8/alpine:3.10

LABEL maintainer="layui <58420846@qq.com>"

ENV FRP_VERSION 0.28.2

COPY qemu-aarch64-static /usr/bin

RUN cd /root \
    &&  wget --no-check-certificate -c https://github.com/ZeroDream-CN/SakuraFrp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_arm64.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_arm64.tar.gz  \
    &&  cd frp_${FRP_VERSION}_linux_arm64/ \
    &&  cp frpc /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  cp frpc.ini /etc/frp \
    &&  cd /root \
    &&  rm frp_${FRP_VERSION}_linux_arm64.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_arm64/ 

ENTRYPOINT /usr/bin/frpc -c /etc/frp/frpc.ini
