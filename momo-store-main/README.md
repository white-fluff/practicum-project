# Momo Store aka Пельменная №2

В этом репозитории хранится код пелеменной и пайплайн описывающий CI проекта.

Пелеменная доступна по доменному имени: [depricated] https://momo-store.white-fluff.com/ 

### Структура репозитория:

```sh
$ tree -d
.
├── backend
│   ├── cmd
│   │   └── api
│   │       ├── app
│   │       └── dependencies
│   └── internal
│       ├── logger
│       └── store
│           └── dumplings
│               ├── fake
│               └── mock
├── frontend
│   ├── public
│   └── src
│       ├── assets
│       ├── components
│       │   ├── cart
│       │   ├── catalog
│       │   ├── misc
│       │   ├── navbar
│       │   └── profile
│       ├── models
│       ├── router
│       ├── services
│       │   └── resources
│       ├── store
│       ├── typings
│       └── views
└── local_run
```

### Описание репозитори:
 - `backend` – исходный код и пайплайн-модуль для бекэнда.
 - `frontend` – исходный код и пайплайн-модуль для фронтэнда.
 - `local_run` – содержит примерный docker-compose файл для локального запуска. Требуется редактирование.
 - `.gitlab-ci.yml` –  родительский пайплан для подключеия модулей.
 - `notify.py` – небольшой скрипт для нотификации в Telegram.
 - `timestamp.yaml` – файл для ведения чейнджлогов и описания коммитов.

### Как работают пайплайны:

**Запуск пайплайна:**
1. Для запуска пайплайна нужно сделать коммит и пуш в с комментариеим к коммиту: `start build`.
2. Запускается пайплайн-модуль, в репозиторий которого были внесены изменения.

**Стейджи пайплайна:**
1. Тестирование.
2. Сборка и загрузка в Nexus-репозиторий артефакта.
3. Сборка и загрузка в Container Registry Docker-образа под тегом с версией сервиса.
4. Обновление и загрузка в Container Registry Docker-образа под тегом `latest`.
5. В Telegram уходит нотификация по статусу пайплайна.

---

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

### Frontend

```bash
npm install
NODE_ENV=production VUE_APP_API_URL=http://localhost:8081 npm run serve
```

### Backend

```bash
go run ./cmd/api
go test -v ./... 
```