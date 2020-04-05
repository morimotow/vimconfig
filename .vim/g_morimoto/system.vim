"----------------------------------------
""システム設定
"----------------------------------------
""エラー時の音とビジュアルベルの抑制。
set noerrorbells
set novisualbell
set visualbell t_vb=

if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
     "XIMの入力開始キー
     "set imactivatekey=C-space
  endif
endif

"IMEの状態をカラー表示
if has('multi_byte_ime') || has('xim')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

