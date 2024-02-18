## Momo Store Infrastructure Docs

В данном репозитории собраны конфигурации и инструкции по развертыванию инфраструктуры Momo Store.

### Описание каталогов:
 - `terraform` – содержит облачную IaC-конфигурацию инфраструктуры.
 - `momo-k8s-manifest` – содержит классические манифесты для ручного деплоя сервисов Momo Store.
 - `helm-admin-tools` – содержит helm-чарты для деплоя вспомогательного ПО.
 - `momo-helm-chart` – содержит чарты helm-чарты для деплоя сервисов Momo Store.

*Подробное описание можно найти в дерриктории к каждому модулю.*

### Краткий чек-лист развёртки:
 1. Разворачиваем облачную инфраструктуру `terraform`.
 2. Настраиваем Kubernetes и деплоим сервисы `momo-k8s-manifest`.
 3. Проверяем что всё работает.
 4. Разворачиваем вспомогательное ПО `helm-admin-tools`.
 5. Ещё раз тестируем и приверям.

### Деплой с помощью Helm и GitLab CI:

1. Редактируем Helm-чарт для Backend и Frontend.
2. Прописываем все необходимые версии в самом чарте, а также добавляем версию чарта в переменную `VERSION` в файле пайплайна `.gitlab-ci.yml`.
3. Добавляем описание с причиной редактиврования и времинем в файл `timestamp.yaml`.
4. Для старта делаем коммит и пуш в с комментариеим к коммиту: `make it beautiful`.
5. Пайплан пакует чарт и заливает его в репозиторий.
6. Далее нужно вручную заппустить джобу с деплоем в кластер.

P.S. Для наставника:
> Я считаю что такое решение не лучшее. Изначально у меня была идея сделать красиво через ArgoCD. Сам Helm-чарт стоило разместить в основном репозитории с кодом, разделить его на 2 независимых и делать релиз чарта в основном пайплайне. Да и если честно сам helm-чарт можно сделать намного лучеш. Но у меня уже поджимают сроки я решил ускорится.

### Структура репозитория:
```sh
❯ tree .
.
├── README.md
├── helm-admin-tools
│   ├── argo-cd
│   ├── cert-manager
│   ├── grafana
│   └── prometheus
├── momo-helm
│   ├── README.md
│   └── momo-store
│       └── README.md
├── momo-k8s-manifests
│   ├── backend
│   │   ├── deployment.yaml
│   │   ├── secrets.yaml
│   │   └── service.yaml
│   ├── certificate.yaml
│   └── frontend
│       ├── configmap.yaml
│       ├── deployment.yaml
│       ├── ingress.yaml
│       ├── secrets.yaml
│       └── service.yaml
└── terraform
    ├── README.md
    ├── main.tf
    ├── modules
    │   ├── k8s-cluster
    │   │   ├── README.md
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   └── s3-bucket
    │       ├── README.md
    │       ├── images
    │       │   ├── jiaozi.jpg
    │       │   ├── khinkali.jpg
    │       │   ├── kurze.jpg
    │       │   ├── mantas.jpg
    │       │   ├── ravioli.jpg
    │       │   ├── tung_tong.jpg
    │       │   ├── vareniki.jpg
    │       │   └── сhinese_dumplings.jpg
    │       ├── main.tf
    │       └── variables.tf
    ├── tf_env.sh
    ├── tf_env_test.sh
    └── variables.tf
```