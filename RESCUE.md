# Rescue Lab Immich Instance

## Docker

```bash
cd docker
cp example.env .env
$env:CR_PAT = GITHUB_PERSONAL_ACCESS_TOKEN
docker login ghcr.io -u gbiss -p $env:CR_PAT
docker-compose -f docker-compose.ghcr.yml up -V
```

## Deployment

### Server

Package the server as an MSI installer as follows.

```bash
cd deployment
$Env:Path += [IO.Path]::PathSeparator + "E:\WiX"
.\BuildInstaller.ps1
```
