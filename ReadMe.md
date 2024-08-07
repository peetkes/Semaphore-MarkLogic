# Semaphore-MarkLogic cluster

This project describes how to setup a docker cluster with all semaphore components with a MarkLogic database as backend.

For this purpose you need to download the proper licence file and the various rpm files from Semaphore and put those in the right folders. Get the rpms and the appropriate licence file from here: https://portal.smartlogic.com/support/downloads

Notice the english spelling of licence;-)


Folder Cons:

- licence
- java-11-amazon-corretto-dvel-11.0.23.9-1x86.rpm
- Semaphore-ConceptsServer-5.8.0.noarch.rpm

Folder CS:

- licence
- java-11-amazon-corretto-dvel-11.0.23.9-1x86.rpm
- Semaphore-ClassificationServer-5.8.0-1.x86_64.rpm
- Semaphore-LanguagePack-Linux-Base-5.8.0.rpm
- Semaphore-LanguagePack-Linux-English-5.8.0.rpm

Folder RS:

- licence
- java-11-amazon-corretto-dvel-11.0.23.9-1x86.rpm
- Semaphore-ReconciliationServer-5.8.0.noarch.rpm

Folder SES:

- licence
- java-11-amazon-corretto-dvel-11.0.23.9-1x86.rpm
- Semaphore-SES-5.8.0-1.noarch.rpm

Folder Studio:

- licence
- java-11-amazon-corretto-dvel-11.0.23.9-1x86.rpm
- Semaphore-Studio-5.8.0-1.noarch.rpm


## Spin up the cluster

Create a .env file with the following entries (your mileage may vary):

```
DOCKERPROJECT=sem_5_8_cluster

mlVersionTag=11.2.0-ubi

MARKLOGIC_ADMIN_USERNAME=admin
MARKLOGIC_ADMIN_PASSWORD=admin
MARKLOGIC_WALLET_PASSWORD=admin
SEMAPHORE_ADMIN_USERNAME=Administrator
SEMAPHORE_ADMIN_PASSWORD=admin
```

Run `./start.sh` to start the cluster, first time may take some time as all images have to be downloaded.

Run `./stop.sh` to stop the cluster.

Run `./down.sh -v` to completely remove the containers, network and volumes.

Leave out the `-v` if you want to persist the volumes.


For the marklogic container there are 3 folders mapped to the host:
- ./data folder on host will be mapped to /data/debug
- ./backups folder on host will be mapped to /data/backups
- ./logs folder on host will be mapped to /var/opt/MarkLogic/Logs

WIth these mappings you can persist backups, get data fom host to container so you can use xdmp:load to load documents via the QConsole and tail logs on your host system.

