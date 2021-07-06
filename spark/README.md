# Spark Configuration

We are using the HDFS output folder and files

[See HDFS Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/HDFS)

1. check the output files
```bash
hadoop fs -ls -R /output/
-rw-r--r--   1 yuyatinnefeld supergroup          0 2021-07-06 08:15 /output/_SUCCESS
-rw-r--r--   1 yuyatinnefeld supergroup         17 2021-07-06 08:15 /output/part-r-00000
```

check the port of the hdfs
```bash
hdfs getconf -confKey fs.defaultFS
hdfs://localhost:8020
```

1. run spark 
```bash
spark-shell
```

2. create RDD and count the words
```bash
scala> val txtFile = sc.textFile("hdfs://127.0.0.1:8020/output/part-r-00000")
txtFile.count()
```