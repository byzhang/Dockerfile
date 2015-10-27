SECRET=`./btsync --generate-secret`
sed -e s/SECRET/"$SECRET"/ conf/btsync.conf.default >| conf/btsync.conf
sudo docker build -t="cloudbrain/btsync:v1" .
sudo docker run -p 55555 -v $HOST_DATA_DIR:/mnt/sync/ -t -i cloudbrain/btsync:v1 /bin/bash
