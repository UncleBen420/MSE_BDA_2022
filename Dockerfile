FROM apache/zeppelin:0.10.1

ENV SPARK_VERSION=3.1.2
ENV HADOOP_VERSION=3.2
ENV SPARK_INSTALL_ROOT=/opt/apache-spark
ENV SPARK_DATASET=/opt/zeppelin/datasets

ENV SPARK_HOME=${SPARK_INSTALL_ROOT}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}

COPY audioscrobbler_data/ /opt/zeppelin/audioscrobbler_data/

USER root

RUN mkdir "${SPARK_INSTALL_ROOT}"
RUN cd "${SPARK_INSTALL_ROOT}" && \
    wget --no-verbose https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
