set number
set nocompatible
set timeoutlen=1000 ttimeoutlen=10

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

call plug#end()

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

:autocmd InsertEnter,InsertLeave * set cul!

filetype plugin on
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj

