
let g:synchronize_files_remote_host = ''
let g:synchronize_files_local_root = ''
let g:synchronize_files_remote_root = ''
let g:synchronize_files_remote_user = ''
let g:synchronize_files_remote_pass = ''
let g:synchronize_files_pscp_root = ''
let g:synchronize_files_pscp_protocol = '-sftp'
let g:synchronize_files_plink_protocol = '-ssh'

let s:plink_cmd = ''
let s:pscp_cmd = ''
let s:filter_cmd = ' | nkf -E -s'
let s:filter_cmd_all = ' 2>&1 | nkf -E -s'

" 試験仕様書作成用
function! S_MakeSpec() range

	let lines = split(getreg('*'), '\n')

	for line in lines
		let items = split(line, '\t')
		call append('$', [items[1]. 'が実行されている', '('. items[0]. 'の内容)'])
	endfor

endfunction
command! -range Ms :<line1>,<line2>call S_MakeSpec()

" 選択しているファイルパスを転送
function! S_UpdateScriptList() range

    let lines = getline(a:firstline, a:lastline)
	if empty(lines)
		echo 'データ行未選択'
		return
	endif

	argdelete *

	for line in lines
		argadd line
	endfor
	
endfunction
"vnoremap <F10> :call S_UpdateScriptList()<CR>
command! -range Aa :<line1>,<line2>call S_UpdateScriptList()

" 現在開いているファイルを転送
function! S_UpdateScript()

	let s:plink_cmd = 'plink -pw '. g:synchronize_files_remote_pass. ' -l '. g:synchronize_files_remote_user. ' '. g:synchronize_files_plink_protocol. ' ' . g:synchronize_files_remote_host . ' '
	let s:pscp_cmd = 'pscp -pw '. g:synchronize_files_remote_pass. ' -l '. g:synchronize_files_remote_user. ' '. g:synchronize_files_pscp_protocol . ' '

	let file_path = s:getCurrentPath(expand("%:p"))

	call s:transferScript(file_path)

endfunction

" ファイルパス指定転送
function! s:transferScript(file_path)

	let original_exists = s:originalFileExists(a:file_path)
	if !original_exists
		echo '元のファイル"'. a:file_path. '"がサーバーにありません'
		return
	endif

"	let backup_exists = s:backupFileExists(file_path)
"	if !backup_exists
"		call s:createBackup(file_path)
"	endif
"
	call s:sendNewFile(a:file_path)
endfunction

function! s:getCurrentPath(name)
	let result = substitute(a:name, g:synchronize_files_local_root, '', "g")
	if strlen(result) == strlen(a:name)
		return ''
	else
		return result
	endif
endfunction

function! s:originalFileExists(file_path)
	let confirm_cmd = s:plink_cmd. 'ls '. g:synchronize_files_remote_root. a:file_path. s:filter_cmd
echo confirm_cmd
	let confirm_result = system("cmd /c " . confirm_cmd )
	if strlen(confirm_result) == 0
		return 0
	else
		return 1
	endif
endfunction
function! s:backupFileExists(file_path)
	let confirm_cmd = s:plink_cmd. 'ls '. g:synchronize_files_remote_root. a:file_path. '.' . strftime("%y%m%d"). ' '. s:filter_cmd
	let confirm_result = system("cmd /c " . confirm_cmd )
	if strlen(confirm_result) == 0
		return 0
	else
		return 1
	endif
endfunction

function! s:createBackup(file_path)
	let before_path = g:synchronize_files_remote_root. a:file_path
	let after_path = g:synchronize_files_remote_root. a:file_path. '.' . strftime("%y%m%d")

	let rename_cmd = s:plink_cmd. 'cp '. before_path. ' '. after_path. s:filter_cmd_all
	echo rename_cmd
	let rename_result = system("cmd /c " . rename_cmd )
	echo rename_result
endfunction

function! s:sendNewFile(file_path)
	let local_path = g:synchronize_files_local_root. a:file_path
	let remote_path = g:synchronize_files_pscp_root. a:file_path

	let send_cmd = s:pscp_cmd. local_path. ' '. remote_path. s:filter_cmd_all
	echo send_cmd
	let send_result = system("cmd /c " . send_cmd )
	echo send_result
endfunction

nnoremap <F9> :call S_UpdateScript()<CR>
