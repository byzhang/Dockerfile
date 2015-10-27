FROM ubuntu:14.04
MAINTAINER Benyu Zhang <byzhang@cloudbrain.me>
RUN apt-get -qq update && apt-get install -y unattended-upgrades wget && unattended-upgrade -v
COPY bin /app/bin
COPY conf /etc
RUN for bin in $(ls /app/bin/*); do \
        chmod +x $bin && \
        ln -s $bin /sbin/$(basename $bin); \
    done;

RUN wget -O- https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz | tar -zx -C /usr/sbin/ btsync

# BTSync - comm ports
EXPOSE 55555/tcp
VOLUME /mnt/sync

ENTRYPOINT [ "/sbin/entrypoint" ]
CMD [ "" ]
