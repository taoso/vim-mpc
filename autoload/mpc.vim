function! mpc#DisplayPlaylist()
  let cmd = "mpc --format '%file%' playlist"
  let playlist = split(system(cmd), '\n')

  call append(0, playlist)
endfunction

function! mpc#PlaySong(no)
  let command = "mpc play " . a:no
  let result = split(system(command), "\n")
  let message = '[mpc] NOW PLAYING: ' . result[0]
  echomsg message
endfunction

function! mpc#TogglePlayback()
  let command = 'mpc toggle'
  let result = split(system(command), '\n')[1]

  let message = '[mpc]'
  let message .= split(result, ' ')[0] == '[paused]' ? 'PAUSED' : 'PLAYING'
  echo message
endfunction

function! mpc#ToggleRandom()
  let command = 'mpc random'
  let result = split(system(command), '\n')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[2] == 'random: off'
        \ ? '[mpc] RANDOM: OFF' : '[mpc] RANDOM ON'
  echo message
endfunction

function! mpc#ToggleRepeat()
  let command = 'mpc repeat'
  let result = split(system(command), '\n')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[1] == 'repeat: off'
        \ ? '[mpc] REPEAT: OFF' : '[mpc] REPEAT: ON'
  echo message
endfunction
