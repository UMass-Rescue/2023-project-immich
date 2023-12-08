# $env:DB_USERNAME="postgres"; $env:DB_PASSWORD="postgres"; $env:DB_DATABASE_NAME="immich"; $env:NODE_ENV="development"; $env:TYPESENSE_HOST="localhost"; $env:TYPESENSE_API_KEY="some-random-text"; $env:REDIS_HOSTNAME="localhost"; node immich/main.js
mkdir E:/immich_staging
$env:IMMICH_HOME=pwd

# build server
echo "installing server packages"
cp -r server/package.json E:/immich_staging
cp -r server/package-lock.json E:/immich_staging
cd E:/immich_staging
npm install --force # need to force for exiftool-vendored.pl
echo "building server"
cd $env:IMMICH_HOME
cp -r server/* E:/immich_staging
cd E:/immich_staging
npm run build
mv dist build_server
npm prune --omit=dev --omit=optional
mv node_modules server_node_modules

cd $env:IMMICH_HOME

# build web
echo "installing web packages"
cp -r web/package.json E:/immich_staging
cp -r web/package-lock.json E:/immich_staging
cd E:/immich_staging
npm install
echo "building client"
cd $env:IMMICH_HOME
cp -r -force web/* E:/immich_staging
cd E:/immich_staging
npm run build:svelte
mv build www
rm -r node_modules

echo "cleaning up"
cd $env:IMMICH_HOME
cp server/package.json E:/immich_staging
cp server/package-lock.json E:/immich_staging
cp docker/example.env E:/immich_staging/.env
mv E:/immich_staging/server_node_modules E:/immich_staging/node_modules
mv E:/immich_staging/build_server E:/immich_staging/build
cp -r E:/immich_staging web/staging
