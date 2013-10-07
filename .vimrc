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
	"set grepprg=ack\ --nogroup\ $*
	set autoindent
	set autoread
	set backspace=indent,eol,start " Intuitive backspacing in insert mode
	set cursorcolumn
	set term=screen-256color
	set cursorline
	set gdefault
	set shiftround
	set dictionary=/usr/share/dict/words
	set encoding=utf-8
	let tab_width=2
	set hidden
  set t_ti= t_te= "keep vim on the screen when sending to background
	set history=9000
	set hlsearch
	set fileformats=unix,dos
	set eol
	set ignorecase
	set nobinary
	set incsearch
	set showcmd
	set showmode
	set laststatus=2
	set lazyredraw
	set listchars=tab:▸\ ,eol:❤
	set nobackup "no backups
	set nocompatible
	set nolist
	set expandtab
	set noswapfile
	set novisualbell
	set number
	set ruler
	set scrolloff=0
	set shell=/bin/zsh
	set shiftwidth=2
	set shortmess=atI
	set smartcase
	set smartindent
	set spelllang=en_gb  "spell checking
	set tabstop=2
	set tags+=tags;$HOME
	set textwidth=150
	set title
	set undodir=~/.vim/tmp/undo//     " undo files
	set vb t_vb=
	set virtualedit=all
	set wildmode=list:longest "when pressing tab see as many options as possible
	set wrapmargin=150
	let mapleader = ","
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

 let g:ruby_doc_command='open'

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
  let g:CommandTWildIgnore=&wildignore . ",*/.git/*,*/.hg/*,*/.svn/*,*/data/*,*/.jpg/*,*/.jpeg/*,*/.png/*,*/.gif/*"
  let g:CommandTMaxHeight = 10

  let g:CommandTCancelMap=['<ESC>', '<C-c>']
  let g:CommandTHighlightColor="Pmenu"
  let g:CommandTBackspaceMap='<C-h>'
  let g:CommandTCursorLeftMap='<left>'
"}}}
" COLORS {{{
filetype plugin on

set t_Co=256
colorscheme badwolf

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
	nnoremap / /\V
	vnoremap / /\V
	nnoremap ? ?\V
	vnoremap ? ?\V

	nnoremap ' `
	nnoremap ` '

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

	" Keep search matches in the middle of the window and pulse the line when moving
	" to them.
	cnoremap w!! w !sudo tee % >/dev/null
	map <tab> %

	cnoremap vv tab sview

	"easy to reach keys
	noremap Y "*yy

	nnoremap S i<cr><esc><right>

	"Create space underneath line
	nnoremap - mz<esc>o<esc>'z

	"Create space above line
	nnoremap _ mz<esc>O<esc>'z
	inoremap <c-d> <esc>ddi

	"scroll down
	nnoremap <SPACE> 10j
	vmap <SPACE> 10j

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
		noremap <leader><space> :noh<cr>
		nnoremap <leader><leader> :CommandTBuffer<cr>
		" Search forward with f key
	"}}}
	" A {{{
  nnoremap ,a <C-^>
	"}}}
	" B {{{
"}}}
" C {{{
"}}}
" D {{{
  nnoremap <leader>d :vsp<cr>
"}}}
" E {{{
	nnoremap <leader>et :vsp ~/.tmux.conf<CR>
	nnoremap <leader>ev :vsp ~/.vimrc<CR>
"}}}
" F {{{
	nnoremap <leader>f 30<c-w>><CR>
" }}}
" G {{{
	nnoremap <leader>g :Gist -la emileswarts<CR>
"}}}
" H {{{
"}}}
" L {{{
	" Shortcut to rapidly toggle `set list`
	nnoremap <leader>l :set list!<CR>
"}}}
" M {{{
"}}}
" N {{{
	"set line numbers
	nnoremap <leader>n :set number!<CR>

	"set line numbers
	nnoremap <leader>nt :NERDTreeToggle<CR>
"}}}
" P {{{
	"paste from system clipboard
	nnoremap <leader>p "+p
	vnoremap <leader>p "+p
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
	nnoremap <leader>tg :vsp Gemfile<cr>
	nnoremap <leader>tl :CommandT lib<cr>
	nnoremap <leader>tr :vsp config/routes.rb<cr>

	nnoremap <leader>tf :CommandT features<cr>
	nnoremap <leader>te :CommandT features/factories<cr>
	nnoremap <leader>tu :CommandT features/support<cr>

	nnoremap <leader>ts :CommandT spec<cr>
"}}}
" U {{{
"}}}
" V {{{
  "select to end of line
	nnoremap <leader>v v$
"}}}
" W {{{
	"save
	nnoremap <leader>w :w!<CR>
"}}}
" X {{{
	nnoremap <leader>x :se readonly<CR>
"}}}
" Y {{{
	vnoremap <leader>y "+y
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

		" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
		" positioned inside of them AND the following code doesn't get unfolded.
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
" MYSQL {{{
	augroup ft_sql
		au!
		au BufNewFile,BufRead *.sql set filetype=sql
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
"}}}
" FUNCTIONS {{{
" Removes trailing spaces
function! TrimWhiteSpace()
      %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()
	"}}}
	" STATUS LINE {{{
	let g:Powerline_symbols = 'fancy'
	"}}}
