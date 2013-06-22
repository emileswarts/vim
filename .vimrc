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
	set dictionary=/usr/share/dict/cracklib-small
	set encoding=utf-8
	let tab_width=2
	set hidden
  set t_ti= t_te= "keep vim on the screen when sending to background
	set history=9000
	set hlsearch
	set ignorecase
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

	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	if has("autocmd")
		autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
		autocmd FileType let g:rubycomplete_buffer_loading=1
		autocmd FileType let g:rubycomplete_classes_in_global=1
	endif
"}}}
" PLUGINS {{{
	" CTRLP {{{
		let g:ctrlp_use_caching = 1
		let g:ctrlp_clear_cache_on_exit = 1
		let g:ctrlp_jump_to_buffer = 1 " switch to already opened buffer
		let g:ctrlp_cache_dir = $HOME
		let g:ctrlp_dotfiles = 1
		let g:ctrlp_max_height = 30
		let g:ctrlp_mruf_exclude = '/.hg/.*\|/data/.*|/images/.*|/assets/.*'
		set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/data/*,*/.jpg/*,*/.jpeg/*,*/.png/*,*/.gif/*
		let g:ctrlp_by_filename = 0
		let g:ctrlp_working_path_mode = 0
		let g:ctrlp_match_window_reversed = 1
		let g:ctrlp_split_window = 0
		let g:ctrlp_prompt_mappings = {
		\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
		\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
		\ 'PrtHistory(-1)':       ['<c-n>'],
		\ 'PrtHistory(1)':        ['<c-p>'],
		\ 'PrtBS()':        	  ['<c-h>'],
		\ 'PrtCurLeft()':         ['<left>'],
		\ 'PrtClearCache()':      ['<c-space>'],
		\ 'ToggleFocus()':        ['<c-tab>'],
		\ }
	"}}}
	" Taglist {{{
		let Tlist_Use_Right_Window=1
	"}}}
	" Yankring {{{
		let g:yankring_window_use_bottom = 0
		let g:yankring_window_height = 15
	"}}}
	" Clam {{{
		nnoremap ! :Clam<space>
		vnoremap ! :ClamVisual<space>
	"}}}
	let g:ycm_add_preview_to_completeopt = 1
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

	" Use sane regexes.
	nnoremap / /\V
	vnoremap / /\V
	nnoremap ? ?\V
	vnoremap ? ?\V

	"Bubble single lines
	nnoremap <C-UP> ddkP
	nnoremap <C-Down> ddp

	nnoremap & :&&<CR>
	xnoremap & :&&<CR>

	nnoremap ' `
	nnoremap ` '

	map <tab> %

	"escape to normal mode
	inoremap tn <ESC>
	vnoremap tn <ESC>

	"find next occurrence of f or t
	nnoremap e ;

	"make switching tabs easier
	nnoremap EN gT
	vnoremap EN gT

	"make switching tabs easier, backwards
	nnoremap eN gt
	vnoremap eN gt

	"Make D act normally
	nmap D d$

	nnoremap S i<CR><esc><right>

	"change behaviour of k to *
	noremap K *

	noremap j gj
	noremap k gk
	noremap n nzz
	noremap N Nzz
	noremap H H
	noremap U <C-R>
	noremap * *zz

	" Keep search matches in the middle of the window and pulse the line when moving
	" to them.
	"nnoremap n nzzzv<cr>
	"nnoremap N Nzzzv:call PulseCursorLine()<cr>
	cnoremap w!! w !sudo tee % >/dev/null
	map <tab> %

	cnoremap vv tab sview

	"easy to reach keys
	"noremap H ^
	"noremap L $
	noremap Y "+y$

	nnoremap S i<cr><esc><right>

	"Create space underneath line
	nnoremap - mz<esc>o<esc>'z
	"Create space above line
	nnoremap _ mz<esc>O<esc>'z
	inoremap <c-d> <esc>ddi

	"scroll down
	nnoremap <SPACE> 10j
	vmap <SPACE> 10j

	"increase and decrease window size
	map <left> 10<C-w><
	map <down> 10<C-w>-
	map <up> <C-w>+
	map <right> 10<C-w>>
	map <C-space> <C-w>=

	"switching between windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	inoremap <C-t> <C-x><C-k>

    " Open a Quickfix window for the last search.
	nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
"}}}
"INSERT MODE{{{
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>
inoremap <C-t> <C-x><C-t>
inoremap <c-v> <C-g>s=
"}}}
" LEADER REMAP KEYS{{{
	" MISC {{{
		noremap <leader><space> :noh<cr>
		nnoremap <leader>; <esc>mjA;<esc>'j
		nnoremap <leader><leader> :CtrlPBuffer<cr>
		" Search forward with f key
	"}}}
	" A {{{
		nnoremap <leader>a :Ack!<space>
	"}}}
	" B {{{
"}}}
" C {{{
	nmap <silent> <leader>c :ClearCtrlPCache<cr>;echom "cache cleared"
"}}}
" D {{{
	"vnoremap <leader>d "_dd
	"nnoremap <leader>d "_dd
"}}}
" E {{{
	nnoremap <leader>et :vsp ~/.tmux.conf<CR>
	nnoremap <leader>ev :vsp ~/.vimrc<CR>
"}}}
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
	"show all lines with word under cursor
	let g:ctrlp_map = '<leader>m'
	nmap <leader>mk :!mkdir -p <c-r>=expand("%:p:h")."/"<cr>
	vnoremap <leader>M :marks<CR>
"}}}
" N {{{
	"set line numbers
	nnoremap <leader>n :set number!<CR>

	"set line numbers
	nnoremap <leader>nt :NERDTreeToggle<CR>
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
	nnoremap <leader>S :mksession ~/vs/
	nnoremap <leader>s :source ~/.vimrc<CR>
	nnoremap <leader>ss :set spell!<cr>
	nnoremap <leader>sc :SyntasticToggleMode<cr>
"}}}
" T {{{
	nnoremap <leader>t :!rspec --color ~/bin/fizzbuzz_spec.rb<CR>
"}}}
" U {{{
	nnoremap <leader>u :GundoToggle<CR>
"}}}
" V {{{
	"select a variable
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

		au BufNewFile,BufRead *.less setlocal filetype=less

		au Filetype less,css setlocal foldmethod=marker
		au Filetype less,css setlocal foldmarker={,}
		au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
		au Filetype less,css setlocal iskeyword+=-

		au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

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
" Pentadactyl {{{

augroup ft_pentadactyl
    au!
    au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl
    au BufNewFile,BufRead ~/Library/Caches/TemporaryItems/pentadactyl-*.tmp set nolist wrap linebreak columns=100 colorcolumn=0
augroup END

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
iabbrev ecoh echo
"}}}
" FUNCTIONS {{{
	"}}}
	" STATUS LINE {{{
	let g:Powerline_symbols = 'fancy'
	"}}}

" Removes trailing spaces
function! TrimWhiteSpace()
      %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()
