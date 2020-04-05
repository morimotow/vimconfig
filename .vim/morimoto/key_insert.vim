"----------------------------------------
" 挿入モード用キーマップ
"----------------------------------------
"ctrl+jでノーマルモードに戻る
imap <C-j> <esc>

" コンソールで矢印キーを使うとABCDが入力されるのを回避
if !has('gui_running')
    set notimeout
    set ttimeout
    set timeoutlen=100
endif
