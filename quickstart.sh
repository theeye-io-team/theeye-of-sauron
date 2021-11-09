#!/bin/bash
echo "################"
echo "#"
echo "# cloning repos for building images"
echo "#"
echo "#"

echo "## WEB"
if [ -d ./sources/theeye-web ]
then
  cd ./sources/theeye-web
  git fetch
  git reset --hard origin/master
  cd ..
else
  git clone --recursive https://github.com/theeye-io-team/theeye-web.git ./sources/theeye-web
fi

echo "## SUPERVISOR"
if [ -d ./sources/theeye-supervisor ]
then
  cd ./sources/theeye-supervisor
  git fetch
  git reset --hard origin/master
  cd ..
else
  git clone --recursive https://github.com/theeye-io-team/theeye-supervisor.git ./sources/theeye-supervisor
fi

echo "## GATEWAY"
if [ -d ./sources/theeye-gateway ]
then
  cd ./sources/theeye-gateway
  git fetch
  git reset --hard origin/master
  cd ..
else
  git clone --recursive https://github.com/theeye-io-team/theeye-gateway.git ./sources/theeye-gateway
fi

echo "################"
echo "#"
echo "# creating network"
echo "#"
echo "################"
docker network create theeye

echo "################"
echo "#"
echo "# building local images"
echo "#"
echo "################"
docker-compose -f quickstart.yml build

echo "################"
echo "#"
echo "# copying assets"
echo "#"
echo "################"
docker run --rm -dit --name 'theeye-web-export' -v ${PWD}/web:/output 'theeye-io/theeye-web' cp -r /app/dist/. /output;

echo "################"
echo "#"
echo "# starting engines"
echo "#"
echo "################"
#docker-compose -f quickstart.yml up -d theeye-redis theeye-db
docker-compose -f quickstart.yml up -d

echo "################"
echo "#"
echo "# importing database"
echo "#"
echo "################"
tar -xzf theeye-mongodb.tgz
docker exec -it theeye-mongodb mongorestore /data/dump/

#docker-compose -f quickstart.yml down

#echo "run"
#docker-compose -f quickstart.yml up -d
echo "################"
echo "#"
echo "#"
echo "# sign in using username:root and password:12345678 <- Change this ASAP. If you are considering using open to the internet."
echo "# "
echo "# App is ready. Navigate http://localhost:6080 "

#command -v xdg-open && xdg-open http://localhost:6080
