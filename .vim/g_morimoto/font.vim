"フォント設定
"フォントは英語名で指定すると問題が起きにくくなります
if has('xfontset')
"  set guifontset=a14,r14,k14
elseif has('mac')
  set guifont=Ricty:h16
  set guifontwide=Ricty:h16
"  set ambiwidth=auto
elseif has('unix')
  set guifont=Ricty\ Diminished\ 12
elseif has('win32') || has('win64')
"  set guifont=Myrica\ M:h14
  set guifont=Consolas:h13
  set guifontwide=MeiryoKe_Console:h13
  set ambiwidth=auto
  set renderoptions=type:directx,geom:1,renmode:5,level:0.75
endif

"印刷用フォント
if has('printer')
  if has('win32') || has('win64')
"    set printfont=MS_Mincho:h12:cSHIFTJIS
"    set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

