
if has("autocmd")
	filetype plugin on
	filetype indent on

	autocmd FileType html   setlocal sw=2 sts=2 ts=2 et
	autocmd FileType eruby   setlocal sw=2 sts=2 ts=2 et

	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et cole=0
	let g:vim_markdown_folding_disabled=1
endif
