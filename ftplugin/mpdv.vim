function! GetMPCStatusline()
  echo 'hehe'
  let cmd = "mpc status"
  let result = split(system(cmd), '\n')

  let status = len(result) == 3 ? result[2] : result[0]

  let [s:count, s:settings] =
        \ [len(split(system('mpc playlist'), '\n')),
        \ split(status, '   ')]

  let s:statusline = " "
        \ . s:settings[1] . " --- "
        \ . s:settings[2] . " ---%="
        \ . s:count . " songs "

  return s:statusline
endfunction

set buftype=nofile
" setlocal statusline=%!GetMPCStatusline()

command! -buffer PlaySelectedSong call mpc#PlaySong(line("."))

nnoremap <silent> <buffer> <cr> :PlaySelectedSong<cr>
nnoremap <silent> <buffer> <c-a> :ToggleRandom<cr>
nnoremap <silent> <buffer> <c-e> :ToggleRepeat<cr>
