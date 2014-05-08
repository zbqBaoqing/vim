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
if[!-x "~/.vim/"]; then
mkdir ".vim"
fi
mv -f ~/.vim ~/.vim_old
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd ~/ && wget https://raw.githubusercontent.com/zbqyexingkong/vim/master/.vimrc 
#git clone https://github.com/zbqyexingkong/vim.git
echo "zbqyexingkong正在努力为您安装bundle程序"
echo "安装完毕将自动退出" >> zbqyexingkong
echo "请耐心等待" >> zbqyexingkong
vim zbqyexingkong -c "BundleInstall" -c "q" -c "q"
rm zbqyexingkong zbq_vim_setup.sh
echo "安装完成"
