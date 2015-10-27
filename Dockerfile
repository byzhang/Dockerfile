FROM ubuntu:14.04
MAINTAINER Benyu Zhang <byzhang@cloudbrain.me>
RUN apt-get -qq update
ADD bin /app/bin
ADD conf /etc
RUN for bin in $(ls /app/bin/*); do \
        chmod +x $bin && \
        ln -s $bin /sbin/$(basename $bin); \
    done;

ADD https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/sbin btsync && rm -f /tmp/sync.tgz

# BTSync - comm ports
EXPOSE 55555/tcp
VOLUME /mnt/sync

ENTRYPOINT [ "/sbin/entrypoint" ]
CMD [ "" ]
