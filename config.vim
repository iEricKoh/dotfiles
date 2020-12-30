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

  nnoremap <leader>fa :FlutterRun<cr>
  nnoremap <leader>fq :FlutterQuit<cr>
  nnoremap <leader>fr :FlutterHotReload<cr>
  nnoremap <leader>fR :FlutterHotRestart<cr>
  nnoremap <leader>fD :FlutterVisualDebug<cr>

  let g:Lf_ShortcutF = '<C-P>'

  let dart_html_in_string=v:true
  let g:dart_style_guide = 2
  let g:dart_format_on_save = 1

  "let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

  let s:search_tools.a.command = 'ag'
endf

"func! config#after() abort
"endf
