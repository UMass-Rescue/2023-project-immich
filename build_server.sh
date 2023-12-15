# export NODE_ENV=development; export TYPESENSE_HOST=localhost; export TYPESENSE_API_KEY=some-random-text; export REDIS_HOSTNAME=localhost; node dist/main immich
mkdir /tmp/immich_staging

# build server
echo installing server packages
cp -r server/package.json server/package-lock.json /tmp/immich_staging
cd /tmp/immich_staging
npm install
echo building server
cd -
cp -r server/* /tmp/immich_staging
cd /tmp/immich_staging
npm run build
mv dist build_server
npm prune --omit=dev --omit=optional
mv node_modules server_node_modules

cd -

# build web
echo installing web packages
cp -r web/package.json /tmp/immich_staging
cd /tmp/immich_staging
npm install --force
echo building client
cd -
cp -r web/* /tmp/immich_staging
cd /tmp/immich_staging
npm run build:svelte
mv build www
rm -rf node_modules

echo cleaning up
cd -
cp server/package.json /tmp/immich_staging
cp server/package-lock.json /tmp/immich_staging
cp docker/example.env /tmp/immich_staging/.env
mv /tmp/immich_staging/server_node_modules /tmp/immich_staging/node_modules
mv /tmp/immich_staging/build_server /tmp/immich_staging/build

cp -r /tmp/immich_staging web/staging
