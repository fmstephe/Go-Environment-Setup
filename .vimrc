set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
call vundle#end()
let g:go_fmt_command = "goimports"
set viminfo+=:1000
filetype plugin indent on
syntax on
