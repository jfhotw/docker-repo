#!/bin/bash
source /root/.bashrc
docker exec bakslave /bin/sh -c "/bin/bash /mydata/dbbak.sh" > /mydata/mysql/dbsqlbak/bakdata/logs/dockerbak.log 2>&1
