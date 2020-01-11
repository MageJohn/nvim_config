command! -nargs=? -complete=custom,s:plugin_list PacUpdate call packagedefs#init() | call minpac#update(<args>)
command! -nargs=? -complete=custom,s:plugin_list PacClean call packagedefs#init() | call minpac#clean(<args>)
command! -bang PacStatus call packagedefs#init() | call s:pac_status(<q-bang>, <q-mods>)
command! -nargs=1 -complete=custom,s:plugin_list PacOpenURL call packagedefs#init() | call system(printf("xdg-open %s", minpac#getpluginfo(<q-args>).url))

function s:plugin_list(...)
  call packagedefs#init()
  return join(minpac#getpackages("minpac", "", "", v:true), "\n")
endfunction

function s:pac_status(bang, mods)
  let l:mods = split(a:mods, ' ')
  let l:config = {'open': 'vertical'}
  if index(l:mods, 'tab') >= 0
    let l:config.open = 'tab'
  elseif a:bang ==# '!'
    let l:config.open = 'horizontal'
  endif

  call minpac#status(l:config)
endfunction
