<h1 align="center">Hadoop</h1> <br>
## 🚀 Table of Contents 🚀

- [About](#about)
- [Benefit](#benefits)
- [Info](#info)
- [Components](#components)
- [Setup](#setup)

## About
Hadoop is an Apache open source framework written in java that allows distributed processing 
of large datasets across clusters of computers using simple programming models. 
The Hadoop framework application works in an environment that provides distributed storage and computation across clusters of computers. 
Hadoop is designed to scale up from single server to thousands of machines, 
each offering local computation and storage.

## Benefit
- easy and efficient to manage big data with the distributed storage systems
- OSS
- low cost / cost-effective
- Horizontal Scalability (easy to add new slave nodes) 
- SN (Share nothing architecture)
- FTHA (fault-tolerant and high availability)

## Disadvantages
- Slow Processing Speed => Spark
- Not fit for small data
- Java has been heavily exploited by cybercriminals
- Stability Issues
- Scalability of Master/Leader Node
- No supported real-time or near real-time processing => Spark / Flink
- No delta iteration / not for ML => Spark

## Info
- https://www.tutorialspoint.com/hadoop
- https://medium.com/beeranddiapers/installing-hadoop-on-mac-a9a3649dbc4d
- https://jayden-chua.medium.com/simplest-hdfs-operations-in-5-minutes-f4aa16ead5f6

## Components
- HDFS (Storage layer)
- YARN (Resource Management)
- MapReduce (Processing/Computation layer)

### HDFS
- based on the Google File System
- provides a distributed file system
- highly fault-tolerant
- is designed to be deployed on low-cost hardware
- HDFS uses master-slave architecture
    - master node => Namenode
    - slave node => Datanode

### YARN
- framework for job scheduling
- cluster resource management

### MapReduce
- parallel programming model for writing distirbuted applications
- efficient processing for large amounts of data-sets
- reliable, fault-tolerant
- mostly MapR replaced with Spark

## Setup
[Hadoop Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/Mac)
[HDFS Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/HDFS)
[MapReduce Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/MapReduce)
[Spark Setup](https://github.com/yuyatinnefeld/hadoop/tree/master/Spark)
