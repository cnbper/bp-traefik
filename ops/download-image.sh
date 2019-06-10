TraefikVersion=v1.7.12

docker pull traefik:${TraefikVersion}

# 推送镜像
docker tag traefik:${TraefikVersion} registry.sloth.com/traefik/traefik:${TraefikVersion}
docker push registry.sloth.com/traefik/traefik:${TraefikVersion}
docker rmi registry.sloth.com/traefik/traefik:${TraefikVersion}