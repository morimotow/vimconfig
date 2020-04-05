"----------------------------------------
" 表示設定
"----------------------------------------
"ツールバーを非表示
set guioptions-=T
"下スクロールバーを表示
set guioptions+=b
"選択中の文字列をマウス中ボタンでペースト(linuxのみ)
if has('unix')
  set guioptions+=a
endif
"コマンドラインの高さ
set cmdheight=2
"カラー設定:
colorscheme desert
