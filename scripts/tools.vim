" execute 'source' expand(expand("<sfile>:p:h")) . "/conn.vim"

" dbextからsqlplusを実行する際のNLS設定
let $NLS_LANG = "Japanese_Japan.AL32UTF8"

" テストデータ投入SQL文作成
function! M_DBCreateTestData() range

	if a:lastline - a:firstline <= 1
		echo 'データ行未選択'
		return
	endif

    let line = getline(a:firstline, a:lastline)
	let t_name = line[0]

	" delete文
"	execute a:firstline. ',' a:firstline. 's/^\(.*\)$/delete from \1 where ;/'

	" insert文
	execute ''. (a:firstline + 1). ',' (a:firstline + 1). 's/\t/,/g | :s/^/insert into '. t_name . '(/ | :s/$/)/'
	let i = a:firstline + 2

	" values句を順に作成
	while i <= a:lastline
		execute ''. i. ',' i. 's/\t/'',''/g | :s/^/values(''/g | :s/$/'');/g | :s/''<NULL>''\|''\%u200b(NULL)\%u200b''/null/ge'
		let i = i + 1
	endwhile
	
	" データ行が1行の場合はここで終わり
	if a:lastline - a:firstline <= 2
		execute a:firstline. ',' a:firstline. 'delete'
		return
	endif

	" insert文をそれぞれvalues句に追加
	let insert_sql = getline(a:firstline + 1)
	execute ''. (a:firstline + 3). ',' (a:lastline). 's/^/'. insert_sql . '/g'

	execute a:firstline. ',' a:firstline. 'delete'

	nohlsearch
endfunction
command! -range Td :<line1>,<line2>call M_DBCreateTestData()

" ストアドプロシージャ作成
function! M_DBCreateProcedure()
"    let endLine = search('^\c/\nEXIT;\s*$', 'cnw')
"    let line = getline(1, endLine - 1)
    let line = getline(1, "$")
    let query = ''
    let query = join(line, "\n"). "\n"
    let query .= "/\n"
    let query .= "show errors;\n"
    let query .= "exit;\n"
    let sql_cmd = "DBExecSQL ". query
    exec sql_cmd
endfunction
nnoremap <Leader>spc :call M_DBCreateProcedure()<CR>

" ストアドプロシージャ実行
function! M_DBExecuteProcedure() range
    let line = getline(a:firstline, a:lastline)
    let query = ''
    let query .= "set serveroutput on;\n"
    let query .= "variable oRtncode VARCHAR2(2048);\n"
"    let query .= "variable oRtncode VARCHAR2(200);\n"
"    let query .= "variable oMessage VARCHAR2(200);\n"
    let query .= "DECLARE\n"
    let query .= "  oRtncode VARCHAR2(2048);\n"
"    let query .= "  oRtncode VARCHAR2(200);\n"
"    let query .= "  oMessage VARCHAR2(200);\n"
    let query .= "BEGIN\n"
    let query .= join(line, "\n"). "\n"
    let query .= "    DBMS_OUTPUT.PUT_LINE('oRtncode = ' || oRtncode);\n"
"    let query .= "    DBMS_OUTPUT.PUT_LINE('oMessage = ' || oMessage);\n"
    let query .= "end;\n"
    let query .= "/\n"

    let sql_cmd = "DBExecSQL ". query
    exec sql_cmd
endfunction
vnoremap <Leader>spe :call M_DBExecuteProcedure()<CR>

" dbextプロファイル切替
function! M_DBSwitchDatabase(prof)
	if exists('g:loaded_dbext')
		exec 'DBSetOption profile=' . a:prof
		echo a:prof
	endif
endfunction

