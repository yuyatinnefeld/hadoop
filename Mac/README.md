
#Setup for Mac-User

0. install hadoop
```bash
brew install hadoop
```
1. open hadoop (version 3.3.1) repo
```bash
cd /usr/local/Cellar/hadoop/3.3.1
```

2. get the java sdk path
```bash
/usr/libexec/java_home
```
=> /Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home

3. update the hadoop-env.sh file (JAVA_HOME=xxxxx)
```bash
vi /usr/local/Cellar/hadoop/3.3.1/libexec/etc/hadoop/hadoop-env.sh
```

```bash
# The java implementation to use. By default, this environment
# variable is REQUIRED on ALL platforms except OS X!
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home
```

4. update the core-site.xml
```xml
...
<!-- Put site-specific property overrides in this file. -->
<configuration>
  <property>
    <name>hadoop.tmp.dir</name>
    <value>/usr/local/Cellar/hadoop/hdfs/tmp</value>
    <description>A base for other temporary directories</description>             
  </property>
  <property>
    <name>fs.default.name</name>
    <value>hdfs://localhost:8020</value>
  </property>
</configuration>
```

5. update the mapred-site.xml
```xml
...
<!-- Put site-specific property overrides in this file. -->

<configuration>
  <property>
    <name>mapred.job.tracker</name>
    <value>localhost:8021</value>
  </property>
</configuration>
```

6. update the hdfs-site.xml

```xml
...
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
</configuration>
```

7. configure the ssh

activate remote login by Mac
System Preferences> File Sharing > Remote Login
![GitHub Logo](/images/remote-login.png)

7.0
```bash
ssh localhost
```

if you get this error
```bash
ssh: connect to host localhost port 22: Connection refused
```
7.1 run below commands and Authorize SSH Keys
```bash
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
```

7.2 if you could log in it's fine
```bash
ssh localhost
Last login: Sun Jul  4 15:55:24 2021 from ::1
```

8 check the hdfs format
```bash
cd /usr/local/opt/hadoop
hdfs namenode -format
```

if you see this message than fine
```bash
WARNING: /usr/local/Cellar/hadoop/3.3.1/libexec/logs does not exist. Creating.
2021-07-04 15:59:04,187 INFO namenode.NameNode: STARTUP_MSG: 
/************************************************************
STARTUP_MSG: Starting NameNode
STARTUP_MSG:   host = Yuyas-MBP/192.168.0.120
STARTUP_MSG:   args = [-format]
STARTUP_MSG:   version = 3.3.1

...

2021-07-04 15:59:05,485 INFO namenode.NameNode: SHUTDOWN_MSG:
/************************************************************
SHUTDOWN_MSG: Shutting down NameNode at Yuyas-MBP/192.168.0.120
************************************************************/
```

9. start hadoop server

alias update
```bash
cd /Users/yuyatinnefeld
nano .bashrc
alias hadoop_start="/usr/local/Cellar/hadoop/3.3.1/sbin/start-all.sh"
alias hadoop_stop="/usr/local/Cellar/hadoop/3.3.1/sbin/stop-all.sh"
```

```bash
hadoop_start
```

run JPS to check the services
```bash
jps
```
```bash
42768 NodeManager
42466 SecondaryNameNode
42326 DataNode
42663 ResourceManager
42220 NameNode
37292 
42878 Jps
```

Resource Manager:
> http://localhost:9870

JobTracker:
> http://localhost:8088/

Node Specific Info:
> http://localhost:8042/
