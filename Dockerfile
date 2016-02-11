FROM alpine:latest

COPY ["znc.conf", "/znc/configs/znc.conf"]

RUN apk --update add znc znc-extra \
    && rm -rf /var/cache/apk/* \
    && chown -R znc:znc /znc

VOLUME /znc
USER znc

EXPOSE 6667
ENTRYPOINT ["znc", "--foreground", "--datadir=/znc"]
