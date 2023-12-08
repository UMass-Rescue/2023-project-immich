# create-svelte

Everything you need to build a Svelte project, powered by [`create-svelte`](https://github.com/sveltejs/kit/tree/master/packages/create-svelte).

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```bash
# create a new project in the current directory
npm init svelte

# create a new project in my-app
npm init svelte my-app
```

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://kit.svelte.dev/docs/adapters) for your target environment.

## Electron

Building Electron is still very brittle right now. The process is multistage. First run the following; it
will create a temp folder and replicate the steps in ../server/Dockerfile to build both server and web. It
will then copy the folder to `web/staging`.

### OSX

```bash
./build_server.sh
```

### Windows
```
./build_server.ps1
```

We now have all the files necessary to build electron. 

```bash
cd staging
npm install -g electron-builder
npm run build:electron
```

If successful, you should find build files in `staging/dist`. 

### Running the executable

Things will totally crash if you don't first run the server locally. You can do so with the following (requires docker)

```bash
cd docker
source example.env
docker-compose -f docker-compose.no-serv.yml up
```

For some reason, it is still not possible to run the executable by double-clicking on the `Sveltekit Electron` app:
`dist/mac/Sveltekit Electron.app`. Instead, you must right-client and "Show Package Contents", then navigate to
`ist/mac/Sveltekit Electron.app/Contents/MacOS`. Double-clicking on that `Sveltekit Electron` executable will open
a window that actually loads the web page.
