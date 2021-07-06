# Setup with VM VirtualBox

1. Install VM VirtualBox

2. Download the Hortonworks Sandbox image 
https://www.cloudera.com/search.html?i=1;q=hdp+sandbox;q1=Downloads;x1=doctype
   
3. Open and import the image

4. Open the browser
localhost:1080
   
5. click LAUNCH DASHBOARD

6. Login by Browser
- username = maria_dev
- password = maria_dev

7. login by Shell 
```bash
ssh maria_dev@127.0.0.1 -p 2222
password: maria_dev
```

```bash
hadoop fs -ls
```
download a file from the website
```bash
wget http://media.sundog-soft.com/hadoop/ml-100k/u.data
```