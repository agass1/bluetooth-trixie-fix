#!/bin/bash

# root check
if [[ $EUID -ne 0 ]]; then
   echo "Пожалуйста, запустите скрипт с правами root: sudo ./bluetooth_fix.sh"
   exit 1
fi

echo "=== Очищаем все, связанное с Bluetooth ==="
sudo apt purge -y pulseaudio-module-bluetooth bluetooth "bluez-*" bluez

echo "=== Удаляем старые данные Blueman и Bluetooth ==="
sudo rm -rf /var/lib/blueman /var/lib/bluetooth

echo "=== Переустанавливаем пакеты Bluetooth ==="
sudo apt update
sudo apt install -y blueman bluez pulseaudio-module-bluetooth --install-suggests

echo "=== Готово! ==="

# Запрос на перезагрузку
read -p "Хотите перезагрузить систему сейчас? Введите 'yes' для подтверждения: " answer
if [[ "$answer" == "yes" ]]; then
    echo "Перезагрузка..."
    sudo reboot
else
    echo "Перезагрузка отменена. Вы можете перезагрузить систему позже вручную."
fi
