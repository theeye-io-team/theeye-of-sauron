# TheEye
## QuickStart

1. Clone: git clone https://github.com/theeye-io-team/theeye-dockers && cd theeye-dockers 
2. Prepare some stuff:
   * mongodump for restoring: ```tar -xzf theeye-mongodb.tgz```
   * dependencies (by now) We are moving this to dockerhub in the next weeks 
       ```git clone --recursive https://github.com/theeye-io-team/theeye-web.git ./sources/theeye-web```
       ```git clone --recursive https://github.com/theeye-io-team/theeye-supervisor.git ./sources/theeye-supervisor```
       ```git clone --recursive https://github.com/theeye-io-team/theeye-gateway.git ./sources/theeye-gateway```
3. Run some services: 
   * create network: ```docker network create theeye```
   * run redis and mongo: ```docker-compose -f quickstart.yml up -d theeye-redis theeye-db``` 
4. docker exec -it theeye-mongodb mongorestore /data/dump/
5. run theeye: ```docker-compose -f quickstart.yml down && docker-compose -f quickstart.yml up -d```
6. sign in using username:root and password:123456 <- Change this ASAP. If you are considering using open to the internet.



## Other Info

## DB Import using data creation script (customizable)

1. start docker

```

docker-compose -f docker-storage-compose.yml up -d

```

2. cp db-import into mongodump directory

```

cp db-import.js mongodump

```

3. edit db-import.js. replace the first line with the db name you want

```

const dbName = 'theeye-root'

```

4. execute the import script. WARNING! The script will destroy all the data in the target db

```

docker exec -it theeye-mongodb mongo /data/dump/db-import.js

```


