
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

"function! YCMInstall(info)
"  if a:info.status == 'installed'
"    !./install.sh --clang-completer
"  endif
"endfunction

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('YCMInstall') }

"------------------BEGIN coc conf
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"Use tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"------------------END coc conf

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Avoid stupid/annoying hiding of " in json files
autocmd Filetype json let g:indentLine_setConceal = 0

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'  " :StripWhitespace
"Plug 'bronson/vim-trailing-whitespace'
" Plug 'w0rp/ale'

" Zen editing (center)
Plug 'junegunn/goyo.vim'

" LiveProgramming right side
"Plug 'metakirby5/codi.vim'

" Fuzzy search (:Ag :Buffer
"Plug '/usr/bin/fzf'
Plug 'junegunn/fzf'
noremap <C-P> :Files<CR>

" Shell
Plug 'shougo/deol.nvim'

"" Color
set notermguicolors
set t_Co=256
Plug 'altercation/solarized'
Plug 'jacoborus/tender'

" Activity log
Plug 'ad7six/vim-activity-log'
let g:activity_log_location = '~/.activity/%Y_%m_%d.vim.log'

" Custom bundles
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" :Acks (grep)
" Plug 'mileszs/ack.vim'
Plug 'wincent/ferret'
Plug 'jremmen/vim-ripgrep'
" -S smartcase grep
let g:rg_command = 'rg --vimgrep -S'

Plug 'Yggdroot/indentLine'
Plug 'ddollar/nerdcommenter'

" Latex
Plug 'matze/vim-tex-fold'
let g:tex_conceal = ""  " disable automatic $_$ remove of $

" [q ]q [l ]l move thrught quick fix
Plug 'tpope/vim-unimpaired'
" Filter quckfix ,g ,r
Plug 'fszymanski/fzf-quickfix'
nmap <Leader>f <Plug>(fzf-quickfix)

" Allows to have a .local.vimrc per directory to set things like indent per
" project
Plug 'thinca/vim-localrc'

" ,l local and ,q quickfix
"Plug 'valloric/listtoggle'
"let g:lt_location_list_toggle_map = '<leader>L'
"let g:lt_quickfix_list_toggle_map = '<leader>q'

Plug 'milkypostman/vim-togglelist'
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" marks: use the m and m<space> delete all, ]` [` move
Plug 'gioele/vim-autoswap'
"NeoBundle 'osyo-manga/vim-over'

Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Local rc per directory (useful for repo)
"NeoBundle 'embear/vim-localvimrc'
"let g:localvimrc_ask = 0

Plug 'google/vim-maktaba'
" code format calling clang
Plug 'google/vim-codefmt'

" Displatch (:Dispatch bazel build for async build)
"Plug 'tpope/vim-dispatch'
" Plug 'neomake/neomake'
Plug 'skywind3000/asyncrun.vim'

" Pyrope
" NeoBundle 'ferdous313/vim-pyrope_trial'
call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" YouCompleteMe (YCM)
let g:ycm_confirm_extra_conf    = 0
"let g:ycm_global_ycm_extra_conf = g:dotvim.'/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_enable_diagnostic_signs = 0
"augroup load_ycm
"  autocmd!
"  autocmd! InsertEnter *
"        \ call plug#load('YouCompleteMe')     |
"        \ if exists('g:loaded_youcompleteme') |
"        \   call youcompleteme#Enable()       |
"        \ endif                               |
"        \ autocmd! load_ycm
"augroup END


"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Encoding
set bomb
set ttyfast
set binary  " Changes expandtab setup


"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set ignorecase
set smartcase



"" Directories for swp files
" set backupdir=~/.vim/.backup
" set nobackup
" set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

"set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

colorscheme tender
hi! Visual ctermbg=16

let no_buffers_menu=1

" Easy motion
set incsearch
"noremap <silent> <leader>/ :call incsearch#call(incsearch#config#easymotion#make())<CR>

" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'

" Easy Align shortcut
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

set mouse=a
set mousemodel=popup
set t_Co=256
set cursorline
set cursorcolumn
" set guioptions=egmrti
set guioptions=caegi
hi Cursor guibg=#800000 guifg=Black ctermfg=16 ctermbg=255

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
  "set gfn=Monospace\ 12
  "set enc=utf-8 gfn=Monospace:h14
  set enc=utf-8 gfn=Inconsolata\ 12
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
" set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" vim-airline
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'tender'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
"cnoreabbrev W! w!
"cnoreabbrev Q! q!
"cnoreabbrev Qall! qall!
"cnoreabbrev Wq wq
"cnoreabbrev Wa wa
"cnoreabbrev wQ wq
"cnoreabbrev WQ wq
"cnoreabbrev W w
"cnoreabbrev Q q
"cnoreabbrev Qall qall

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '


"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=130
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMake*.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:ctrlp_custom_ignore     = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command      = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching       = 0
let g:ctrlp_map               = '<c-p>'
let g:ctrlp_open_new_file     = 'r'
let g:ctrlp_working_path_mode = 'cr'

cnoremap <C-P> <C-R>= expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_style_error_symbol       = '✗'
let g:syntastic_style_warning_symbol     = '⚠'
let g:syntastic_auto_loc_list            = 1
let g:syntastic_aggregate_errors         = 1

let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_verilog_compiler='verilator'
let g:syntastic_verilog_compiler_options="-Irtl --Wall --lint-only"

let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=W391'

"autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
"autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap P "+gP<CR>
"noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

"" Custom configs

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal formatoptions+=croq softtabstop=2 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


let g:javascript_enable_domhtmlcss = 1


let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  "autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"augroup vimrc-pyrope
  "autocmd!
  "autocmd BufNewFile,BufRead *.prp setlocal filetype=pyrope
  ""autocmd Filetype pyrope setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"augroup END

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
"autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Spell check
set spell spelllang=en_us
autocmd BufEnter *.tex :syntax spell toplevel " activate spell check with latex too
autocmd BufEnter *.txt :syntax spell toplevel " activate spell check with latex too
autocmd BufEnter README :syntax spell toplevel " activate spell check with latex too

set wildmenu        "Helps with auto-complete of filenames
set wildmode=list:longest "Match until the longest common string
set lz              " do not redraw while running macros (much faster) (LazyRedraw)
set shortmess=atI   " shortens messages to avoid 'press a key' prompt
set fdm=marker      " use {{ as fold method
set guioptions=caegi "No menu or scrollbar

" Cut&paste setup
nmap <C-x> "+gP
imap <C-x> <ESC><C-x>i
vmap <C-C> "+y

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" No bell
set visualbell

