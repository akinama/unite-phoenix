"
" gather candidates
"
function! unite#sources#phoenix#collector#channels#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('web/channels')
endfunction
