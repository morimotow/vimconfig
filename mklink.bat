

rem VimŠÖŒW
if not exist %USERPROFILE%\vimfiles (
  mkdir %USERPROFILE%\vimfiles
)
if not exist %USERPROFILE%\vimfiles\bundle (
  rem mkdir %USERPROFILE%\vimfiles\bundle
  rem git clone https://github.com/Shougo/dein.vim %USERPROFILE%\vimfiles\bundle\dein.vim
)
if not exist %USERPROFILE%\_vimrc (
  mklink %USERPROFILE%\_vimrc %~dp0\.vimrc
)
if not exist %USERPROFILE%\_gvimrc (
  mklink %USERPROFILE%\_gvimrc %~dp0\.gvimrc
)
if not exist %USERPROFILE%\vimfiles\morimoto (
  mklink /d %USERPROFILE%\vimfiles\morimoto %~dp0\.vim\morimoto
)
if not exist %USERPROFILE%\vimfiles\g_morimoto (
  mklink /d %USERPROFILE%\vimfiles\g_morimoto %~dp0\.vim\g_morimoto
)
if not exist %USERPROFILE%\vimfiles\colors (
  mklink /d %USERPROFILE%\vimfiles\colors %~dp0\.vim\colors
)

