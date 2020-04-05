"----------------------------------------
" システム設定
"----------------------------------------
"mswin.vimを読み込む
"source $VIMRUNTIME/mswin.vim
"behave mswin

:set encoding=utf-8

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップ/スワップファイルを作成する/しない
set nobackup
set noswapfile
"Undoファイルを使用しない
if v:version > 703
  set noundofile
endif
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
if has('unnamedplus')
  set clipboard+=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>,~
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完するときに強化されたものを使う
set wildmenu wildmode=list:full
"マウスを有効にする
if has('mouse')
  set mouse=a
endif
"ヘルプファイルは日本語を優先的に読み込む
set helplang=ja,en
"文字コードの自動判別設定
:set fileencodings=iso-2022-jp,euc-jp,cp932,sjis,utf-8,utf-16le
"改行コードの自動判別設定
:set fileformats=unix,dos,mac
" タブ幅制御
set tabstop=4
set softtabstop=0
set shiftwidth=4
" 折り返ししない
set nowrap
set textwidth=0
