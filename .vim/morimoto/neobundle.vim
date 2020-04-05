filetype off
filetype plugin indent off
" Linux、Macの場合は.vim、Windowsの場合はvimfilesディレクトリを使う
if has('unix') || has('mac') || has('win32unix')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand("~/.vim/bundle/"))
else
  set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
  call neobundle#begin(expand("$HOME/vimfiles/bundle/"))
endif

" プラグインの一覧
NeoBundle 'Shougo/neobundle.vim'  " NeoBundle本体

" Vimproc(windows/mac版は同梱)
if !has('win32') && !has('mac')
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
  \ }
endif

NeoBundle 'vim-jp/vimdoc-ja'      " 日本語ヘルプ(最初に1回だけ helptags ~/.vim/bundle/vimdoc-ja/docを実行)

" 囲み文字テキストオブジェクト
NeoBundle 'tpope/vim-surround'

" テキストオブジェクト置換
NeoBundle 'kana/vim-operator-replace.git'
NeoBundle 'kana/vim-operator-user.git'
map R  <Plug>(operator-replace)

" Shellなどの実行機能
NeoBundleLazy 'thinca/vim-quickrun', {
        \ 'autoload' : {
        \ 'mappings' : [['nxo', '<Plug>(quickrun)']],
        \ 'commands' : 'QuickRun',
        \ }}

NeoBundleLazy 'Shougo/unite.vim' , {
			\   'autoload' : { 'commands' : [ 'Unite' ] }
			\ }
NeoBundle 'Shougo/neomru.vim'

NeoBundleLazy 'Shougo/vimfiler', {
	  \ 'depends' : 'Shougo/unite.vim',
	  \ 'autoload' : {
	  \    'commands' : [{ 'name' : 'VimFiler',
	  \                    'complete' : 'customlist,vimfiler#complete' },
	  \                  'VimFilerExplorer',
	  \                  'Edit', 'Read', 'Source', 'Write'],
	  \    'mappings' : '<Plug>',
	  \    'explorer' : 1,
	  \ }
	  \ }

" プロジェクト管理
NeoBundle 'vimplugin/project.vim'

" プロジェクト毎に設定ファイルを分ける
NeoBundle 'embear/vim-localvimrc'

" 文字列補完機能
if has('lua')
  NeoBundle 'Shougo/neocomplete', {'lazy': 1, 'autoload': {'insert': 1 }}
endif
NeoBundle 'Shougo/neosnippet-snippets', {'lazy': 1, 'autoload': {'insert': 1 }}
NeoBundle 'Shougo/neosnippet', {'lazy': 1, 'autoload': {'insert': 1 }}

" Javascript開発環境(node.jsが必要 - mac/unix[cygwin除外])
if (has('mac') || has('unix')) && !has('win32unix')
  NeoBundleLazy 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'mac': 'npm install',
    \   'unix': 'npm install'
    \},
    \'autoload': {'filetypes': ['javascript', 'typescript'],'functions': ['tern#Complete', 'tern#Enable']}
  \}
endif

" ctags読み込み
NeoBundleLazy 'majutsushi/tagbar', {
  \   'autoload' : { 'commands' : [ 'TagbarToggle' ] }
  \ }

" 文法チェック
NeoBundleLazy 'scrooloose/syntastic', {
  \   'autoload' : { 'commands' : [ 'SyntasticCheck' ] }
  \ }

" SQL文実行
NeoBundleLazy 'vim-scripts/dbext.vim', {
  \   'autoload' : { 'filetypes' : [ 'sql' ] }
  \ }

NeoBundle 'tfnico/vim-gradle'

NeoBundleLazy 'plasticboy/vim-markdown', {
  \   'autoload' : { 'filetypes' : [ 'markdown' ] }
  \ }
NeoBundleLazy 'kannokanno/previm', {
  \   'autoload' : { 'filetypes' : [ 'markdown' ] }
  \ }
NeoBundleLazy 'tyru/open-browser.vim', {
  \   'autoload' : { 'filetypes' : [ 'markdown' ] }
  \ }

NeoBundleLazy 'cohama/agit.vim', {
  \   'autoload' : { 'commands' : [ 'Agit' ] }
  \ }

NeoBundleLazy 'Shougo/vimshell.vim', {
  \   'autoload' : { 'commands' : [ 'VimShell' ] }
  \ }

NeoBundleLazy 'junegunn/vim-easy-align', {
  \   'autoload' : { 'commands' : [ 'EasyAlign' ] }
  \ }

call neobundle#end()
filetype plugin indent on
