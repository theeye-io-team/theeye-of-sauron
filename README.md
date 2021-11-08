# TheEye

____


## docker-storage-compose

ldap 

https://github.com/rroemhild/docker-test-openldap




## DB Import using mongodump

The dump was created using mongodump command - the database name is theeye-docs just for the example.
This is the same procedure to create the database backups.


```

docker exec -it theeye-mongodb mongodump --db=theeye-docs --out=/data/dump/


tar -czf theeye-mongodb.tgz mongodump/theeye-docs/


```


To import it extract the files in the current directory and run mongorestore

1. stop dockers

```

docker-compose -f docker-storage-compose.yml down

```

2. extract. mongodump directory will be created and the files will be placed into it

```

tar -xzf ttarheeye-mongodb.tgz .

```

3. import


```

docker exec -it theeye-mongodb mongorestore /data/dump/

```


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


