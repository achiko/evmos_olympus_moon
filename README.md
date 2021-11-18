# evmos_olympus_moon

change the following lines in build/docker-entrypoint.sh
```
git clone https://github.com/cventastic/evmos_olympus_moon.git && cd evmos_olympus_moon && MONIKER=StakeSquid KEY_NAME=validator KEY_PASS=SbhspvsGZ4UA docker-compose up -d
```
use
``` docker logs -f evmos_olympus_moon_evmosd_1 ```
after starting and write down your mnemonic passphrase! this is the address where the incentives go.
also you can see here where your genesis transaction is written to.

type "docker volume ls" 
```
DRIVER    VOLUME NAME
local     evmos_olympus_moon_evmos-data

```
type "docker volume inspect"
```
docker volume inspect evmos_olympus_moon_evmos-data 
[
    {
        "CreatedAt": "2021-11-18T10:35:27+01:00",
        "Driver": "local",
        "Labels": {
            "com.docker.compose.project": "evmos",
            "com.docker.compose.version": "1.29.2",
            "com.docker.compose.volume": "evmos-data"
        },
        "Mountpoint": "/var/lib/docker/volumes/evmos_olympus_moon_evmos-data/_data",
        "Name": "evmos_olympus_moon_evmos-data",
        "Options": null,
        "Scope": "local"
    }
]

```
"Mountpoint": "/var/lib/docker/volumes/evmos_olympus_moon_evmos-data/_data",

thats where your files live. maybe back that up.
