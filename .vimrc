set nocompatible
filetype off
filetype plugin indent off
au BufNewFile,BufRead Rexfile set filetype=perl
au BufNewFile,BufRead *.t set filetype=perl
au CursorMoved * checktime
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
call vundle#end()
let g:go_fmt_command = "goimports"
set viminfo+=:1000
set backspace=indent,eol,start
filetype plugin indent on
syntax on
