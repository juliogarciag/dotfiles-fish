if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set nocompatible                              " no compatibility vith old vi
set shell=/bin/bash                           " set bash for internal use and no fish
set showcmd

call neobundle#rc(expand('~/.vim/bundle/'))   " active neoblundle
NeoBundleFetch 'Shougo/neobundle.vim'         " Let NeoBundle manage NeoBundle

" enable filetype settings
filetype on
filetype plugin on
filetype plugin indent on

syntax enable                                 " enable syntax highlighting
set backspace+=start,eol,indent               " restart the backspace settings

" tab stuff"
set expandtab                                 " convert tab to spaces
set shiftwidth=2                              " autoindex spaces  
set softtabstop=2                             " tab stops have length: 2

set number                                    " line numbers
colorscheme elflord

" search
set incsearch
set ignorecase 
set smartcase

"Neobundle plugins"
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \     'windows' : 'make -f make_mingw32.mak',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'unix' : 'make -f make_unix.mak',
 \    },
 \ }

NeoBundle 'https://github.com/Valloric/YouCompleteMe.git' , {
 \ 'build' : {
 \    'mac' : './install.sh --clang-completer --system-libclang'
 \   },
 \ }

NeoBundle 'tpope/vim-commentary'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'

"check neobundle installation"
NeoBundleCheck

