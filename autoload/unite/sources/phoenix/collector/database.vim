"
" gather candidates
"
function! unite#sources#phoenix#collector#database#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('priv/repo')
endfunction
