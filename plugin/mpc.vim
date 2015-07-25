function! OpenMPC()
  if bufexists('mpc.mpdv')
    let mpcwin = bufwinnr('mpc.mpdv')
    if mpcwin == -1
      execute "sbuffer " . bufnr('mpc.mpdv')
    else
      execute mpcwin . 'wincmd w'
      return
    endif
  else
    execute "new mpc.mpdv"
  endif
  call mpc#DisplayPlaylist()
endfunction

if !exists(":PlaySelectedSong")
endif

command! MpcBrowser call OpenMPC()
command! TogglePlayback call mpc#TogglePlayback()
command! ToggleRandom call mpc#ToggleRandom()
command! ToggleRepeat call mpc#ToggleRepeat()
