"
" gather candidates
"
function! unite#sources#phoenix#collector#js#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('web/static/js')
endfunction
