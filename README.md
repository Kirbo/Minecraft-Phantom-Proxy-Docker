# Docker image for jhead's Phantom proxy

As described by jhead:
>Makes hosted Bedrock/MCPE servers show up as LAN servers, specifically for consoles.
>You can now play on remote servers (not Realms!) on your Xbox and PS4 with friends.
>It's like having a LAN server that's not actually there, spooky.

## Basic usage:
```bash
docker container run --name phantom-proxy -e SERVER=<server_ip>:<server_port> --network host torqdl/minecraft-phantom-proxy:latest
```
Or with docker compose:
```bash
version: '3.4'
services:
  phantom-proxy:
    image: torqdl/minecraft-phantom-proxy:latest
    container_name: phantom-proxy
    environment:
      - SERVER=example.com:19132
      - PHANTOM_ARCH=x64
      # - BIND_PORT=0
      # - BIND_IP=0.0.0.0
      # - TIMEOUT=60
      # - IPV6=1
      # - DEBUG=1
      # - REMOVE_PORTS=1
      # - WORKERS=16
    network_mode: host
```

## Environment Variables

| Variable       | Required     | Description                                 |
| -------------- | ------------ | ------------------------------------------- |
| SERVER         | Required     | Bedrock/MCPE server IP address and port. <br>Example: `SERVER=192.168.1.5:19132` |
| PHANTOM_ARCH   | Required     | CPU architecture where Phantom is being run. <br>Available Options: `x86`, `x64`, `arm5`, `arm6`, `arm7`, `arm8` <br>Example: `PHANTOM_ARCH=x86` |
| IPV6           | *Optional*   | Enables IPv6 support on port 19133. (experimental) <br>Pass `1` to enable this flag! <br>Example: `IPV6=1` |
| BIND_IP        | *Optional*   | IP address to listen on. Defaults to all interfaces. <br>default: `BIND_IP=0.0.0.0` |
| BIND_PORT      | *Optional*   | Port to listen on. Defaults to 0, which selects a random port. <br>Example: `BIND_PORT=19133` |
| DEBUG          | *Optional*   | Enables debug logging. <br>Pass `1` to enable this flag! <br>Example: `DEBUG=1` |
| REMOVE_PORTS   | *Optional*   | Forces ports to be excluded from pong packets (experimental). <br>Pass `1` to enable this flag! <br>Example: `REMOVE_PORTS=1` |
| TIMEOUT        | *Optional*   | Seconds to wait before cleaning up a disconnected client <br>default: `TIMEOUT=60` |
| WORKERS        | *Optional*   | Specify the number of "threads" to use to process data from clients. <br>Example: `WORKERS=16` |

*Note: host network mode required.*

[GitHub](https://github.com/TORQDL/Minecraft-Phantom-Proxy-Docker) | 
[Docker Hub](https://hub.docker.com/repository/docker/torqdl/minecraft-phantom-proxy-docker) | Phantom written by jhead: [GitHub](https://github.com/jhead/phantom) | Docker image forked from nkelemen18: [GitHub](https://github.com/nkelemen18/Minecraft-Phantom-Proxy-Docker)