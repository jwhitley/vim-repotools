" http://stackoverflow.com/questions/4478891/is-there-a-vimscript-equivalent-for-rubys-strip-strip-leading-and-trailing-s
function! s:strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function s:cd_to_repo_root()
  let root = s:strip(system("git rev-parse --show-toplevel 2>& /dev/null"))
  if v:shell_error
    echo "Not in a git repository"
  else
    execute "cd `=root`"
    echo "Now in ".getcwd()
  endif
endfunction

command! Rr :execute s:cd_to_repo_root()
