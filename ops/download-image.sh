RemoteRegistry=registry.sloth.com

TraefikVersion=v1.7.12

docker pull traefik:${TraefikVersion}

# 推送镜像
docker tag traefik:${TraefikVersion} ${RemoteRegistry}/traefik/traefik:${TraefikVersion}
docker push ${RemoteRegistry}/traefik/traefik:${TraefikVersion}
docker rmi ${RemoteRegistry}/traefik/traefik:${TraefikVersion}