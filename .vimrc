
"plugin manager

filetype off 
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
		echo "Installing NeoBundle\n"
		silent execute '!mkdir -p ~/.vim/bundle'
		silent execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
	endif
endif
call neobundle#rc(expand('~/.vim/bundle/'))
		NeoBundleFetch "Shougo/neobundle.vim"

	"	list of plugins, some commented out due to bugs
	
		"NeoBundle"jiangmiao/auto-pairs.git"
		NeoBundle "scrooloose/syntastic.git"
		NeoBundle "t9md/vim-quickhl.git"
		NeoBundle "myusuf3/numbers.vim.git"
		NeoBundle "vim-scripts/ZoomWin.git"
		NeoBundle "Valloric/YouCompleteMe.git"
		NeoBundle "christoomey/vim-tmux-navigator.git"
		NeoBundle "SirVer/ultisnips"
		"NeoBundle"honza/vim-snippets"
		NeoBundle "vim-scripts/Conque-GDB.git"
		NeoBundle "scrooloose/nerdcommenter.git"
		NeoBundle "bling/vim-airline"
		NeoBundle "derekwyatt/vim-fswitch.git"
		NeoBundle "vim-scripts/ZoomWin.git"
		NeoBundle 'Shougo/vimproc.vim', {
					\ 'build' : {  
					\     'linux' : 'make',
					\     'unix' : 'gmake',
					\    },
					\ }
		NeoBundle "Shougo/vimshell.vim.git"
		"NeoBundle"brookhong/cscope.vim"
		NeoBundle "davidhalter/jedi-vim.git"
		NeoBundle "scrooloose/nerdtree.git" 
		"NeoBundle"Shougo/neocomplete.vim.git" 
		NeoBundleCheck
		filetype plugin indent on


"	tmux integration with vim. Reqiures tmux 1.8 or later, and a companion tmux config file. 
"	Instructions found at:
"	https://github.com/christoomey/vim-tmux-navigator

if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '') 
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif"


"personal vim options

set number
set tags=./tags;/  "Locations of tags. Ctags is awesome
set noexpandtab
syntax on

set tabstop=4
set shiftwidth=4
set hlsearch        " highlight search results
set incsearch 		" show searches as they are typed
set showmatch       " briefly jump to matching bracket as you insert one 
set nohidden 		" should be on anyways by default

"When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is case insensitive.
set ignorecase
set smartcase 

"custom colorscheme must be downloaded. 
"Uncomment following line if you have it:

"colorscheme herald

" space-m to highlight a word. space-M to reset 
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)

" Enter newlines without entering insert mode 
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k


"start vim in nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"fixes a highlighting issue I encountered
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff

"map <F2> :ConqueGdb<CR>

"makes nerdtree easy, control-n
map <C-n> :NERDTreeToggle<CR>


"the following allows for easy switching between companion c files and header files

"au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '../inc'
augroup mycppfiles
	au!
	au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
	au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/'
augroup END
nmap <silent> <Leader>of :FSHere<cr>
"autocmd vimenter * NERDTree


" These variables effect plugin behaviour

"let NERDTreeShowHidden=1  "shows hidden files

let g:UltiSnipsUsePythonVersion = 2
let g:vimshell_use_terminal_command = "gnome-terminal -e"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf' "location of YouCompleteMe config. Very important
