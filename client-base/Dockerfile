FROM python:3.7.9-stretch

ARG spark_version=3.0.1
ARG hadoop_version=2.7

RUN apt-get update -y && \
    apt-get install -y openjdk-8-jre-headless &&\
    apt-get install -y openjdk-8-jdk-headless &&\
    export JAVA_HOME=export JAVA_HOME="usr/lib/jvm/java-1.8.0-openjdk-amd64" &&\
    export PATH=$JAVA_HOME/bin:$PATH &&\
    apt-get install -y curl &&\
    curl https://downloads.lightbend.com/scala/2.12.10/scala-2.12.10.deb -o /opt/scala_2.12.10.deb &&\
    dpkg -i /opt/scala_2.12.10.deb
	
ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}

CMD [ "bash"]

RUN curl https://downloads.apache.org/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz &&\
    pip3 install pyspark==${spark_version} &&\
    pip3 install pyspark-stubs &&\
    pip3 install findspark &&\
    pip3 install kafka-python &&\
    pip3 install msgpack &&\
    pip3 install jupyterlab &&\
    mkdir -p /opt/workspace
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
