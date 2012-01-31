""""""""""""""""""""
"EMILE SWARTS VIMRC"
"COLEMAK KEYBOARD LAYOUT"
""""""""""""""""""""

filetype off

"pathogen has to be called before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic options ----------------------------------------------------------- {{{
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set guioptions-=T
set vb t_vb=
set ruler
set incsearch
set cursorline
set lazyredraw
set shell=/bin/bash
set virtualedit=all
set nocompatible
set autoindent
set smartindent
set smartcase
set hidden
set ignorecase
set scrolloff=3
set title
set hlsearch
set textwidth=150
set wrapmargin=150
set history=1000
set dictionary=/usr/share/dict/words
set autoread
" Intuitive backspacing in insert mode
set backspace=indent,eol,start
"dont show hidden characers when file opens
set nolist
"when pressing tab see as many options as possible
set wildmode=list:longest
set shortmess=atI
set noswapfile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set listchars=tab:▸\ ,eol:❤
" }}}

let mapleader = ","
let g:yankring_window_use_bottom = 0
let g:yankring_window_height = 15
let g:EasyMotion_do_shade = 1

"Taglist
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1

filetype plugin on

set t_Co=256
let g:zenburn_high_Contrast=1
let g:molokai_original=1
colorscheme molokai

syntax on

map <tab> %

nnoremap n nzzzv
nnoremap N Nzzzv

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

noremap <leader><space> :noh<cr> :call clearmatches<cr>

"Bubble single lines
nnoremap <C-UP> ddkP
nnoremap <C-Down> ddp
nnoremap ' `
nnoremap ` ' 
"noremap ; :s/\([^;]\)$/\1;/<CR>
noremap ; <esc>A;<esc>

"show all lines with word under cursor
nnoremap <leader>m [I
vnoremap <leader>m [I 

"Bubble multiple lines - cool
vmap <C-k> xkPz[V`]
vmap <C-j> xp`[V`]

"escape to normal mode
inoremap hh <ESC>

"Make D act normally
nmap D d$

nnoremap S i<cr><esc><right>

"change behaviour of k to *
noremap K *
 
noremap j gj
noremap k gk

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv:call PulseCursorLine()<cr>
nnoremap N Nzzzv:call PulseCursorLine()<cr>

"source vim file when saving
if has("autocmd")
 autocmd bufwritepost .vimrc source $MYVIMRC
endif

cnoremap w!! w !sudo tee % >/dev/null

"FATBEEHIVE bk_debug function
vnoremap <leader>bs yo<ESC>ibk_debug("<ESC>hhpA;<ESC>
vnoremap <leader>b yo<ESC>ibk_debug(<ESC>pli<ESC>A);<ESC>
vnoremap <leader>bse yo<ESC>ibk_debug("<ESC>hhpA;<ESC>hhi", "emile@fatbeehive.com
vnoremap <leader>be yo<ESC>ibk_debug(<ESC>hpA;<ESC>hhi, "emile@fatbeehive.com

"FATBEEHIVE bk_debug function
nnoremap <leader>bn :BlogNew<CR>
nnoremap <leader>bsp :BlogSave publish<CR>
nnoremap <leader>bl :BlogList<CR>

"nerd tree toggle
nnoremap <leader>c<SPACE> :NERDComToggleComment<CR>

"php die function
vnoremap <leader>d yo<ESC>idie(<ESC>hpA;<ESC>
nnoremap <leader>d yo<ESC>idie(<ESC>hpA;<ESC>

"echo function
vnoremap <leader>es yo<ESC>iecho<SPACE>"<ESC>hpA;<ESC>
vnoremap <leader>e yo<ESC>iecho<SPACE><ESC>pA;<ESC>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Search forward with f key
noremap ,, ;

map <tab> %

"nerd tree toggle
nnoremap <leader>k :ZoomWin<CR>
vnoremap <leader>k :ZoomWin<CR>

"select a variable
nnoremap <leader>ss :set spell!<cr>

"select a variable
nnoremap <leader>v v$

"save
nnoremap <leader>w :w!<CR>

"select a variable
nnoremap <leader>x :r!xclip -o<cr>
vnoremap <leader>x :r!xclip -o<cr>

"easy to reach keys
noremap H ^

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0 
let g:ctrlp_cache_dir = $HOME
let g:ctrlp_dotfiles = 1
let g:ctrlp_mruf_exclude = '/.hg/.*\|/data/.*'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/data/*,*/.jpg/*,*/.jpeg/*,*/.png/*,*/.gif/*  " Linux/MacOSX
let g:ctrlp_map = '<leader>m'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

"EASY MOTION
let g:EasyMotion_mapping_f = '<leader>ef'
let g:EasyMotion_mapping_F = '<leader>eF'
let g:EasyMotion_mapping_T = '<leader>eT'
let g:EasyMotion_mapping_t = '<leader>et'
let g:EasyMotion_mapping_b = '<leader>eb'
let g:EasyMotion_mapping_B = '<leader>eB'
let g:EasyMotion_mapping_E = '<leader>eE'
let g:EasyMotion_mapping_w = '<leader>ew'
let g:EasyMotion_mapping_W = '<leader>eW'
let g:EasyMotion_mapping_e = '<leader>ee'
let g:EasyMotion_mapping_k = '<leader>ek'
let g:EasyMotion_mapping_j = '<leader>ej'

"copy to system clipboard
vnoremap <leader>y "+y

"set line numbers
nnoremap <leader>n :set number!<CR>

"set line numbers
nnoremap <leader>nt :NERDTreeToggle<CR>

"paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap S i<cr><esc><right>

"quit
nnoremap <leader>q :q!<CR>

"Create space underneath line
nnoremap - mz<esc>o<esc>'z
"Create space above line
nnoremap _ mz<esc>O<esc>'z
nnoremap <leader>r :YRShow<CR> 
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>t :TlistToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
inoremap <c-d> <esc>ddi

"scroll down
nnoremap <SPACE> 10j
vmap <SPACE> 10j
 
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"switching between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"change case of current word in insert mode
"nnoremap <C-U> gUiw
"inoremap <C-U> <esc>gUiwea

"php cheat for tags
autocmd FileType php let b:surround_45 = "<?php \r ?>"
let g:user_zen_leader_key = '<c-y>'

nnoremap <leader>z :set cursorline! cursorcolumn!<CR>

let g:dbext_default_profile_mysql_local= 'type=MYSQL:user=kp:passwd=corpse:driver=mysql'
let g:dbext_default_buffer_lines = 15
let  g:dbext_default_DBI_orientation = 'vertical'

let g:window_use_horiz = 0
let g:window_use_bottom = 0
let g:window_use_right = 1

silent !echo -ne "]12;\#dd4010\x7"

let &t_SI="]12;\#89b6e2\x7"
let &t_EI="]12;\#dd4010\x7"

au VimLeave * silent !echo -ne "]12;\#dd4010\x7"
au BufNewFile,BufRead /etc/httpd/* setf apache  

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

let g:rbpt_max = 16

"ABBREVIATIONS
iabbrev ldis ಠ_ಠ
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the
iabbrev ecoh echo

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('d', '$')
call MakeSpacelessIabbrev('pnd', '£')

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
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

"statusline setup
set statusline=%f "path to filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%#warningmsg#
set statusline+=%*
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

"find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

"open buffers in tabs
:au BufAdd,BufNewFile * nested tab sball
