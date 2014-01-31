if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set nocompatible                              " no compatibility vith old vi
set shell=/bin/bash                           " set bash for internal use and no fish
set showcmd

call neobundle#rc(expand('~/.vim/bundle/'))   " active neoblundle
NeoBundleFetch 'Shougo/neobundle.vim'         " Let NeoBundle manage NeoBundle

syntax enable

" enable filetype settings
filetype on
filetype plugin on
filetype plugin indent on

set backspace+=start,eol,indent               " restart the backspace settings

" tab stuff"
set expandtab                                 " convert tab to spaces
set shiftwidth=2                              " autoindex spaces  
set softtabstop=2                             " tab stops have length: 2

set number                                    " line numbers

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
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'xolox/vim-colorscheme-switcher'
NeoBundle 'xolox/vim-misc'
NeoBundle 'dag/vim-fish'

" Split opening order
set splitbelow
set splitright

" Fonts and Schemes
set guifont=MonoOne:h17
set linespace=5
colorscheme candyman

" Disable alert sound for MacVim
set vb

" Keymaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" check neobundle installation
NeoBundleCheck

