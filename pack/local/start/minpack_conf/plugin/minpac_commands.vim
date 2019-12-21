command! -nargs=? -complete=customlist,s:plugin_list PacUpdate call packagedefs#init() | call minpac#update(<args>)
command! -nargs=? -complete=customlist,s:plugin_list PacClean call packagedefs#init() | call minpac#clean(<args>)
command! -bang PacStatus call packagedefs#init() | call s:pac_status(<q-bang>, <q-mods>)

function s:plugin_list(...)
  call packagedefs#init()
  return minpac#getpackages("minpac", "", "", v:true)
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
