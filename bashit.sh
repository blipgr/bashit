#!/bin/bash
# Проверяем, существует ли директория ~/.bash_it
if [ -d "$HOME/.bash_it" ]; then
	  # Если существует, выводим сообщение и выходим из скрипта
	    echo "Bash-it уже установлен!"
	      exit
fi

# Если не существует, клонируем Bash-It
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
echo "y" | ~/.bash_it/install.sh

# Подключаем Bash-It
source "$HOME/.bash_it/bash_it.sh"

# Включаем Bash-it plugins для git и kubernetes
bash-it enable completion git
bash-it enable completion kubectl
bash-it enable completion systemd

# Включаем Bash-It aliases
bash-it enable alias kubectl
bash-it enable alias systemd
bash-it enable alias git
# Перезагружаем Bash-It
bash-it reload

# Подключаем Bash-It еще раз
source "$HOME/.bash_it/bash_it.sh"

# Клонируем и устанавливаем ble.sh
git clone --recursive --depth=1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

source "$HOME/.bash_it/bash_it.sh"
