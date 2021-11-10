#!/bin/bash
echo "################"
echo "#"
echo "# cloning repos for building images"
echo "#"
echo "#"

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "## WEB"
if [ -d ${cwd}/sources/theeye-web ]
then
  cd ${cwd}/sources/theeye-web
  git fetch
  git reset --hard origin/master
else
  git clone --recursive https://github.com/theeye-io-team/theeye-web.git ./sources/theeye-web
fi

cd ${cwd}

echo "## SUPERVISOR"
if [ -d ${cwd}/sources/theeye-supervisor ]
then
  cd ${cwd}/sources/theeye-supervisor
  git fetch
  git reset --hard origin/master
else
  git clone --recursive https://github.com/theeye-io-team/theeye-supervisor.git ./sources/theeye-supervisor
fi

cd ${cwd}

echo "## GATEWAY"
if [ -d ${cwd}/sources/theeye-gateway ]
then
  cd ${cwd}/sources/theeye-gateway
  git fetch
  git reset --hard origin/master
else
  git clone --recursive https://github.com/theeye-io-team/theeye-gateway.git ./sources/theeye-gateway
fi

cd ${cwd}

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

docker-compose -f ${cwd}/quickstart.yml down
rm -rf ${cwd}/web

#docker images | grep "theeye-" | cut -d" " -f1 | while read image
#do
#  docker rmi ${image}
#done

cd ${cwd}
docker-compose -f ${cwd}/quickstart.yml build

echo "################"
echo "#"
echo "# copying assets"
echo "#"
echo "################"
cd ${cwd}
docker run --rm -dit --name 'theeye-web-export' -v ${cwd}/web:/output 'theeye-io/theeye-web' cp -r /app/dist/. /output;

echo "################"
echo "#"
echo "# starting engines"
echo "#"
echo "################"
#docker-compose -f quickstart.yml up -d theeye-redis theeye-db
cd ${cwd}
docker-compose -f ${cwd}/quickstart.yml up -d

echo "################"
echo "#"
echo "# importing database"
echo "#"
echo "################"
cd ${cwd}
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
