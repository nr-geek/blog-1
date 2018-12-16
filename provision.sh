ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
root@31.186.103.128

# База

# Установим postgres + библиотеки для gem pg
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
apt-get update
yes | apt-get install postgresql-10
yes | apt-get install postgresql-contrib libpq-dev

# Создаём пользователя
su - postgres
createuser root
alter user root createdb
createdb -O root blog

# Проект

# Создаём папку для проекта
mkdir /app

# Настроим ключи и поместим их в гитхаб
ssh-keygen
cat ~/.ssh/id_rsa.pub

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
usermod -a -G rvm root
groups
rvm install 2.5.0

# nodejs

# yarn
curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt-get update
apt-get install -y nodejs
npm install -g yarn

vim /etc/environment
# SECRET_KEY_BASE=5b85f7df9437360186d729511d8a48935fa43180efd26a6db69661d3f3ce0c6fc9bcea39bd5fa93f9c27a246e76498d98534af904676e955b9f153dfeb914597
# DATABASE_URL=postgres:///blog
# RAILS_ENV=production
# RAILS_SERVE_STATIC_FILES=true

cap production puma:config

# bundle exec puma -C config/puma.rb config.ru

# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# vim /etc/postgresql/10/main/pg_hba.conf
# set local and postgres to trust
# service postgresql restart