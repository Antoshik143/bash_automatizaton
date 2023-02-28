# Bash-скрипт для мониторинга состояния сервисов nginx и php

Для добавления в планировщик crontab использовать:

```
crontab -e
```
В конце файла добавить строку:

```
5 * * * * /bin/bash /home/anton/bash_automatizaton/web-service.sh >> /home/anton/bash_automatizaton/webcheck.log
```
Проверка состояния каждые 5 минут.