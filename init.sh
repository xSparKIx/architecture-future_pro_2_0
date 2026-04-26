echo "Обновляем пакеты:"
sudo apt update

echo "Добавляем GPG-ключ HashiCorp:"
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Добавляем репозиторий:"
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Обновляем список пакетов после добавления репозитория"
sudo apt update

echo "Установка Terraform:"
sudo apt install terraform

echo "Проверяем установку:"
terraform -version

echo "Устанавливаем yc"
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash