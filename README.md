# Arma Reforger Dedicated Server

An Arma Reforger Dedicated Server. Updates to the latest version every time it is restarted.

## Usage

### Docker CLI

```s
    docker create \
        --name=arma-reforger-server \
        -p 2001:2001/udp \
        -p 50000-65000:50000-65000/udp \
        -v path/to/missions:/arma3/mpmissions \
        -v path/to/configs:/arma3/configs \
        -v path/to/mods:/arma3/mods \
        -v path/to/servermods:/arma3/servermods \
        -e ARMA_CONFIG=main.cfg \
        -e STEAM_USER=myusername \
        -e STEAM_PASSWORD=mypassword \
        synixebrett/arma3server
```

### docker-compose

Use the docker-compose.yml file inside a folder. It will automatically create 4 folders in which the missions, configs, mods and servermods can be loaded.

Copy the `.env.example` file to `.env`, containing at least `STEAM_USER` and `STEAM_PASSWORD`.

Use `docker-compose start` to start the server.

Use `docker-compose logs` to see server logs.

Use `docker-compose down` to shutdown the server.

The `network_mode: host` can be changed to explicit ports if needed.

Use `docker-compose up -d` to start the server, detached.

See [Docker-compose](https://docs.docker.com/compose/install/#install-compose) for an installation guide.

Profiles are saved in `/arma3/configs/profiles`

## Parameters

| Parameter                     | Function                                                  | Default |
| -------------                 |--------------                                             | - |
| `-p 2302-2306`                | Ports required by Arma 3 |
| `-v /arma3/mpmission`         | Folder with MP Missions |
| `-v /arma3/configs`           | Folder containing config files |
| `-v /arma3/mods`              | Mods that will be loaded by clients |
| `-v /arma3/servermods`        | Mods that will only be loaded by the server |
| `-e PORT`                     | Port used by the server, (uses PORT to PORT+3)            | 2302 |
| `-e ARMA_BINARY`              | Arma 3 server binary to use   | `./arma3server_x64` |
| `-e ARMA_CONFIG`              | Config file to load from `/arma3/configs`                 | `main.cfg` |
| `-e ARMA_PROFILE`             | Profile name, stored in `/arma3/configs/profiles`         | `main` |
| `-e ARMA_WORLD`               | World to load on startup                                  | `empty` |
| `-e ARMA_LIMITFPS`            | Maximum FPS | `1000` |
| `-e ARMA_CDLC`                | cDLCs to load |
| `-e STEAM_BRANCH`             | Steam branch used by steamcmd | `public` |
| `-e STEAM_BRANCH_PASSWORD`    | Steam branch password used by steamcmd |
| `-e STEAM_USER`               | Steam username used to login to steamcmd |
| `-e STEAM_PASSWORD`           | Steam password |
| `-e HEADLESS_CLIENTS`         | Launch n number of headless clients                       | `0` |
| `-e MODS_LOCAL`               | Should the mods folder be loaded | `true` |
| `-e MODS_PRESET`              | An Arma 3 Launcher preset to load (relative path, eg: `servermods/preset.html`) |

The Steam account does not need to own Arma Reforger, but must have Steam Guard disabled.

## Loading mods

### TBD
