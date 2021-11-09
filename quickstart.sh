#!/bin/bash
echo "cloning repos for building images"
git clone --recursive https://github.com/theeye-io-team/theeye-web.git ./sources/theeye-web
git clone --recursive https://github.com/theeye-io-team/theeye-supervisor.git ./sources/theeye-supervisor
git clone --recursive https://github.com/theeye-io-team/theeye-gateway.git ./sources/theeye-gateway
echo "creating network"
docker network create theeye
echo "importing database"
tar -xzf theeye-mongodb.tgz
docker-compose -f quickstart.yml up -d theeye-redis theeye-db
docker exec -it theeye-mongodb mongorestore /data/dump/
docker-compose -f quickstart.yml down
echo "building local images"
docker-compose -f quickstart.yml build
echo "copying html assets"
docker run --rm -dit --name theeye-dockers_theeye-web -v ${cwd}/web:/output ubuntu_theeye-web cp -r /app/dist/. /output;
echo "run"
docker-compose -f quickstart.yml up -d
echo "sign in using username:root and password:123456 <- Change this ASAP. If you are considering using open to the internet."
