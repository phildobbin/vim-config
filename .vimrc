:set ts=2
:syntax on
:set ai
:set nocompatible
:filetype off
:set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp' : 'vim/'}
Bundle 'L9'
Bundle 'FuzzyFinder'
:set vb
:set hlsearch
":set showmatch
:set binary noeol
:set backspace=indent,eol,start
:filetype plugin indent on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"let g:colors_name = "color_sample_pack.vim"
:version 7.3.410
:set number
:set showmode
:map q :q<CR>
:set path=$HOME/usr/local/bin,/opt/local/bin,/usr/bin,.
:set ignorecase
call pathogen#infect('~/.vim/bundle')
call pathogen#helptags()
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\    exe "normal g`\"" |
	\ endif

let g:script_runner_ruby = '/Users/dobbin/.rvm/rubies/ruby-1.8.7-p352/bin/ruby'
let g:script_runner_perl = '/Users/dobbin/perl5/perlbrew/perls/perl-5.14.2/bin/perl'
let g:ctags_path='/opt/local/bin/ctags'
let g:ctags_statusline=1

"autocmd! ColorScheme * source~/.vim/plugin/statusline.vim

cabbr %% <C-R>=expand('%:p:h')<CR>

let g:ragtag_global_maps = 1

set laststatus=2
"set statusline=
"set statusline+=%1*%-52F\
"set statusline+=%2*\ %{%ff=='unix'?'\\n':(%ff=='mac'?'\\r':'\\r\\n')}\
"set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\
"set statusline+="%{VimBuddy()}" 
set gfn=Monaco:h13

let g:gist_clip_command = 'pbcopy'

set hidden

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set nocp

inoremap jj <ESC>

let mapleader = ","

nnoremap <leader>a :Ack

:setlocal spell spelllang=en_gb

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>


compiler ruby

:set cpo-=<

nnoremap <leader>gt :GundoToggle<CR>

:auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")

let g:ConqueTerm_InsertOnEnter = 0

let g:ConqueTerm_ToggleKey = '<F8>'

let g:ConqueTerm_Color = 2

:noremap gm :NERDTreeToggle<Return>

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup = 1

let NERDTreeShowHidden=1


" cd to the directory containing the file in the buffer - thanks, Derek
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" stop automatically colorizing parentheses
let loaded_matchparen = 1

":autocmd FileType mail :nmap <leader>s :w<CR>:!aspell -e -c %<CR>:e<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" edit vimrc & source vimrc
nmap <silent> ,ev :e $MYVIMRC<CR>
"nmap <silent> ,so :so $MYVIMRC<CR>

" Make the current file executable
nmap <silent> ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" fix spelling mishtakes

iab teh the
iab Teh The
iab taht that
iab Taht That
iab alos also
iab Alos Also
iab aslo also
iab Aslo Also
iab becuase because
iab Becuase Because
iab bianry binary
iab Bianry Binary
iab bianries binaries
iab Bianries Binaries
iab charcter character
iab Charcter Character
iab charcters characters
iab Charcters Characters
iab exmaple example
iab Exmaple Example
iab exmaples examples
iab Exmaples Examples
iab reagrds regards
iab Reagrds Regards
iab seperate separate
iab Seperate Separate
iab fone phone
iab Fone Phone

" Quick write
nmap <leader>w :w<CR>


:source $VIMRUNTIME/menu.vim
:set wildmenu
:set cpo-=<
:set wcm=<C-Z>
:map <silent> <leader>k :emenu <C-Z>

" FuzzyFinder MRU mappings
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> sr     :FufRenewCache<CR>
nnoremap <silent> sn :FufMruFile<CR>
nnoremap <silent> sN :FufMruFileInCwd<CR>

" rid us of gremlins
"function! Hideme()
    "setlocal noswapfile
    "setlocal buftype=nofile
    "setlocal bufhidden=hide
"endfunction

" node.js make & error in QuickFix
nmap <Leader><Leader> :w<CR>:make! \| botright cwindow<CR>













