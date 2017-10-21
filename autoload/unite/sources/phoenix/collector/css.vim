"
" gather candidates
"
function! unite#sources#phoenix#collector#css#candidates(source)
  return unite#sources#phoenix#helper#gather_candidates_file('priv/static/css')
endfunction
