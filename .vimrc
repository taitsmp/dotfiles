syntax on
set tags=./tags,tags;
"autochdir seems to mess with grep.  Use :find to find the files you want.  always open vim in root area. 
"set autochdir
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

" http://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" syntastic - currently not working. 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_javascript_checkers = ['jsxhint']

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

if executable('cabal')

  map <silent> <Leader>e :Errors<CR>
  map <Leader>s :SyntasticToggleMode<CR>
  let g:syntastic_auto_loc_list=1

  "--haskellmode-vim
  au BufEnter *.hs compiler ghc

  "-- ghc-mod -- 
  " Reload
  map <silent> tu :call GHC_BrowseAll()<CR>
  " Type Lookup
  map <silent> tw :call GHC_ShowType(1)<CR>

  "--not sure this is working.
	"--tagbar
  nmap <leader>= :TagbarToggle<CR>
  let g:tagbar_autofocus = 1

	"-- hdevtools --
  au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
  au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
  au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>  
endif

if executable('pointfree')
  "autocmd BufEnter *.hs set formatprg=pointfree
endif
