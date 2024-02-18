## Terrafrom Infra

### Подготовка к установке инфраструктуры:
  1. В начале необходимо установить Terrafrom и настроить провайдер. Это подробно описано в этой **[статье](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#install-terraform)** документации Yandex Cloud.
  2. **[Создать сервисный аккаунт](https://cloud.yandex.ru/docs/iam/operations/sa/create)** с ролью `storage.admin` – необходим для хранения состояния в S3.
  3. **[Создать статический ключ доступа](https://cloud.yandex.ru/docs/iam/operations/sa/create-access-key)** для передачи Access Key и Secret Key в соответствующие переменные в файле `tf_env.sh`.
  4. **[Создать бакет](https://cloud.yandex.ru/docs/storage/operations/buckets/create)** для хранения состояний.
  5. Заполняем переменные `TF_VAR_cloud_id` `TF_VAR_folder_id` `TF_VAR_zone` в файле `tf_env.sh`.

P.S: Сохранение стейта и создание такого СА тоже можно было реализовать через Terraform но я решил пойти таким немного мануальным путём.


### Развёртываение инфраструктуры:
**1. Установка контектса для Terrafrom:**
```sh
$ source tf_env.sh
```

**2. Развёртываение:**
```sh
$ terraform init
$ terraform plan
$ terraform apply
```
