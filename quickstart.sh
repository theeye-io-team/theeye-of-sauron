#!/bin/bash

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${cwd}
tar -xzf theeye-mongodb.tgz

echo "####################"
echo "# starting engines"
echo "####################"

if ! docker --help | grep compose;
then
  if ! command -v docker-compose;
  then
    echo "install docker-compose to continue the installation"
    exit
  else
    docker-compose -f ${cwd}/quickstart.yml pull
    docker-compose -f ${cwd}/quickstart.yml up -d
  fi
else
  docker compose -f ${cwd}/quickstart.yml pull
  docker compose -f ${cwd}/quickstart.yml up -d
fi

echo "#####################"
echo "# importing database"
echo "#####################"

echo "The database will be replaced with the initial dump. Press Enter to continue"
read 

# mongodb initial data import
docker exec -it theeye-mongodb mongorestore --drop /data/dump/

echo "################"
echo "# sign in using username:root and password:12345678 <- Change this ASAP. If you are considering using open to the internet."
echo "# "
echo "# App is ready. Navigate http://localhost:6080 "
echo "# "
