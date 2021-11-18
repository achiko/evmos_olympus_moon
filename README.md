# evmos_olympus_moon

change the following lines in build/docker-entrypoint.sh
```
export MONIKER=changeme
export KEY=changeme
export KEYPASS=changeme
```
use
``` docker logs -f evmos_evmosd_1 ```
after starting and write down your mnemonic passphrase! this is the address where the incentives go.


type "docker volume ls" 
```
DRIVER    VOLUME NAME
local     evmos_evmos-data

```
type "docker volume inspect"
```
docker volume inspect evmos_evmos-data 
[
    {
        "CreatedAt": "2021-11-18T10:35:27+01:00",
        "Driver": "local",
        "Labels": {
            "com.docker.compose.project": "evmos",
            "com.docker.compose.version": "1.29.2",
            "com.docker.compose.volume": "evmos-data"
        },
        "Mountpoint": "/var/lib/docker/volumes/evmos_evmos-data/_data",
        "Name": "evmos_evmos-data",
        "Options": null,
        "Scope": "local"
    }
]

```
"Mountpoint": "/var/lib/docker/volumes/evmos_evmos-data/_data",

thats where your files live. maybe back that up.
