
filetype plugin indent off

" Linux、Macの場合は.vim、Windowsの場合はvimfilesディレクトリを使う
let s:dein_path = ''
if has('unix') || has('mac') || has('win32unix')
  set runtimepath+=~/.vim/bundle/dein.vim/
  let s:dein_path = '~/.vim/bundle'
else
  set runtimepath+=$HOME/vimfiles/bundle/dein.vim/
  let s:dein_path = $HOME. '/vimfiles/bundle'
endif

if dein#load_state(expand(s:dein_path))
    call dein#begin(expand(s:dein_path))


    " プラグインリストを収めたTOMLファイル
    let g:dein_dir = expand(s:dein_path)
    let s:toml = g:cui_config_path . 'dein.toml'
    let s:lazy_toml = g:cui_config_path . 'dein_lazy.toml'

    " TOMLファイルにpluginを記述
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable
