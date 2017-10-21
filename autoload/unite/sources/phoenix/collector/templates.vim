"
" gather candidates
"
function! unite#sources#phoenix#collector#templates#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('lib/*_web/templates')
endfunction
