" dbext用の設定
let s:bundle = neobundle#get('dbext.vim')
function! s:bundle.hooks.on_source(bundle)
	let g:dbext_default_MYSQL_bin = '/usr/local/opt/mysql51/bin/mysql'
endfunction
unlet s:bundle
