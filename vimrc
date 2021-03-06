" This must be first, because it changes other options as a side effect.
set nocompatible

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.plug_vimrc

" coc.nvim
" ----------------------------------------------------
if has('nvim')
  source ~/.config/nvim/coc.vim
endif

filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

set showtabline=2
set guioptions-=e

let mapleader=","
let maplocalleader="-"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#unicode_symbols=1
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1


let no_buffers_menu=1
silent! colorscheme onedark
set mousemodel=popup
set t_Co=256
set guioptions=egmrti

" always show statusline
set laststatus=2

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Use modeline overrides
set modeline
set modelines=10

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv





set autoindent
set smartindent

set cul
set backupcopy=yes

"set paste
set showcmd


set autoread " reload files when changed on disk

set autowrite

" Remove -- INSERT
set noshowmode

" Set relative line number
set relativenumber

" Enable XML folding
"let g:xml_syntax_folding = 1

" Enables code folding based on syntax file
" set foldmethod=syntax

" show a navigable menu for tab completion
set wildmenu
" set wildmode=longest,list,full

set noswapfile
set nowritebackup
set nobackup		" do not keep a backup file, use versions instead

set history=500		" keep 50 lines of command line history
set vb

vnoremap < <v
vnoremap > >v

" Don't use Ex mode, use Q for formatting
map Q gq

" Format Jump
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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


"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


" Plugins
"
" coc-pairs
autocmd FileType rust let b:coc_pairs_disabled = ["'"]
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


autocmd FileType rust nmap <leader>r  :Cargo run<cr>
autocmd FileType rust nmap <leader>c  :Cargo check<cr>
autocmd FileType rust nmap <leader>b  :Cargo build<cr>
autocmd FileType rust nmap <leader>ts  :Cargo test<cr>
autocmd FileType rust nmap <leader>u  :Cargo update<cr>
autocmd FileType rust nmap <leader>d  :Cargo doc<cr>

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:rustfmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gv <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" have racer as a complete soure
"if executable('racer')
"autocmd User asyncomplete_setup call asyncomplete#register_source(
"    \ asyncomplete#sources#racer#get_source_options())
"endif

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
"let g:go_metalinter_autosave = 1
"let g:go_fmt_fail_silently = 1

" =============================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0

" Plugins
" -----------------------------------------------------------------------
let g:leetcode_solution_filetype = "rust"

" vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr>
noremap <leader>d :PreviewScroll +1<cr>

let g:lightline#ale#indicator_checking = "\uf110 Linting..."
let g:lightline#ale#indicator_errors = '✗'
let g:lightline#ale#indicator_warnings = '⚡'
let g:lightline#ale#indicator_ok = '✓'

" vim-gutentags
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1
let g:gutentags_cache_dir = s:gutentags_cache_dir
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:gutentags_cache_dir)
    silent! call mkdir(s:gutentags_cache_dir, 'p')
endif

" lightline.vim
" ----------------------------------------------------
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['gitbranch'] ],
      \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']]
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"},
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'gitbranch': 'LightLineGitbranch',
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'lineinfo': 'LightlineLineinfo',
      \   'percent': 'LightlinePercent'
      \ },
      \ 'component_expand': {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \     'readonly': 'error',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ }

function IsVisible()
    let fname = expand('%:t')
    let _ = &ft == 'startify' ||
                \ &ft == 'ctrlspace' ||
                \ &ft == 'nerdtree' ||
                \ &ft == 'tagbar' ||
                \ fname =~ '__Gundo'
    return !_

endfunction

function LightlineReadonly()
  return winwidth(0) > 70 ? '%R' : '' 
endfunction

function! LightlinePercent()
  return IsVisible() ? (100 * line('.') / line('$')) . '%' : ''
endfunction

function! LightlineLineinfo()
  return IsVisible() ? printf('%d:%-2d', line('.'), col('.')) : '' 
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ lightline#mode()
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ?  'NERDTree' : fname
endfunction

function! LightLineGitbranch()
  return IsVisible() ? fugitive#head() : ''
endfunction

au User CocDiagnosticChange call lightline#update()

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
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
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['.git$[[dir]]', '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '.swp', 'build']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapOpenSplit='h'
let g:NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1
" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile

" Tagbar
" ---------------------------------------------
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 0
" let g:tagbar_autopreview = 1
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
autocmd FileType dart nnoremap <leader>r :FlutterRun<cr>
autocmd FileType dart nnoremap <leader>q :FlutterQuit<cr>
autocmd FileType dart nnoremap <leader>h :FlutterHotReload<cr>
autocmd FileType dart nnoremap <leader>H :FlutterHotRestart<cr>
autocmd FileType dart nnoremap <leader>dh :FlutterSplit<cr>
autocmd FileType dart nnoremap <leader>dv :FlutterVSplit<cr>

let g:go_gocode_propose_source = 1
inoremap <C-d> <C-X><C-F>

au BufRead,BufNewFile *.scss set filetype=scss.css

" vim-fzf
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,build
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'coverage/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
nmap <C-p> :Files<CR>
nmap <C-x> :Buffers<CR>
nmap <leader>y :History:<CR>
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

" Buffer nav
" ---------------------------------------------
noremap <C-h> :bp<CR>
noremap <C-l> :bn<CR>
noremap <Leader>1 :1b<CR>
noremap <Leader>2 :2b<CR>
noremap <Leader>3 :3b<CR>
noremap <Leader>4 :4b<CR>
noremap <Leader>5 :5b<CR>
noremap <Leader>6 :6b<CR>
noremap <Leader>7 :7b<CR>
noremap <Leader>8 :8b<CR>
noremap <Leader>9 :9b<CR>
noremap <Leader>0 :10b<CR>

"" Close buffer
noremap <leader>c :bd<CR>

" Reveal file in tree view
" ---------------------------------------------
nnoremap <leader>e :NERDTreeFind<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

nnoremap <leader>sv :source $MYVIMRC<CR>

" Theme settings
" =============================================
"let g:dracula_italic = 0
let g:rehash256 = 1
"let g:dracula_colorterm=0
set background=dark
"let g:tsuquyomi_shortest_import_path = 1
"hi Cursor ctermfg=17 ctermbg=NONE cterm=NONE guifg=#282a36 guibg=NONE gui=NONE
"hi Normal ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
"hi LineNr ctermfg=246 ctermbg=NONE cterm=NONE guifg=#909194 guibg=NONE gui=NONE
"hi SpecialKey ctermfg=59 ctermbg=NONE cterm=NONE guifg=#3b3a32 guibg=NONE gui=NONE
"hi NonText ctermfg=59 ctermbg=NONE cterm=NONE guifg=#3b3a32 guibg=NONE gui=NONE
"hi Pmenu ctermfg=145 ctermbg=NONE cterm=NONE guifg=#ABB2BF guibg=NONE gui=NONE
"hi! link Identifier DraculaGreen
highlight link CocErrorFloat         Identifier

vnoremap <silent> <leader>fs :! esformatter<CR>
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1
