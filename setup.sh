#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags  git 
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags vim-gnome	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git
fi

cd /usr/include/ && sudo ctags -R --fields=+ls 
cd ~/
mypath="$HOME/.vim"

if [ -d $mypath ];then
mv -f ~/.vim ~/.vim_old
else
	mkdir $mypath
fi
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd ~/ && git clone https://github.com/zbqyexingkong/vim
echo "请耐心等待,安装即将完成...." 
mv ~/vim/.vimrc ~/
mv ~/vim/* ~/.vim/bundle/
rm ~/vim/ -fr
#echo "zbqyexingkong正在努力为您安装bundle程序" > zbqyexingkong
#echo "安装完毕将自动退出" >> zbqyexingkong
#vim zbqyexingkong -c "BundleInstall" -c "q" -c "q"
rm zbq_vim_setup.sh
echo "安装完成^_^"
