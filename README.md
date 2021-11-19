# TheEye
## What is TheEye?
<table>
  <tr>
    <td> <img src="https://github.com/theeye-io-team/theeye-dockers/blob/master/images/TheEye-Of-Sauron.png"></td>
    <td> TheEye is a process automation platform developed in NodeJS. Best used as BPM, Rapid Backoffice Development (RDA) and processes' hub.
Technically TheEye is a choreographer 
    </td>
   </tr> 
</table>
<div class="container-fluid" style="text-align: center; font-family: 'Open Sans', sans-serif; width: 100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto;">
      <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px;">
        <div class="col-md-12" style="flex: 0 0 50%; max-width: 50%;">
            <table>
              <th><a href="https://bit.ly/3kyybPA"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-linkedin.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/3Di5FsU"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-grupo-rpa-copy.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/3kuVqtE"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-twitter.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/31PIRTb"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_blog-theeye-news.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/31Q7WNT"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-instagram.png" style="width: 45%; margin: 0 auto;"></a></th>
              <th><a href="https://bit.ly/2YDFs8O"; target="_blank"><img src="https://news.theeye.io/wp-content/uploads/2021/11/TheEye_redes-sociales-youtube.png" style="width: 45%; margin: 0 auto;"></a></th>
            </table>
        </div>
      </div>
    </div>

## Architecture

![Image of TheEye-overview](https://github.com/theeye-io-team/theeye-dockers/blob/master/images/TheEye-core-Architect.png)

If you want more information please read the https://documentation.theeye.io

# Install all theeye components on a single machine

## Pre-Requisites
docker and docker compose installed.

Docker: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

Docker-compose: https://docs.docker.com/compose/install/

very it by running:


```docker ps```


If you have some permision issue add your user to the docker's group:


```sudo groupadd docker```

```sudo usermod -aG docker $USER```



## QuickStart

1. Clone: git clone https://github.com/theeye-io-team/theeye-of-sauron && cd theeye-of-sauron   


2. run: ```./quickstart.sh```   


3. Navigate http://localhost:6080    


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


## Documentation


https://documentation.theeye.io


