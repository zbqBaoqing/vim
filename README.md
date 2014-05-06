##vim安装说明

**快速安装方法**
打开终端，执行下面的命令就自动安装好了:

`wget https://github.com/zbqyexingkong/vim/blob/master/setup.sh -o zbq_vim_setup.sh && bash zbq_vim_setup.sh`




效果展示：

![shotimage.PNG](shotimage.PNG)


**或自己手动安装**(:以ubuntu为例)

1.安装vim $: `sudo apt-get install vim`

2.安装ctags $：`sudo apt-get install ctags`
 
3.$: `cd /usr/include/ && sudo ctags -R --fields=+ls && cd` 

4.$: 安装git $: `sudo apt-get install git`

5.安装vundle插件管理器  $: *git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle*

6.clone配置文件 $: `cd ~/ && git clone https://github.com/zbqyexingkong/vim.git`

7.$: `mv ~/vim/.vimrc  ~/`

8.$: `mv ~/vim/* ~/.vim/bundle/`

9.$: `rm ~/vim/ -fr`

 **c.vim插件设置**<br\>
   其中如果你要改变 AUTHOR 和 COMPANY的值, 要修改模板文件 ~/.vim/bundle/c.vim/c-support/templates/Templates <br \>
   $： vim ~/.vim/bundle/c.vim/c-support/templates/Templates <br \>
  |AUTHOR|    = yexingkong(zhangbaoqing) <br\>
  |EMAIL|     = abqyexingkong@gmail.com <br\>
  |COMPANY|   = Xi'an University of post and Telecommunications <br \>
  |COPYRIGHT| = open , free , share <br \>
   
  ###.OK!如果一切顺利的话！你现在就可以打开vim看看效果了，一些快捷键说明你会在 ~/.vimrc中找到，希望你用的愉快，如有不足之处，敬请提出，我会适当修改。

###了解更多vim使用技巧:
[tips.md](tips.md)


