FROM openjdk:8-jre-slim

ARG shared_workspace=/opt/workspace

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*
	
ENV SHARED_WORKSPACE=${shared_workspace}

VOLUME ${shared_workspace}

CMD ["bash"]


ARG spark_version=3.0.1
ARG hadoop_version=2.7

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl https://downloads.apache.org/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz
ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON /usr/bin/python
ENV PYSPARK_DRIVER_PYTHON /usr/bin/python

WORKDIR ${SPARK_HOME}
