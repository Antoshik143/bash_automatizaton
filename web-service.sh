#/bin/bash 
 
# Возвращение вывода к стандартному форматированию
NORMAL='\033[0m'      # ${NORMAL} 
 
# Цветом текста (жирным) (bold) :
WHITE='\033[1;37m'    # ${WHITE}
 
# Цвет фона
BGRED='\033[41m'      # ${BGRED}
BGGREEN='\033[42m'    # ${BGGREEN}
BGBLUE='\033[44m'     # ${BGBLUE}

tg="/home/anton/bash_automatizaton/telegram.sh"

# Получение статуса веб-серввера
nginxstatus=$(systemctl status nginx | grep -Eo "running|failed|dead")

if [[ $nginxstatus = 'running' ]]
  then
    $tg "Веб сервер работает \n$(date)" > /dev/null
    #echo -en "${WHITE} ${BGGREEN} Веб сервер работает ${NORMAL}\n"
  else
    $tg "Nginx не работает \n$(date)" > /dev/null
    sudo systemctl restart nginx
    sleep 1
    $tg "Статут Nginx после перезапуска $(systemctl status nginx | grep -Eo "running|failed|dead") \n$(date)" > /dev/null
    #echo $(curl -I 192.168.211.75 | grep OK) # проверяем отдает ли веб сервер http код 200
fi


#получение статуса php
phpfpmstatus=$(systemctl status php8.1-fpm | grep -Eo "running|failed|dead")
if [[ $phpfpmstatus = 'running' ]]
  then
	  $tg "php8.1-fpm работает, все гуд! \n$(date)" > /dev/null
    #echo -en "${WHITE} ${BGGREEN} php8.1-fpm работает ${NORMAL}\n"
  else
    $tg "php не работает, пробуем перезапустить \n$(date)" > /dev/null
    sudo systemctl restart php8.1-fpm
    sleep 1
    $tg "Статус php8.1-fpm после перезапуска $(systemctl status php8.1-fpm | grep -Eo "running|dead|failed") \n$(date)" > /dev/null
fi
