" Project.vim用の設定
"
" \Pで、プロジェクトを開閉
:nmap <silent> <Leader>P <Plug>ToggleProject

" プロジェクトを開いた時に、ツリー展開した状態にする
autocmd BufAdd .vimprojects silent! %foldopen!
autocmd BufNewFile,BufRead *.vimprojects setlocal expandtab tabstop=1 shiftwidth=1

