set encoding=utf-8
scriptencoding utf-8
set fileformat=unix

" Vi互換OFF
set nocompatible

" Linux、Macの場合は.vim、Windowsの場合はvimfilesディレクトリを使う
if has('unix') || has('mac')
  set runtimepath+=$HOME/.vim
else
  set runtimepath+=$HOME\vimfiles

endif

" 基本的な設定ファイルを読み込む
let g:cui_config_path = ''
if has('win32') || has('win64')
	let g:cui_config_path = $HOME. '\vimfiles\morimoto\'
else
	let g:cui_config_path = $HOME. '/.vim/morimoto/'
endif


" 設定ファイル読み込み
function! M_LoadLocalBaseSetting(config_name)
  silent! exec 'source '. g:cui_config_path. a:config_name
endfunction

call M_LoadLocalBaseSetting('base.vim')
call M_LoadLocalBaseSetting('display.vim')
call M_LoadLocalBaseSetting('search.vim')
call M_LoadLocalBaseSetting('key_normal.vim')
call M_LoadLocalBaseSetting('key_insert.vim')
call M_LoadLocalBaseSetting('statushilite.vim')
call M_LoadLocalBaseSetting('statusline.vim')
call M_LoadLocalBaseSetting('zenkakuspace.vim')
call M_LoadLocalBaseSetting('filetype.vim')
" call M_LoadLocalBaseSetting('dein.vim')
