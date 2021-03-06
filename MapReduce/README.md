## MapReduce

```bash
cd /usr/local/Cellar/hadoop/3.3.1/bin
hdfs dfs -mkdir /input

touch a
touch b
cat a
a a b b b c b c

cat b
ab a b b c c c

hdfs dfs -copyFromLocal a /input
hdfs dfs -copyFromLocal b /input
```

```bash
hadoop fs -cat /input/*
```

check the sample Mapreduce Func
```bash
cd /usr/local/Cellar/hadoop/3.3.1/libexec/share/hadoop/mapreduce
ls
hadoop-mapreduce-client-app-3.3.1.jar			hadoop-mapreduce-client-nativetask-3.3.1.jar
hadoop-mapreduce-client-common-3.3.1.jar		hadoop-mapreduce-client-shuffle-3.3.1.jar
hadoop-mapreduce-client-core-3.3.1.jar			hadoop-mapreduce-client-uploader-3.3.1.jar
hadoop-mapreduce-client-hs-3.3.1.jar			hadoop-mapreduce-examples-3.3.1.jar
hadoop-mapreduce-client-hs-plugins-3.3.1.jar		jdiff
hadoop-mapreduce-client-jobclient-3.3.1-tests.jar	lib-examples
hadoop-mapreduce-client-jobclient-3.3.1.jar		sources
```
run the mapreduce wordcount program
```bash
export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.1/libexec/
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.1.jar wordcount /input/ /output/
```
check the output folder
```bash
hadoop fs -ls -R /
hadoop fs -cat /output/*
```
if you get the result then fine!
```bash
a	3
ab	1
b	6
c	5
```

## MapReduce Python
```bash
mkdir hadoop_python
cd hadoop_python
mkdir project
touch project/ratings_break_down.py
python3 -m venv venv
source ./venv/bin/activate
pip install mrjob==0.7.4
wget http://media.sundog-soft.com/hadoop/ml-100k/u.data
python project/ratings_break_down.py u.data
python project/movie_ranking.py u.data

```


```bash
python project/ratings_break_down.py \
-r hadoop --hadoop-streaming-jar \
/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar \
u.data
```