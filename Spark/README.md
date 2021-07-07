# Spark Configuration

We are using the HDFS output folder and files

[See HDFS Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/HDFS)

## Read HDFS Data from Spark
1. check the output files
```bash
hadoop fs -ls -R /output/
-rw-r--r--   1 yuyatinnefeld supergroup          0 2021-07-06 08:15 /output/_SUCCESS
-rw-r--r--   1 yuyatinnefeld supergroup         17 2021-07-06 08:15 /output/part-r-00000
```

2. check the port of the hdfs
```bash
hdfs getconf -confKey fs.defaultFS
hdfs://localhost:8020
```

3. run spark 
```bash
spark-shell
```

4. create RDD and use the function count()
```bash
scala> val txtFile = sc.textFile("hdfs://127.0.0.1:8020/output/part-r-00000")
txtFile.count()
```

## Spark on YARN Setup

Env Setup
```bash
export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.1/libexec/
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
```

## Run the client mode (spark-shell)
```bash
spark-shell --master yarn --deploy-mode client
```

## Run the cluster mode (spark-submit)
```bash
cd spark/scala/my-app

spark-submit \
--class com.spark.MySparkTest \
--master yarn \
--deploy-mode cluster \
--driver-memory 4g \
--executor-memory 2g \
--executor-cores 1 \
target/scala-2.12/my-app_2.12-1.0.jar \
10
```