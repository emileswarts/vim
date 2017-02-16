"WELCOME{{{
"EMILE SWARTS VIMRC
"COLEMAK KEYBOARD LAYOUT
"}}}
" PATHOGEN {{{
filetype off
"pathogen has to be called before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"}}}
"BASIC OPTIONS {{{
let tab_width=2
set autoindent
set autoread
set mouse=a
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set cursorcolumn
set cursorline
set dictionary=/usr/share/dict/words
set encoding=utf-8
set expandtab
set fileformats+=unix
set fileformats=unix
set gdefault
set hidden
set history=9000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=tab:▸\ ,eol:❤
set nobackup "no backups
set nocompatible
set nolist
set noswapfile
set novisualbell
set number
set ruler
set scrolloff=0
set shell=/bin/zsh
set shiftround
set shiftwidth=2
set shortmess=atI
set showcmd
set showmode
set smartcase
set smartindent
set spelllang=en_gb  "spell checking
set tabstop=2
set tags+=tags;$HOME
"set term=screen-256color
set textwidth=150
set title
set ttyfast " Not sure what this does
set undodir=~/.vim/tmp/undo//     " undo files
set vb t_vb=
set virtualedit=all
set wildmode=list:longest "when pressing tab see as many options as possible
set wrapmargin=150
set autowrite
set ffs=unix,dos
set notimeout
set showmatch
set t_ti= t_te= "keep vim on the screen when sending to background
set ttimeout
set ttimeoutlen=-1
let mapleader = "\<Space>"
let maplocalleader = "\\"
filetype indent on
set backupskip=/tmp/*,/private/tmp/*" " Crontab files need this below
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

if has("autocmd")
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType let g:rubycomplete_buffer_loading=1
  autocmd FileType let g:rubycomplete_classes_in_global=1
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif

  " function SetPHPCmdTOptions()
    let g:CommandTWildIgnore=&wildignore . ",**/logs/*,**/*.sql,**/assets/fonts/*,**/vendor/*,**/app/*,**/images/*,**/lib/*,**/node_modules/*,**/reports/*,**/shop/*"
  " endfunction
let g:ruby_doc_command='open'

let g:spec_runner_dispatcher = 'call Send_to_Tmux("clear\n{command}\n")'

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,*.ru,*.rake,*.rabl} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | set wrap
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.scss set filetype=scss
"}}}
" PLUGINS {{{
" Yankring {{{
let g:yankring_window_use_bottom = 0
let g:yankring_window_height = 15
"}}}
"UTIL SNIPS {{{
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" YCM {{{
let g:ycm_collect_identifiers_from_tags_files = 1
"}}}
" NerdTree{{{
let NERDTreeShowHidden=1
" }}}
" Rainbow parentheses {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
"}}}
" CommandT {{{
let g:CommandTWildIgnore=&wildignore . ",*/.git/*,*/.hg/*,*/.svn/*,*/data/*,*/.jpg/*,*/.jpeg/*,*/.png/*,*/.gif/*"
let g:CommandTMaxHeight = 25

let g:CommandTCancelMap=['<ESC>', '<C-c>']
let g:CommandTHighlightColor="Pmenu"
let g:CommandTBackspaceMap='<C-h>'
let g:CommandTCursorLeftMap='<left>'
"}}}
"}}}
" COLORS {{{
filetype plugin on

set t_Co=256
colorscheme badwolf

let g:dbext_default_buffer_lines = 30
let g:dbext_default_MYSQL_bin = '/usr/local/bin/mysql'
let g:dbext_default_passwd = ''

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
silent !echo -ne "]12;\#dd4010\x7"

let &t_SI="]12;\#89b6e2\x7"
let &t_EI="]12;\#dd4010\x7"

au VimLeave * silent !echo -ne "]12;\#dd4010\x7"
au BufNewFile,BufRead /etc/httpd/* setf apache
syntax on
"}}}
"REMAP KEYS{{{
" Use literal match by default
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap ' `
nnoremap ` '

nnoremap <leader>x <Plug>RunFocusedSpec

map <tab> %

"escape to normal mode
inoremap tn <ESC>
vnoremap tn <ESC>

"Make D act normally
nmap D d$

nnoremap S i<CR><esc><right>

"change behaviour of k to *
noremap K *zz

noremap j gj
noremap k gk
noremap n nzz
noremap N Nzz
noremap H H
noremap U <C-R>

cnoremap w!! w !sudo tee % >/dev/null
map <tab> %

"easy to reach keys
noremap Y "*yy

"Create space underneath line
nnoremap - mz<esc>o<esc>'z

"Create space above line
nnoremap _ mz<esc>O<esc>'z
inoremap <c-d> <esc>ddi

nnoremap <C-s> :qall!<cr>

"switching between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"}}}
"INSERT MODE{{{
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>
"}}}
" LEADER REMAP KEYS{{{
" MISC {{{
noremap <leader>b :noh<cr>
noremap <leader>/ :Ag '
nnoremap <leader><leader> :CommandTBuffer<cr>
"}}}
" 1 {{{
"}}}
" A {{{
nnoremap <leader>a <C-^>
"}}}
" B {{{
" }}}
" C {{{
nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>
"}}}
" D {{{
nnoremap <leader>d :vsp<cr>
"}}}
" E {{{
nnoremap <leader>en :vsp ~/notes<CR>
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
"}}}
" F {{{
nnoremap <leader>f 30<c-w>><CR>
" }}}
" G {{{
nnoremap <leader>ga :Git add .<cr>
nnoremap <leader>gc :Git commit -m
nnoremap <leader>gp :silent Git pull<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gD :Git diff --cached<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gr :silent Git reset --hard<cr>
nnoremap <leader>gvh :Git show -p head<cr>
nnoremap <leader>gv1 :Git show -p head~1<cr>
nnoremap <leader>gv2 :Git show -p head~2<cr>
nnoremap <leader>gv3 :Git show -p head~3<cr>
"}}}
" H {{{
nnoremap <leader>h oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
" }}}
" " K {{{
" nnoremap <leader>k :Tagbar<CR>
" "}}}
" L {{{
nnoremap <leader>l :set list!<CR>
"}}}
" N {{{
nnoremap <leader>n :set number!<CR>
nnoremap <leader>nt :NERDTreeTabsToggle<CR>
"}}}
" O {{{
"Panic button
nnoremap  <leader>o :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  <leader>os :call ri#LookupNameUnderCursor()<cr> " keyword lookup
"}}}
" P {{{
"paste from system clipboard
nnoremap <leader>p "*p
vnoremap <leader>p "*p
"}}}
" Q {{{
"quit
nnoremap <leader>q :q!<CR>
"}}}
" R {{{
nnoremap <leader>r :YRShow<CR>
"}}}
" S {{{
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>ss :set spell!<cr>
"}}}
" T {{{
nnoremap <leader>m :CommandT<cr>
nnoremap <leader>ta :CommandT app<cr>
nnoremap <leader>tv :CommandT app/views<cr>
nnoremap <leader>tc :CommandT app/controllers<cr>
nnoremap <leader>tm :CommandT app/models<cr>

nnoremap <leader>tk :CommandT config/<cr>
nnoremap <leader>td :CommandT db<cr>
nnoremap <leader>tg :sp Gemfile<cr>
nnoremap <leader>tl :CommandT lib<cr>
nnoremap <leader>tr :sp config/routes.rb<cr>

nnoremap <leader>ts :CommandT spec<cr>
"}}}
" U {{{
nnoremap <leader>u :GundoToggle<CR>
"}}}
" V {{{
"select to end of line
nnoremap <leader>v v$
"}}}
" W {{{
"save
nnoremap <leader>w :w!<cr>
"}}}
" X {{{
" nnoremap <leader>x :se readonly<CR>
let g:xmpfilter_cmd = '/Users/korpz/.rbenv/shims/xmpfilter'
autocmd FileType ruby nmap <buffer> <leader>i <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>i <Plug>(xmpfilter-mark)
autocmd FileType ruby vmap <buffer> <leader>i <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>x ma:set nocursorline nocursorcolumn<CR><Plug>(xmpfilter-run)'a
autocmd FileType ruby xmap <buffer> <leader>x ma:set nocursorline nocursorcolumn<CR><Plug>(xmpfilter-run)'a
autocmd FileType ruby vmap <buffer> <leader>x ma:set nocursorline nocursorcolumn<CR><Plug>(xmpfilter-run)'a
"}}}
" Y {{{
nnoremap <leader>y "*y
vnoremap <leader>y "*y
"}}}
" Z {{{
nnoremap <leader>z :set cursorline! cursorcolumn!<CR>
"}}}
"}}}
"LOCAL LEADER FUNCTIONS {{{
"}}}
" FILETYPE SPECIFIC {{{
" CSS {{{
augroup ft_css
  nnoremap <leader>i 0f;i !important<ESC>0
  au!
  au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
"}}}
" HTML {{{
" }}}
" {{{ MARKDOWN
augroup ft_md
  au BufNewFile,BufRead *.md setlocal filetype=markdown
augroup END
" }}}
" {{{ MYSQL
augroup ft_mysql
  au BufNewFile,BufRead *.sql colorscheme badwolf
augroup END
" }}}
" RUBY {{{
augroup ft_ruby
  set tabstop=2
  let tab_width=2
  set shiftwidth=2
augroup END
" }}}
" MUTT {{{
au BufNewFile,BufRead *.muttrc set filetype=muttrc
" }}}
" VAGRANT/PUPPET {{{
au BufNewFile,BufRead *.pp setlocal filetype=ruby
"}}}
" VIM {{{
augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
"}}}
"}}}
" ABBREVIATIONS {{{
iabbrev functino function
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the
" iabbrev sfdb \Doctrine\Common\Util\Debug::dump();
"}}}
" FUNCTIONS {{{
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

function! EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
  execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()
"}}}
" STATUS LINE {{{
let g:Powerline_symbols = 'fancy'
"}}}
