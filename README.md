# docker-acestream-x86_64
Docker image to run acestream-engine in x86_64 system

## How to build
```
docker build -t acestream .
```

## How to run
```
docker run -it --rm -v $(pwd)/acestream.conf:/opt/acestream/acestream.conf -p8621:8621 -p6878:6878 acestream
```

## Check if works
Replace ``<docker_host>`` with ``localhost`` if you run docker locally
```
http://<docker_host>:6878/webui/api/service?method=get_version
```

## How to play
Acestream can be played using next url
```
http://<docker_host>:6878/ace/getstream?id=<ID>
```
or

```
http://<docker_host>:6878/ace/manifest.m3u8?id=<ID>
```


## Acestream Settings
```
http://<docker_host>:6878/webui/app/acestream/server
```
