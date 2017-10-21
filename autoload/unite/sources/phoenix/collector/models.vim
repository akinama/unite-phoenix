"
" gather candidates
"
function! unite#sources#phoenix#collector#models#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('lib/*_web/models')
endfunction
