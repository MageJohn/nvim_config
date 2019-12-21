function! plugup#execute()
    if !exists("g:plugup#plug_git")
        return s:err("g:plugup#plug_git not set")
    endif

    let plug_git = expand(g:plugup#plug_git)

    if !isdirectory(plug_git)
        return s:err(plug_git .. " does not exist")
    elseif !(isdirectory(plug_git .. "/.git") 
            \ || filereadable(plug_git .. "/.git"))
        return s:err(plug_git .. " is not a git repository")
    endif

    let output = system(printf("git -C %s pull", s:shellesc_sh(plug_git)))

    if v:shell_error
        return s:err(printf("Error when pulling from git. Return code %s. Output:\n%s", string(v:shell_error), output))
    elseif output =~# "^Already up-to-date.\n"
        return s:msg("vim-plug is already up-to-date.")
    else
        return s:msg("vim-plug was updated")
    endif
endfunction

function! s:shellesc_sh(arg)
  return "'".substitute(a:arg, "'", "'\\\\''", 'g')."'"
endfunction

function s:msg(msg)
    echom '[plugup] ' . a:msg
endfunction

function s:err(msg)
  echoerr '[plugup] '.a:msg
endfunction
