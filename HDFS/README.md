# HDFS Setup

## create the hdfs folders
```bash
cd /usr/local/opt/hadoop/bin
```
check the hdfs func working
```bash
hdfs dfs
```

```bash
cd /usr/local/Cellar/hadoop/3.3.1/bin
```

create a new folder
```bash
hdfs dfs -mkdir <new-folder-path>
```

ex. hdfs dfs -mkdir /input

create a new sub-folder
```bash
hdfs dfs -mkdir /input/new_sub_dir
```

check the folders
```bash
hdfs dfs -ls /
hdfs dfs -ls /input
```

## Copy the local files to HDFS

```bash
touch text.txt
touch text2.txt
```

```bash
cat text.txt
a a b b b c b c

cat text2.txt
ab a b b c c c
```

```bash
hdfs dfs -copyFromLocal text.txt /input
hdfs dfs -copyFromLocal text2.txt /input
hdfs dfs -ls /input
```

## Remove files and directory

Removes all files in test directory
```bash
hdfs dfs -rm -r -f /input/test.txt
```

Removes empty directory
```bash
hdfs dfs -rmdir /input/
```