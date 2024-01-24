# Rescue Lab Immich Instance

## Client

## Development

```bash
npm run start
```

## Deployment

```bash
npm run build
```

## Server

### Development

```bash
cd docker
cp example.env .env
$env:CR_PAT = GITHUB_PERSONAL_ACCESS_TOKEN
docker login ghcr.io -u gbiss -p $env:CR_PAT
docker-compose -f docker-compose.ghcr.yml up -V
```

### Deployment

One-time setup. Install the [latest release] of WiX. Then install ps2exe.

```bash
Install-Module -Name ps2exe
```

Package the server as an MSI installer as follows.

```bash
cd deployment
$Env:Path += [IO.Path]::PathSeparator + "E:\WiX"
ps2exe .\startup.ps1
.\BuildInstaller.ps1
```
