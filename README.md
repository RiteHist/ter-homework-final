# ter-homework-final
## Задание 1:

### Создание VPC:

Создание сеети и подсетей происходит в [модуле vpc](https://github.com/RiteHist/ter-homework-final/tree/main/src/vpc).

Созданная сеть с двумя подсетями в Yandex Console:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/1.PNG?raw=true)

### Создание VM:

Создание VM происходит в [файле vm.tf](https://github.com/RiteHist/ter-homework-final/blob/main/src/vm.tf).

Скриншот созданной VM в Yandex Console:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/2.PNG?raw=true)

Для VM описана группа безопасности в [файле security.tf](https://github.com/RiteHist/ter-homework-final/blob/main/src/security.tf).

Скриншот созданной группы безопасности в Yandex Console:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/3.PNG?raw=true)

### Создание Managed Service for MySQL:

Создается MySQL кластер в [файле db.tf](https://github.com/RiteHist/ter-homework-final/blob/main/src/db.tf) с одним хостом.

Скриншот созданного кластера в Yandex Console:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/4.PNG?raw=true)

### Создание Container Registry:

Создается Container Registry в [файле registry.tf](https://github.com/RiteHist/ter-homework-final/blob/main/src/registry.tf) вместе с сервисным аккаунтом для загрузки образа на VM.

Скришот созданного Registry в Yandex Console:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/5.PNG?raw=true)

## Задание 2:

[В файле cloud-init.yml](https://github.com/RiteHist/ter-homework-final/blob/main/src/cloud-init.yml) указана установка Docker на VM.

Скриншот проверки, что Docker и Docker compose успешно установились на VM:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/6.PNG?raw=true)

## Задание 3:

[В каталоге python-web](https://github.com/RiteHist/ter-homework-final/tree/main/src/python-web) лежат Dockerfile и compose файлы для создания контейнеров приложения.

[В модуле docker](https://github.com/RiteHist/ter-homework-final/tree/main/src/docker) происходит сборка образа на основе Dockerfile и отправка его в Container Registry.

## Задание 4:

[В файле cloud-init.yml](https://github.com/RiteHist/ter-homework-final/blob/main/src/cloud-init.yml) указана загрузка compose файлов на VM, установка переменных окружения с данными для подключения к БД и запуск `docker compose`.

Скриншот запущенных контейнеров на VM:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/7.PNG?raw=true)

Скриншот проверки доступности приложения через https://check-host.net:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/8.PNG?raw=true)

Скриншот выборки из БД, показыающий, что приложение корректно сохраняет данные:

![alt text](https://github.com/ritehist/ter-homework-final/blob/main/media/9.PNG?raw=true)