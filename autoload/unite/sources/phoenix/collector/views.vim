"
" gather candidates
"
function! unite#sources#phoenix#collector#views#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('lib/*_web/views')
endfunction
