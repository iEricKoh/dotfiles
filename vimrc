" This must be first, because it changes other options as a side effect.
set nocompatible

if !has('nvim')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif


source ~/.plug_vimrc

" coc.nvim
" ----------------------------------------------------
if has('nvim')
  source ~/.config/nvim/coc.vim
endif


set t_Co=256
set autoindent
set smartindent
set smartcase
set encoding=UTF-8
set cul
set backupcopy=yes

"set paste
set showcmd


set autoread " reload files when changed on disk

set autowrite

" expand tabs to spaces
set expandtab

" case-insensitive search
set ignorecase

" always show statusline
set laststatus=2

" Remove -- INSERT
set noshowmode

" Show line numbers
set number

" Set relative line number
set relativenumber

" Enable XML folding
"let g:xml_syntax_folding = 1

" Enables code folding based on syntax file
" set foldmethod=syntax

" show the cursor position all the time
set ruler

" normal mode indentation commands use 2 spaces
set shiftwidth=2

" insert mode tab and backspace use 2 spaces
set softtabstop=2

" actual tabs occupy 2 characters
set tabstop=2

" show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noswapfile
set nowritebackup
set nobackup		" do not keep a backup file, use versions instead

set history=500		" keep 50 lines of command line history
set incsearch		" do incremental searching

set vb

" Switch syntax highlighting on,
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

vnoremap < <v
vnoremap > >v

" our <leader> will be the space key
let mapleader=","

" our <localleader> will be the '-' key
let maplocalleader="-"


" Don't use Ex mode, use Q for formatting
map Q gq

" Format Jump
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"augroup FiletypeGroup
"  autocmd!
"  au BufNewFile,BufRead *.jsx set filetype=javascript
"augroup END

autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Get correct comment highlight
autocmd FileType json syntax match Comment +\/\/.\+$+

" Plugins
"
" yats
let g:yats_host_keyword = 1

" vim-go
let g:go_def_mode='gopls'
let g:go_addtags_transform = "snakecase"
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_list_type = "quickfix"
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_fmt_command = "goimports"
let g:go_template_autocreate = 0
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_textobj_include_function_doc = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
"let g:go_fmt_fail_silently = 1

" =============================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0

" Plugins
" -----------------------------------------------------------------------

let g:lightline#ale#indicator_checking = "\uf110 Linting..."
let g:lightline#ale#indicator_errors = '✗ '
let g:lightline#ale#indicator_warnings = '⚡ '
let g:lightline#ale#indicator_ok = '✓ '

" lightline.vim
" ----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ }

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ?  'NERDTree' : fname
endfunction

au User CocDiagnosticChange call lightline#update()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Tern
let g:tern_map_keys=1
nnoremap <Leader>td :TernDef<CR>
nnoremap <Leader>tr :TernRefs<CR>
nnoremap <Leader>tn :TernRename<CR>
"let g:tern_show_argument_hints='on_hold'

" NERDTree
" ---------------------------------------------
" override default key binding
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapOpenSplit='h'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1
" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile

" Tagbar
" ---------------------------------------------
nmap <Leader>t :TagbarToggle<CR>
"let g:tagbar_autopreview = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" open a NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" move the cursor into the main window
autocmd VimEnter * wincmd p

" map a specific key or shortcut to open NERDTree
map <C-e> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" DelimitMate
" ---------------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"let delimitMate_expand_inside_quotes = 1
"let delimitMate_jump_expansion = 1
"let delimitMate_balance_matchpairs = 1

"let g:prettier#autoformat = 0
"let g:prettier#config#config_precedence = 'file-override'
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
"
"augroup FiletypeGroup
"  autocmd!
"  au BufNewFile,BufRead *.ts,*.jsx,*.tsx set filetype=javascript.jsx
"augroup END


" Ale
" ---------------------------------------------
" Set everything in one go.
"let g:ale_fixers = {
"\ '*': ['remove_trailing_lines', 'trim_whitespace'],
"\ 'typescript': ['tslint', 'prettier'],
"\}
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

"autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
"autocmd BufWritePre *.js :normal gggqG

augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_use_local_config = 1
"let g:ale_sign_column_always = 1
"""let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

"let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
"let g:ale_keep_list_window_open = 1

""let g:ale_sign_error = '⤫'
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'


" dart-vim-plugin
let dart_format_on_save = 1
let dart_html_in_string=v:true

" vim-fugitive
" ---------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <leader>go :Gbrowse<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gac :Gcommit -a -v<CR>
nnoremap <leader>gl :silent! Glog<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<C-x>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" dart-vim-plugin
let dart_format_on_save = 1
let dart_html_in_string=v:true
let dart_style_guide = 2

" vim-flutter
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>

" YouCompleteMe
" ---------------------------------------------
let g:go_gocode_propose_source = 1
inoremap <C-d> <C-X><C-F>
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 0
"let g:ycm_key_invoke_completion = '<C-x>'
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" reset key mapping <S-tab>, conflit with delimitMate
let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']
let g:ycm_key_list_select_completion = ['<TAB>', '<C-J>', '<Down>']

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

au BufRead,BufNewFile *.scss set filetype=scss.css

let g:ycm_semantic_triggers = {
   \   'css': [ 're!^\s{2}', 're!:\s+' ],
   \   'scss': [ 're!^\s{2}', 're!:\s+' ],
   \   'less': [ 're!^\s{2}', 're!:\s+' ],
   \ }
let g:powerline_pycmd= "py3"

" vim-fzf
nmap <C-p> :Files<CR>
nmap <C-x> :Buffers<CR>
let g:fzf_action = { 'ctrl-x': 'edit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" vim-jsbeautify
"map <c-f> :call JsBeautify()<cr>
nnoremap <Leader>fm :call JsBeautify()<cr>
" or
autocmd FileType javascript nnoremap <buffer> <Leader>fm :call JsBeautify()<cr>
" for json
autocmd FileType json nnoremap <buffer> <Leader>fm :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx nnoremap <buffer> <Leader>fm :call JsxBeautify()<cr>
" for html
autocmd FileType html nnoremap <buffer> <Leader>fm :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css nnoremap <buffer> <Leader>fm :call CSSBeautify()<cr>

" binding a function for js, html and css in visual mode on
autocmd FileType javascript vnoremap <buffer>  <Leader>fm :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <Leader>fm :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <Leader>fm :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <Leader>fm :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <Leader>fm :call RangeCSSBeautify()<cr>


" Shortcuts
" =============================================
" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" Commands for copying the relative path, absolute path, name and directory of the current file.
" relative path (src/foo.txt)
nnoremap <silent> <leader>cr :let @+=expand("%")<CR>

" absolute path (/something/src/foo.txt)
nnoremap <silent> <leader>ca :let @+=expand("%:p")<CR>

" filename (foo.txt)
nnoremap <silent> <leader>cf :let @+=expand("%:t")<CR>

" directory name (/something/src)
nnoremap <silent> <leader>cd :let @+=expand("%:p:h")<CR>

" Ack.vim
" ---------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Enable ACK search
map <c-u> :Ack<space>

" Switch buffer
" ---------------------------------------------
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <Leader>1 :1b<CR>
map <Leader>2 :2b<CR>
map <Leader>3 :3b<CR>
map <Leader>4 :4b<CR>
map <Leader>5 :5b<CR>
map <Leader>6 :6b<CR>
map <Leader>7 :7b<CR>
map <Leader>8 :8b<CR>
map <Leader>9 :9b<CR>
map <Leader>0 :10b<CR>

" Reveal file in tree view
" ---------------------------------------------
nnoremap <leader>e :NERDTreeFind<CR>

map <Leader><Enter> :noh<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>

" Theme settings
" =============================================
"let g:dracula_italic = 0
let g:rehash256 = 1
let g:dracula_colorterm=0
colorscheme dracula
set background=dark
"let g:tsuquyomi_shortest_import_path = 1
hi Cursor ctermfg=17 ctermbg=NONE cterm=NONE guifg=#282a36 guibg=NONE gui=NONE
hi Normal ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi LineNr ctermfg=246 ctermbg=NONE cterm=NONE guifg=#909194 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=NONE cterm=NONE guifg=#3b3a32 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=NONE cterm=NONE guifg=#3b3a32 guibg=NONE gui=NONE
hi Pmenu ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi! link Identifier DraculaGreen

vnoremap <silent> <leader>fs :! esformatter<CR>
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1