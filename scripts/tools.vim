" execute 'source' expand(expand("<sfile>:p:h")) . "/conn.vim"

" dbext$B$+$i(Bsqlplus$B$r<B9T$9$k:]$N(BNLS$B@_Dj(B
let $NLS_LANG = "Japanese_Japan.AL32UTF8"

" $B%F%9%H%G!<%?EjF~(BSQL$BJ8:n@.(B
function! M_DBCreateTestData() range

	if a:lastline - a:firstline <= 1
		echo '$B%G!<%?9TL$A*Br(B'
		return
	endif

    let line = getline(a:firstline, a:lastline)
	let t_name = line[0]

	" delete$BJ8(B
"	execute a:firstline. ',' a:firstline. 's/^\(.*\)$/delete from \1 where ;/'

	" insert$BJ8(B
	execute ''. (a:firstline + 1). ',' (a:firstline + 1). 's/\t/,/g | :s/^/insert into '. t_name . '(/ | :s/$/)/'
	let i = a:firstline + 2

	" values$B6g$r=g$K:n@.(B
	while i <= a:lastline
		execute ''. i. ',' i. 's/\t/'',''/g | :s/^/values(''/g | :s/$/'');/g | :s/''<NULL>''\|''\%u200b(NULL)\%u200b''/null/ge'
		let i = i + 1
	endwhile
	
	" $B%G!<%?9T$,(B1$B9T$N>l9g$O$3$3$G=*$o$j(B
	if a:lastline - a:firstline <= 2
		execute a:firstline. ',' a:firstline. 'delete'
		return
	endif

	" insert$BJ8$r$=$l$>$l(Bvalues$B6g$KDI2C(B
	let insert_sql = getline(a:firstline + 1)
	execute ''. (a:firstline + 3). ',' (a:lastline). 's/^/'. insert_sql . '/g'

	execute a:firstline. ',' a:firstline. 'delete'

	nohlsearch
endfunction
command! -range Td :<line1>,<line2>call M_DBCreateTestData()

" $B%9%H%"%I%W%m%7!<%8%c:n@.(B
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

" $B%9%H%"%I%W%m%7!<%8%c<B9T(B
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

" dbext$B%W%m%U%!%$%k@ZBX(B
function! M_DBSwitchDatabase(prof)
	if exists('g:loaded_dbext')
		exec 'DBSetOption profile=' . a:prof
		echo a:prof
	endif
endfunction

