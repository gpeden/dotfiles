" Jeff McCune <jeff@puppetlabs.com>
" 2010-07-28
" Vim customizations for Puppet Labs
" This should be useful for presentations, demos, and training.

set nocompatible
filetype plugin on
filetype indent on
syntax enable
execute pathogen#infect()

" http://www.linux.com/archive/feature/120126
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}\ %{&fo}]\ [%l/%L,%v\ %p%%]\ [HEX=\%02.2B]
" Always show the status line
set laststatus=2
" Tabs and indentation (Default to two spaces)
set tabstop=2 "set tab character to 4 characters
set shiftwidth=2 "indent width for autoindent
set expandtab "turn tabs into whitespace
set smartindent
filetype indent on "indent depends on filetype

" JJM Enable line numbers, useful for discussion when on a projector
set number

" set toggle for line numbers
nmap \n :set nu!<CR>

" JJM Highlight extra white space.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Give an indicator when we approach col 80 (>72)
" au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>72v', -1)
" Give a strong indicator when we exceed col 80(>80)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" Give an indicator of tailing white space.
au BufWinEnter * let w:m3=matchadd('ErrorMsg', '\s\+$', -1)
" Give an indicator of spaces before a tab.
au BufWinEnter * let w:m4=matchadd('ErrorMsg', ' \+\ze\t', -1)

" Based on tips from http://statico.github.com/vim.html

" Moving around text is part of what makes using Vim feel so efficient.
" The one single thing I could never stand about Vim’s default movements,
" however, is how j and k move around wrapped lines. By default they move
" you one line down and ups but on a linewise basis, which is annoying.
" If I hit j I would expect the cursor to move down a single row on the
" screen, just like every other text editing area in the world. The
" following does just that:

:nmap j gj
:nmap k gk

" Regarding Vim’s command line, its defaults make it behave very unlike
" a modern command line. If you’re used to Emacs-style movement keys on
" your Bash or Zsh command line (using Ctrl-A and Ctrl-E and the like)
" the you might want to make Vim act the same way:

:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" A common operation is to search for text, so it makes sense to have
" some sane defaults. The incsearch option highlights as you type an
" expression (a.k.a. “Emacs style”), and ignorecase plus smartcase make
" searches case-insensitive except when you include upper-case characters
" (so /foo matches FOO and fOo, but /FOO only matches the former).
" hlsearch is a useful option which highlights the current search, but
" the highlight can become annoying so it makes sense to have a key to
" clear the highlight when you no longer need it:

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

" If you use Vim buffers, Ctrl-P’s ability to quickly go to the buffer
" you want is life-changing. It’s so useful that I’ve bound it to ; (and
" nobody remembers what ; does anyway). Ctrl-P’s file search combined
" with buffer search is magnificent – use the file search to open files
" related to the task at hand, then use buffer search to flip in between
" them.

" :nmap ; :CtrlPBuffer<CR>

" It’s worth showing a few settings for Ctrl-P. The following are the
" settings I use which map it to ,t, put it at the top of the screen,
" hide unnecessary files from the search results, and a few more things.
" Run :help ctrlp-options to read more about them.

" :let g:ctrlp_map = '<Leader>t'
" :let g:ctrlp_match_window_bottom = 0
" :let g:ctrlp_match_window_reversed = 0
" :let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" :let g:ctrlp_working_path_mode = 0
" :let g:ctrlp_dotfiles = 0
" :let g:ctrlp_switch_buffer = 0

" It’s also useful to have a key which toggles the visibility of the tree:

:nmap \e :NERDTreeToggle<CR>

" If everyone could write code like you, wouldn’t the world be a great
" place? Unfortunately, there are still some jerks who use or don’t use
" tabs, or maybe they indent with four spaces instead of two, or vice
" versa, or whatever it is that those jerks do. You still need to read
" their code and it helps to be able to quickly switch between popular
" (and unpopular) tab modes:

:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Those some authors might wrap or not wrap lines at 80 or 100 columns
" or whatever it is you like, so being able to quickly toggle wrap mode helps:

:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set t_Co=256

let g:Powerline_symbols = 'fancy'

" undotree

:nmap \u :UndotreeToggle<CR>

if has("persistent_undo")
    set undodir = "~/.vim_undo"
    set undofile
endif
