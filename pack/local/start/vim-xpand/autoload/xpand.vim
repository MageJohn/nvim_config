function! xpand#operator(type)
  let l:sel_save = &selection
  let &selection = "inclusive"
  let l:reg_save = @@

  if a:type ==# 'line'
    silent exe "normal! '[V']y"
    for l:i in range(line("'["), line("']"))
      call cursor(l:i, 1)
      let l:line = nvim_get_current_line()
      call nvim_set_current_line(expand(l:line))
    endfor
  elseif a:type ==# 'char'
    silent exe "normal! `[v`]y"
    echo @@
    let @@ = expand(@@)
    silent exe "normal! gvp"
  elseif a:type ==# 'block'
    silent exe "normal! `[\<C-V>`]y"
    let @@ = expand(@@)
    silent exe "normal! gvp"
  else
    silent exe "normal! gvy"
    let @@ = expand(@@)
    silent exe "normal! gvp"
  endif

  let &selection = l:sel_save
  let @@ = l:reg_save
endfunction

