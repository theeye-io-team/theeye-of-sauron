
cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${cwd}
tar -xzf theeye-mongodb.tgz

echo "################"
echo "# starting engines"
echo "################"
docker-compose -f ${cwd}/quickstart.yml up -d

# local web configuration
cp config/web.js web/config.js
sed -i 's|<!--[if true]><script src="/config.js"></script><![endif]-->|<script src="/config.js"></script>|' web/config.js

echo "################"
echo "# importing database"
echo "################"
# mongodb initial data import
docker exec -it theeye-mongodb mongorestore /data/dump/

echo "################"
echo "# sign in using username:root and password:12345678 <- Change this ASAP. If you are considering using open to the internet."
echo "# "
echo "# App is ready. Navigate http://localhost:6080 "
