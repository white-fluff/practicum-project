## Настройка Kubernetes и ручной деплой пелеменной

### Перед началом работы


> У меня уже был делегированный собственный домен в Yandex Cloud DNS. Пожтому я решил не добавлять этот пункт в terrafrom и добавить A-запись вручную.

**Как работать с Cloud DNS:**
  - [Делегировать домен в Cloud DNS](https://cloud.yandex.ru/docs/dns/operations/zone-create-public).
  - [Создать запись](https://cloud.yandex.ru/docs/dns/operations/resource-record-create).


### Настройка Kubernetes
> **Зависит от этапа – Terraform.**

**После того как мы развернули кластер следуем шагам:**

1. Настраиваем подключение к кластеру для `kubectl`` с помощью этой **[инструкции](https://cloud.yandex.ru/docs/managed-kubernetes/operations/connect/#kubectl-connect)**.

2. Создаём пространстро имён:
```sh
$ kubectl create namespace momo
```
3. Устанавливаем NGINX Ingress-контроллер и Cert Manager.
```sh
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
$ helm repo update
$ helm install ingress-nginx ingress-nginx/ingress-nginx
```
4. Проверяем что у Ingress-контроллера появлися IP:
```sh
$ kubectl get svc
NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP       PORT(S)                      AGE
...
ingress-nginx-controller             LoadBalancer   10.96.216.119   158.160.133.224   80:31473/TCP,443:32650/TCP   39m
...
```
5. Создаём А-запись в DNS c помощью этой **[инструкции](https://cloud.yandex.ru/docs/dns/operations/resource-record-create)**.
> Здесь можно немного подождать пока запись раскатится. 

Проверить можно так:
```sh
$ dig example.com +short
```

6. Установите менеджер сертификатов и сертификат.
```sh
$ kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.13.1/cert-manager.yaml
```
Проверяем что запустили 3 пода в нёймспейсе `cert-manager`. А именно: `cert-manager`, `cert-manager-cainjector`, `cert-manager-webhook`. Пример:
```sh
$ kubectl get pods -n cert-manager
NAME                                       READY   STATUS    RESTARTS      AGE
cert-manager-75d57c8d4b-x724g              1/1     Running   1 (28m ago)   28m
cert-manager-cainjector-69d6f4d488-hc9f2   1/1     Running   0             28m
cert-manager-webhook-869b6c65c4-vbp5w      1/1     Running   0             28m
```
> Этого достаточно но более подробная информация есть в этом **[руководстве](https://cloud.yandex.ru/docs/managed-kubernetes/tutorials/ingress-cert-manager)**.

7. Ручной деплой пелеменной:

```sh
$ kubectl apply -f backend
$ kubectl apply -f frontend
```