set nocompatible 
filetype off                  " required
set backspace=indent,eol,start " 解决插入模式不能删除以前的问题
if empty(glob("~/.vim/bundle/Vundle.vim"))
	    silent execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'toyamarinyon/vim-swift'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

set nu " 显示行号

colorscheme murphy " 主题颜色

set ignorecase " 查询时忽略大小写

set incsearch " 输入进行中实时匹配查找到的字符串
set smartcase " 当输入中含有大写的时候会强制区分大小写
set expandtab " 用一定空格代替tab
set tabstop=4 " tab占4个空格
set softtabstop=4 " 设置expandtab的情况下，输入backspace删除的空格
set shiftwidth=4 "一般情况下tabstop=softtabstop=shiftwidth，这样不会乱
set mouse=a " 支持鼠标
set cursorline " 当前行高亮
set noerrorbells " 出错时不发声
set visualbell " 出错时屏幕闪烁

set wildmenu
set wildmode=longest:list,full " 命令模式下，底部操作按tab自动补全




let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
