func! config#before() abort
   let g:mapleader  = ','
   let g:coc_config_home = '~/.SpaceVim.d/'

  " don't show the help in normal mode
  let g:Lf_HideHelp = 1
  let g:Lf_UseCache = 0
  let g:Lf_UseVersionControlTool = 1
  let g:Lf_IgnoreCurrentBufferName = 1

  let g:Lf_WindowPosition = 'popup'
  let g:Lf_PreviewInPopup = 1
  let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
  let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

endf

func! config#after() abort
  "
endf
