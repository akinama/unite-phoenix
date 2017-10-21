"
" gather candidates
"
function! unite#sources#phoenix#collector#controllers#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('web/controllers')
endfunction
