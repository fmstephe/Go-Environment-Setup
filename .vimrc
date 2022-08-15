set nocompatible
filetype off
filetype plugin indent off
au BufNewFile,BufRead Rexfile set filetype=perl
au BufNewFile,BufRead *.t set filetype=perl
au CursorMoved * checktime
:set encoding=utf-8
:set fileencoding=utf-8
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'junegunn/fzf'
call vundle#end()
let g:go_fmt_command = "goimports"
let g:go_list_autoclose = 0
let g:go_fold_enable = []
set viminfo+=:1000
set backspace=indent,eol,start
:command TF call fzf#run(fzf#wrap({'sink': 'tab drop'}))
map <F7> :tabprevious<cr>
map <F8> :tabnext<cr>
nnoremap H gT
nnoremap L gt
map nn :set number relativenumber<CR>
map mm :set nonumber norelativenumber<CR>
:command NoTests set ma | g/_test/d
set ruler
filetype plugin indent on
syntax on
