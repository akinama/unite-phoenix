"
" gather candidates
"
function! unite#sources#phoenix#collector#config#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('config')
endfunction
