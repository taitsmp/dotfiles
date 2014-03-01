syntax on
set tags=./tags,tags;
set autochdir
set path=.,~/smp_blog/htdocs,~/smp_blog/htdocs/**,,
execute pathogen#infect()
set hidden

"tab = 2 spaces
set shiftwidth=2
set tabstop=2

"unimpaired not listening to me.
nnoremap <silent> [b :bprevious 
nnoremap <silent> ]b :bnext 
nnoremap <silent> [B :bfirst 
nnoremap <silent> ]B :blast

