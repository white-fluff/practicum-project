## Admin Tools

**Установка тулзов:**

1. **Grafana**

```sh
$ helm upgrade --install --atomic grafana grafana
```

2. **Prometheus**

```sh
$ helm upgrade --install --atomic prometheus prometheus
```

3. **[Установка Loki](https://github.com/grafana/helm-charts/tree/main/charts/loki-stack)**.
```sh
$ helm repo add grafana https://grafana.github.io/helm-charts
$ helm repo update
$ helm upgrade --install loki grafana/loki-stack
```

[Документация Loki](https://grafana.com/docs/grafana/latest/datasources/loki/)