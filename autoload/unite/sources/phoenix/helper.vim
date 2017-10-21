"
" gather file candidates
"
function! unite#sources#phoenix#helper#gather_candidates_file(path)
  let files = []
  for d in split(globpath(unite#sources#phoenix#helper#phoenix_root(), a:path), '\n')
    if isdirectory(d)
      for f in split(globpath(d, '**/*.*') , '\n')
        if isdirectory(f) | continue | endif
        call add(files , 
              \ {'name' : substitute(f , ".*\/web\/" , "" , "") , 'path' : f })
      endfor
    else
      let files = [{
            \ "name" : fnamemodify(d, ":t") ,
            \ "path" : d
            \ }]
    endif
  endfor

  return map(files , '{
          \ "word" : v:val.name ,
          \ "kind" : "file" ,
          \ "action__path"      : v:val.path ,
          \ "action__directory" : fnamemodify(v:val.path , ":p:h") ,
          \ }')
endfunction
"
" gather cmd candidates
"
function! unite#sources#phoenix#helper#gather_candidates_cmd(command, arguments)
  return map(a:arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : get(v:val , "abbr" , v:val.word) ,
        \ "kind" : "command" ,
        \ "action__command" : s:execute_cmd() . a:command . " " . v:val.word ,
        \ }')
endfunction
"
" gather cmd input candidates
"
function! unite#sources#phoenix#helper#gather_candidates_cmd_input(command, arguments) 
  return map(a:arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : get(v:val, "abbr", v:val.word) ,
        \ "kind" : "command" ,
        \ "action__command" : s:create_cmd_input(a:command, v:val.word, get(v:val, "abbr", v:val.word)) ,
        \ }')
endfunction
"
"
function! s:create_cmd_input(cmd, word, abbr)
  return "call unite#sources#phoenix#helper#execute_cmd_input('". a:.cmd . "','" . a:word . "','" . a:abbr . "')"
endfunction
"
"
function! unite#sources#phoenix#helper#execute_cmd_input(cmd, word, abbr)
  echohl PmenuSel | echo a:abbr | echohl None
  let msg = input(": ")
  if msg == ''
    echo 'abort' | return
  endif
  execute s:execute_cmd() . ' ' . a:cmd . ' ' . a:word . ' ' . msg
endfunction
"
"
function! s:execute_cmd()
  if g:unite_phoenix_execute_cmd == '!'
    return '!'
  else
    return g:unite_phoenix_execute_cmd . ' '
  endif
endfunction


"
" get phoenix root directory
"
function! unite#sources#phoenix#helper#phoenix_root()
  let dir = finddir("web" , ".;")
  if dir == "" | return "" | endif
  return  dir . "/../" 
endfunction
