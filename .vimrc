"-------------------------------------------------------------------
"
" -- VIM 配置文件 .vimrc
"
"     最后修改时间：2013-11-03
"
"-------------------------------------------------------------------

set shortmess=atI 		 " 启动的时候不显示那个援助乌干达儿童的信息
set autoread 			 " 正在编辑文件被其他程序改动时自动重新加载
set autowrite			"自动保存
syntax on  	         	 " 使用语法高亮
filetype plugin indent on 	 " 打开文件类型检测
set nocompatible   			 " 使用不兼容 vi 的模式（vi模式一些操作很不方便）

set autoindent       		 " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent        		 " 智能对齐方式
set wrap 			 " 自动换行
set linebreak 			 " 整词换行
set tabstop=4 			 " 设置制表符(tab键)的宽度
set softtabstop=4     	 	 " 设置软制表符的宽度    
set shiftwidth=4       	 " (自动) 缩进使用的4个空格
set cindent              	 " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     " 设置C/C++语言的具体缩进方式
set backspace=2          	 " 设置退格键可用
set mouse=a              	 " 使用鼠标
set number              	 " 显示行号
set cul				 " 显示当前行下划线
set showcmd			"输入的命令显示出来，看的更清楚
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容 
set history=1000		" 历史记录数
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
set ruler                   " 打开状态栏标尺
set cursorcolumn	 "垂直对齐线
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set showmatch		" 高亮显示匹配的括号

" 代码折叠
set foldenable
" 折叠方法
" manual 手工折叠
" indent 使用缩进表示折叠
" expr 使用表达式定义折叠
" syntax 使用语法定义折叠
" diff 对没有更改的文本进行折叠
" marker 使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

"侦测文件类型
filetype on
colorscheme  pablo " 设置配色方案 /usr/share/vim/vim74/colors/

" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

filetype indent on	" 为特定文件类型载入相关缩进文件

" 系统剪贴板映射 
set clipboard=unnamedplus
map <C-y> "+y
map <C-p> "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""set over""""""""""""""""""""


au BufNewFile,BufRead *.wsgi set filetype=python
au BufNewFile,BufRead *.inc set filetype=asm


" 自动补全列表的颜色设置
highlight Pmenu ctermfg=black 
highlight PmenuSel ctermfg=white ctermbg=black


"代码格式优化化

map <F4> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc




"""powerline 插件的配置
set nocompatible   	" Disable vi-compatibility
set laststatus=2   	" Always show the statusline
set encoding=utf-8 	" Necessary to show Unicode glyphs
set t_Co=256 		" Explicitly tell Vim that the terminal supports 256 colors
set guifont=PowerlineSymbols\ for\ Powerline 
let g:Powerline_symbols = 'unicode'
let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'



"""C,C++的调试
nmap <F8> : call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %< -Wall"
	exec "!gdb ./%<"
endfunc






"""quickfix插件的配置,<M-j> --> <Alt+j>
"按下F6，执行make编译程序，并打开quickfix窗口，显示编译信息
noremap <F6> :make<CR><CR><CR> :copen<CR><CR>
" 按下Alt+k，光标移到上一个错误所在的行
map <M-k> :cp<CR>
" 按下Alt+j，光标移到下一个错误所在的行
map <M-j> :cn<CR>
" 按下F7，执行make clean
map <F7> :make clean<CR><CR><CR>

" 以下的映射是使上面的快捷键在插入模式下也能用
inoremap <F6> <ESC>:make<CR><CR><CR> :copen<CR><CR>
inoremap <F7> <ESC>:make clean<CR><CR><CR>
imap <M-k> <ESC>:cp<CR>
imap <M-j> <ESC>:cn<CR> 


"""taglist插件的配置
""""""""""""""""""""""""""""""
 " Tag list (ctags)
""""""""""""""""""""""""""""""   
    
let Tlist_Ctags_Cmd = 'ctags'         
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_Enable_Fold_Column = 0    "使taglist插件不显示左边的折叠行，
let Tlist_WinWidth = 28            "taglist窗口宽度
let g:Tb_ForceSyntaxEnable = 1
let Tlist_Exit_OnlyWindow=1
let Tlist_Inc_Winwidth=0	"禁止自动改变当前Vim窗口的大小 
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏



"""syntastic插件的配置
let g:syntastic_check_on_open=1		"在打开文件的时候检查
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"   ""phpcs，tab 4个空格，编码参考使用CodeIgniter风格



"""winmanager插件的配置,使用Ctrl+ww切换窗口
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer|MiniBufferExplorer'
let g:winManagerWidth=26
nmap ty :WMToggle<CR>  	"vim普通模式：调出winmanager的文件浏览器 
map tt :TlistToggle<CR>   "调出Taglist的符号浏览器 


"""c.vim插件的设置
"根根所编文件的扩展名来动态指定模版(参考：http://www.cnblogs.com/longcpp/archive/2011/10/21/2220472.html)
let g:C_Styles = {'*.c,*.h':'C','*.cc,*.cpp,*.hh':'CPP'} 
let g:C_Ctrl_j="off" "因为它会和youcomplete中的<C-j>有冲突，所以就关它

"<F9>: 编译链接
"<Alt+F9>: 只编译不连接
"<Ctrl+F9>: 运行
"<Shift+F9>: 设置命令行参数
"更多快捷键看 ~/.vim/bundle/c.vim/HotKey.txt


"""indentLine插件的设置
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'



"echofunc插件的设置
let g:EchoFuncShowOnStatus = 1





"""a.vim插件的配置
inoremap <F10> <ESC>:A<CR>	"在头文件和源文件的切换  
noremap <F10>  :A<CR>  

"ctrl + F10
inoremap <C-F10> <ESC>:AS<CR> "上下分割窗口
noremap <C-F10> :AS<CR>

"ctrl + a
inoremap <C-a> <ESC>:AV<CR> "左右分割窗口
noremap <C-a> :AV<CR> 



"""neocomplcache插件配置
"向下选择
inoremap <expr> <C-j>	 pumvisible()?"\<C-N>":"<C-X><C-O>"
"向上选择
inoremap <expr> <C-k> 	 pumvisible()?"\<C-p>":"\<C-k>"
"确认选择
 "<tab>键来补全

"不自动弹出列表
let g:NeoComplCache_DisableAutoComplete = 1
"开启此插件
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:c_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'

 " Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {'default' : '', 'vimshell' : $HOME.'/.vimshell_hist','scheme' :$HOME.'/.gosh_completions','css' : $VIMFILES.'/dict/css.dic','php' : $VIMFILES.'/dict/php.dic','javascript' : $VIMFILES.'/dict/javascript.dic'}


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


 if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'




"""UltiSnips插件的配置
let g:UltiSnipsExpandTrigger="<tab>"	"代码补全键
let g:UltiSnipsJumpForwardTrigger="<tab>"  "向前跳 <tab>
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"  "向后跳 <shift+tab>





"""DoxygenToolkit.vim 插件的配置
"(普通模式:fg 生成函数说明)
nmap fg :Dox<CR>    
"(普通模式：ff自动生成文件说明)
nmap ff ::DoxAthor   

let g:DoxygenToolkit_authorName="@Author= "
let g:DoxygenToolkit_briefTag_pre="@Synopsis=  "
let g:DoxygenToolkit_paramTag_pre="@Param= "
let g:DoxygenToolkit_returnTag="@Returns=  "
let   g:DoxygenToolkit_blockHeader="-------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"





"""ctags的配置
set tags=tags;
set autochdir

set tags+=./tags	"表示在当前工作目录下搜索tags文件
set tags+=/usr/local/src/bash-4.2/tags
set tags+=/usr/include/tags
set tags+=/usr/include/bits/tags
set tags+=/usr/include/sys/tags
set tags+=/usr/include/linux/tags
set tags+=/usr/include/arpa/tags
set tags+=/usr/include/netinet/tags
set tags+=/usr/include/c++/4.7.2/tags
set tags+=/usr/include/Qt/tags

"在当前目录生成tags文件
nmap  <F5> :!ctags	-R<CR><CR>
imap  <F5> <Esc>:!ctags -R<CR><CR>


"------------------------------插件管理器vundle的使用-----------------------------"

set nocompatible               
filetype off                   
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


" My Bundles here:    

 """"""来自github上的插件"""""""""""

"美化增强
Bundle "Lokaltog/vim-powerline"  
"显示函数原型
Bundle "mbbill/echofunc"
"括号自动补全
Bundle "jiangmiao/auto-pairs"
"vim中'*'和'#'的增强版
Bundle "mbriggs/mark.vim"
"自动注释插件
Bundle "mrtazz/DoxygenToolkit.vim"
"vim快速 编辑-编译-编辑 
Bundle "quickfix/quickfix"
"语法检查插件
Bundle "scrooloose/syntastic"
"补齐线
Bundle "Yggdroot/indentLine"
"代码自动补齐
Bundle "SirVer/ultisnips"
"代码提示补全
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'




"""""""""来自vim-scripts上的插件

"窗口浏览和文件管理
Bundle "winmanager"
"查看函数列表或类的方法列表
Bundle 'taglist.vim'
"在头文件和源文件间快速切换的插件
Bundle 'a.vim'
"c/c++程序员的插件
Bundle 'c.vim'



"""""""""""来自其他git上的插件



filetype plugin indent on 

"-----------------------------------vundle 管理器结束-------------------------"

" 预防手误的杀招
cnoremap Q! q!
cnoremap Q1 q!
command  Q  q
command  Wq wq
command  WQ wq
command  W  w


"""""更新插件执行: vim +BundleUpdate""""""




