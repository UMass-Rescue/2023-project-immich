if ($null -eq $env:CR_PAT) {echo "CR_PAT must be set"; exit 1}

docker login ghcr.io -u gbiss -p $env:CR_PAT
docker-compose -f $PSScriptRoot/docker-compose.ghcr.yml up -V
