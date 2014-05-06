#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git 
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8 twisted
cd /usr/include/ && sudo ctags -R --fields=+ls && cd
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd ~/ && git clone https://github.com/zbqyexingkong/vim.git
mv -f ~/vim/.vimrc ~/
mv -f ~/vim/* ~/.vim/bundle/
rm -fr ~/vim/
echo "zbqyexingkong正在努力为您安装bundle程序" > zbqyeingkong
echo "安装完毕将自动退出" >> zbqyexingkong
echo "请耐心等待" >> zbqyexingkong
vim install -c "BundleInstall" -c "q" -c "q"
rm install
echo "安装完成"
