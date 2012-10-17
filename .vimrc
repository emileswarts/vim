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
	set nocompatible
	set encoding=utf-8
	set laststatus=2
	set tabstop=4
	set shiftwidth=4
	set guioptions-=T
	set vb t_vb=
	set ruler
	set incsearch
	set cursorline
	set cursorcolumn
	set tags+=tags;$HOME
	set lazyredraw
	set shell=/bin/zsh
	set virtualedit=all
	set autoindent
	set smartindent
	set smartcase
	set novisualbell
	set hidden
	set ignorecase
	set scrolloff=0
	set title
	set hlsearch
	set textwidth=150
	set wrapmargin=150
	set history=1000
	set dictionary=/usr/share/dict/words
	set autoread
	set backspace=indent,eol,start " Intuitive backspacing in insert mode
	set nolist
	set number
	set wildmode=list:longest "when pressing tab see as many options as possible
	set shortmess=atI
	set noswapfile
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set spelllang=en_gb  "spell checking
	set undodir=~/.vim/tmp/undo//     " undo files
	set nobackup "no backups
	set listchars=tab:▸\ ,eol:❤
	let mapleader = ","
	let maplocalleader = "\\"
	let php_sql_query=1                                                                                        
	let php_htmlInStrings=1
	filetype indent on
	set backupskip=/tmp/*,/private/tmp/*" " Crontab files need this below
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"}}}
" PLUGINS {{{
	" CTRLP {{{
		let g:ctrlp_use_caching = 1
		let g:ctrlp_clear_cache_on_exit = 0 
		let g:ctrlp_cache_dir = $HOME
		let g:ctrlp_dotfiles = 1
		let g:ctrlp_max_height = 30 
		let g:ctrlp_mruf_exclude = '/.hg/.*\|/data/.*|/images/.*'
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
		\ 'PrtClearCache()':      ['<c-q>'],
		\ 'ToggleFocus()':        ['<c-tab>'],
		\ }
	"}}}
	" Db {{{
		let g:dbext_default_profile_mysql_local= 'type=MYSQL:user=kp:driver=mysql'
		let g:dbext_default_buffer_lines = 15
		let g:dbext_default_DBI_orientation = 'vertical'
		let g:window_use_horiz = 0
		let g:window_use_bottom = 0
		let g:window_use_right = 1
	"}}}
	" PHP {{{
		let php_sql_query = 1
		let php_htmlInStrings = 1
		let php_baselib = 1
		let php_special_vars = 1
		let php_special_functions = 1
		let php_alt_comparisons = 1
		let php_highlight_quotes = 1
		let php_show_semicolon = 1
		let php_smart_semicolon = 1
		let php_show_semicolon_error = 1
		let g:rbpt_max = 16
	"}}}
	"Syntastic {{{
	
	"}}}
	" Taglist {{{
		let Tlist_Use_Right_Window=1
	"}}}
	" Yankring {{{
		let g:yankring_window_use_bottom = 0
		let g:yankring_window_height = 15
	"}}}
"}}}
" COLORS {{{
filetype plugin on

set t_Co=256
colorscheme skywalker
 
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
	nnoremap / /\v
	vnoremap / /\v

	"Bubble single lines
	nnoremap <C-UP> ddkP
	nnoremap <C-Down> ddp

	nnoremap ' `
	nnoremap ` ' 

	noremap ; <esc>mjA;<esc>'j
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

	nnoremap S i<cr><esc><right>

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
	nnoremap n nzzzv:call PulseCursorLine()<cr>
	nnoremap N Nzzzv:call PulseCursorLine()<cr>
	cnoremap w!! w !sudo tee % >/dev/null
	map <tab> %

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
	
    " Open a Quickfix window for the last search.
	nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
"}}}
"INSERT MODE{{{
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>
inoremap <C-t> <C-x><C-t>
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
"}}}
" LEADER REMAP KEYS{{{
	" MISC {{{
		noremap <leader><space> :noh<cr>
		" Search forward with f key
	"}}}
	" A {{{
	nnoremap <leader>a [I
	vnoremap <leader>a [I 
	"}}}
	" B {{{
		"FATBEEHIVE bk_debug function
		vnoremap <leader>bs yo<ESC>ibk_debug("<ESC>hhpA;<ESC>
		vnoremap <leader>b yo<ESC>ibk_debug(<ESC>pli<ESC>A);<ESC>
		vnoremap <leader>bse yo<ESC>ibk_debug("<ESC>hhpA;<ESC>hhi", "emile@fatbeehive.com
		vnoremap <leader>be yo<ESC>ibk_debug(<ESC>hpA;<ESC>hhi, "emile@fatbeehive.com
"}}}
" C {{{
	"nerd tree toggle
	nnoremap <leader>c<SPACE> :NERDComToggleComment<CR>
"}}}
" D {{{
	"php die function
	vnoremap <leader>d "_dd
	nnoremap <leader>d "_dd
"}}}
" E {{{
	"echo function
	nnoremap <leader>e :Errors<CR>
	"blog
	nnoremap <leader>eb :e ~/emileswarts.github.com/_posts<CR> 
	"velvet colorscheme
	nnoremap <leader>ec :vsp ~/velvet_vim_colorscheme/velvet.vim<CR>
	nnoremap <leader>ev :vsp ~/.vimrc<CR>
	nnoremap <leader>ex :vsp ~/.xmonad/xmonad.hs<CR>
"}}}
" G {{{
	nnoremap <leader>g :Gist -la emileswarts<CR>

"}}}
" H {{{
	nnoremap <leader>h :!hg addremove && hg ci<cr> 
"}}}
" L {{{
	" Shortcut to rapidly toggle `set list`
	nnoremap <leader>l :set list!<CR>
"}}}
" M {{{
	"show all lines with word under cursor
	let g:ctrlp_map = '<leader>m'
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
	nnoremap <leader>S :mksession ~/vs/
	nnoremap <leader>s :source ~/.vimrc<CR>
	nnoremap <leader>ss :set spell!<cr>
	nnoremap <leader>sc :SyntasticToggleMode<cr>
"}}}
" T {{{
	nnoremap <leader>t :TlistToggle<CR>
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
"}}}
" Y {{{
	"copy to system clipboard
	vnoremap <leader>y "+y
"}}}
" Z {{{
	nnoremap <leader>z :set cursorline! cursorcolumn!<CR>
"}}}
"}}}
"CTRL REMAP {{{
"}}}
"LOCAL LEADER FUNCTIONS {{{
 
"}}}
" FILETYPE SPECIFIC {{{
" ALL {{{
	"source vim file when saving
	if has("autocmd")
	 autocmd bufwritepost .vimrc source $MYVIMRC
	endif
"}}}
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
	    au BufRead *.html :normal gg=G
" }}}
" {{{ MARKDOWN

	 augroup ft_md
		au BufNewFile,BufRead *.md setlocal filetype=markdown
	augroup END
" }}}
" MYSQL {{{
	augroup ft_sql
		"so ~/.vim/secure.vim
		au!
		au BufNewFile,BufRead *.sql set filetype=sql
	augroup END
" }}}
" PHP {{{

		let s:php_executable = "/usr/bin/php"
		if !(executable(s:php_executable))
		let makeprg = php_executable . " -l %"
	endif


	au BufRead *.php set ft=php.html
	au BufNewFile *.php set ft=php.html
	"php cheat for tags
	autocmd FileType php let b:surround_45 = "<?php \r ?>"
	let g:user_zen_leader_key = '<c-y>'
"}}}
" Pentadactyl {{{

augroup ft_pentadactyl
    au!
    au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl
    au BufNewFile,BufRead ~/Library/Caches/TemporaryItems/pentadactyl-*.tmp set nolist wrap linebreak columns=100 colorcolumn=0
augroup END

" }}}
" TWIG {{{
 au BufNewFile,BufRead *.twig set filetype=html
"}}}
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
iabbrev bk bk_debug("...");

"}}}
" FUNCTIONS {{{


" Motion for "next/last object".  "Last" here means "previous", not "final".
" Unfortunately the "p" motion was already taken for paragraphs.
"
" Next acts on the next object of the given type in the current line, last acts
" on the previous object of the given type in the current line.
"
" Currently only works for (, [, {, b, r, B, ', and ".
"
" Some examples (C marks cursor positions, V means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      C
"                                                      foo = bar('')
"                                                                C
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      C
"                                                      foo = bar
"                                                               C
"
" vil"  -> select inside last double quotes            print "hello ", name
"                                                                        C
"                                                      print "hello ", name
"                                                             VVVVVV

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
	function! EatChar(pat)
		let c = nr2char(getchar(0))
		return (c =~ a:pat) ? '' : c
	endfunction

	function! MakeSpacelessIabbrev(from, to)
		execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
	endfunction
	function! PulseCursorLine()
		let current_window = winnr()

		windo set nocursorline
		execute current_window . 'wincmd w'

		setlocal cursorline

		redir => old_hi
			silent execute 'hi CursorLine'
		redir END
		let old_hi = split(old_hi, '\n')[0]
		let old_hi = substitute(old_hi, 'xxx', '', '')

		hi CursorLine guibg=#2a2a2a ctermbg=233
		redraw
		sleep 10m

		hi CursorLine guibg=#333333 ctermbg=235
		redraw
		sleep 10m

		hi CursorLine guibg=#3a3a3a ctermbg=237
		redraw
		sleep 10m

		hi CursorLine guibg=#444444 ctermbg=239
		redraw
		sleep 10m

		hi CursorLine guibg=#3a3a3a ctermbg=237
		redraw
		sleep 10m

		hi CursorLine guibg=#333333 ctermbg=235
		redraw
		sleep 10m

		hi CursorLine guibg=#2a2a2a ctermbg=233
		redraw
		sleep 10m

		execute 'hi ' . old_hi

		windo set cursorline
		execute current_window . 'wincmd w'
	endfunction
  
	call MakeSpacelessIabbrev('d', '$')
	call MakeSpacelessIabbrev('pnd', '£')

	" Show syntax highlighting groups for word under cursor
	nmap <leader>b :call <SID>SynStack()<CR>

	function! <SID>SynStack()
		if !exists("*synstack")
			return
		endif
		echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	endfunc

	"}}}
	" STATUS LINE {{{
	let g:Powerline_symbols = 'fancy'
	"}}}
