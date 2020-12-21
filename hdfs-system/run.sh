docker network create team-8 &&\
docker-compose -p hadoop-cluster up -d &&\
docker run -it --rm --name hdfs-shell --network team-8 -e "CORE_CONF_fs_defaultFS=hdfs://hadoop-namenode:8020" -e "CLUSTER_NAME=hadoop-sandbox" -t uhopper/hadoop:2.7.2 /bin/bash &&\
hdfs dfs -mkdir /data &&\
hdfs dfs -chmod 777 /data
