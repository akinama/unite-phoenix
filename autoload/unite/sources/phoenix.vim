call unite#util#set_default('g:unite_phoenix_execute_cmd'  , 'VimShellExecute')

let s:source = {}
"
" define sources
"
function! unite#sources#phoenix#define()
  
  let rel_path = 'autoload/unite/sources/phoenix/collector/*.vim'
  let names    = map(split(globpath(&runtimepath, rel_path), "\<NL>") , 
                     \ 'fnamemodify(v:val , ":t:r")')
  let list = []
  for val in names
    let source = copy(s:source)
    let source.description = "candidates from " . val . " list"
    let source.name =  "phoenix/" . val
    call add(list , source)
  endfor
  return list
endfunction
"
" gather candidates
"
function! s:source.gather_candidates(args, context)
  return s:gather_candidates(self)
endfunction
"
"
function! s:gather_candidates(source)
  let root = unite#sources#phoenix#helper#phoenix_root()
  if root == "" 
    redraw
    echohl ErrorMsg | echo 'PhoenixRoot does not exist.' | echohl None | return [] 
  end

  " TODO
  let a:source.source__phoenix_root = root

  let func_name = "unite#sources#phoenix#collector#" . 
        \ substitute(a:source.name , 'phoenix/' , '' , '') . "#candidates"
  return {func_name}(a:source)
endfunction
