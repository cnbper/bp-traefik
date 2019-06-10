# traefik

## 初始化操作目录

<https://github.com/containous/traefik/releases>

```shell
TraefikVersion=v1.7.12
wget https://github.com/containous/traefik/releases/download/${TraefikVersion}/traefik-${TraefikVersion}.src.tar.gz

rm -rf traefik-release/*
tar zxvf traefik-${TraefikVersion}.src.tar.gz -C traefik-release
```

## kubernetes 安装

<https://docs.traefik.io/user-guide/kubernetes/>

```shell
kubectl apply -f traefik-release/examples/k8s/traefik-rbac.yaml
# 注意修改镜像地址 registry.sloth.com/traefik/traefik:v1.7.12
# 打印 accessLog
kubectl apply -f traefik-release/examples/k8s/traefik-ds.yaml
# 暴露服务：Traefik Web UI
cat <<EOF | kubectl -n kube-system apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: traefik-web-ui
spec:
  rules:
  - host: traefik.sloth.com
    http:
      paths:
      - path: /
        backend:
          serviceName: traefik-ingress-service
          servicePort: admin
EOF
# 配置host：traefik.sloth.com
```

测试访问：<http://traefik.sloth.com>

## 日常操作

```shell
kubectl -n kube-system get pod -l k8s-app=traefik-ingress-lb -o wide
# 查看代理日志
kubectl -n kube-system logs -f traefik-ingress-controller-qltkt
# 进入容器
kubectl -n kube-system exec -it traefik-ingress-controller-qltkt
```
