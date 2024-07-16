#!/bin/bash

echo "add User CMD here!"

echo "=====User CMD Start!====="
# 快速添加登录github秘钥
alias github='eval "$(/usr/bin/ssh-agent -s)";/usr/bin/ssh-add ~/.ssh/id_rsa'
# 重启内部pm2 服务器
alias repm2='pm2 restart /hexo_run.js'

#### debian 中国区加速
# 如果网络速度快，可以注释
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

#### npm 配置
npm config ls -l

mkdir -p /app/.cache/npm
npm config set cache "/app/.cache/npm" 
# npm config set userconfig "/app/.npmrc"
# npm config set registry https://registry.npmmirror.com

npm config set registry https://registry.npmjs.org/

#### history 持久化
rm -rfv ~/.bash_history
ln -s /app/.bash_history ~/.bash_history

#### ssh 配置
#### 避免 "Are you sure you want to continue connecting (yes/no)? yes"
chmod 600 /app/.ssh/id_rsa 
chmod 644 /app/.ssh/id_rsa.pub 
chmod 700 /app/.ssh 
rm -rfv ~/.ssh
ln -s /app/.ssh ~/.ssh

if [ ! -d "themes/indigo" ]; then
    git clone https://github.com/blinkfox/hexo-theme-matery.git themes/matery
fi

#### npm 插件安装
# 这里用户可以修改自定义安装
npm install --save \
    hexo-include-markdown \
    hexo-douban-card-new \
    hexo-github-card \
    hexo-bilibili-card-new \
    hexo-feed 

echo "=====User CMD end!====="
