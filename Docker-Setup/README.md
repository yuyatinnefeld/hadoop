# Hadoop + Docker

##Info
- https://clubhouse.io/developer-how-to/how-to-set-up-a-hadoop-cluster-in-docker/


## Setup
```bash
git clone https://github.com/big-data-europe/docker-hadoop.git
docker-compose up -d
```

```bash
docker-compose down
```


open the site
```bash
http://localhost:9870
```

## Task 1 WordCount

```bash
docker exec -it namenode bash
```

```bash
root@namenode:/# mkdir input
root@namenode:/# echo "Hello World" >input/f1.txt
root@namenode:/# echo "Hello Docker" >input/f2.txt
```

```bash
root@namenode:/# hadoop fs -mkdir -p input
root@namenode:/# hdfs dfs -put ./input/* input
root@namenode:/# hadoop fs -mkdir -p input
```

Download the file
https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-examples/2.7.1/hadoop-mapreduce-examples-2.7.1-sources.jar

Copy the container ID of your namenode (ex. 379effca9a11)

![GitHub Logo](/images/namenode_container.png)


```bash
docker container ls
```

```bash
docker cp hadoop-mapreduce-examples-2.7.1-sources.jar 379effca9a11:hadoop-mapreduce-examples-2.7.1-sources.jar
```

```bash
root@namenode:/# hadoop jar hadoop-mapreduce-examples-2.7.1-sources.jar org.apache.hadoop.examples.WordCount input output
```

```bash
root@namenode:/# hdfs dfs -cat output/part-r-00000
```


## Task 2
Info: https://marcel-jan.eu/datablog/2020/10/25/i-built-a-working-hadoop-spark-hive-cluster-on-docker-here-is-how/

```bash
docker ps |grep namenode
```

Copy the container ID of your namenode (ex. 379effca9a11)

```bash
cd data
docker docker docker cp breweries.csv 379effca9a11:breweries.csv
```

```bash
docker exec -it namenode bash
```

```bash
root@namenode:/# hdfs dfs -mkdir /data
root@namenode:/# hdfs dfs -mkdir /data/openbeer
root@namenode:/# hdfs dfs -mkdir /data/openbeer/breweries
```

```bash
hdfs dfs -put breweries.csv /data/openbeer/breweries/breweries.csv
```

