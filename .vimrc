:set ts=2
:syntax on
:set ai
:set nocompatible
:filetype off
:set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp' : 'vim/'}
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
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
:version 7.3.462
:set number
:set showmode
:map q :q<CR>
:set path=$HOME/usr/local/bin,/opt/local/bin,/usr/bin,.
:set ignorecase
:set smartcase
:set foldenable
:set foldmethod=marker " Fold on the marker
:set foldlevel=100 " Don't auto-fold anything (but I can still fold manually)
:set foldopen=mark,percent,tag " what movements open folds

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,.markdown} set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit
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

" enable menus in console
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

" once bitten, twice shy...
set backup " backup on
set backupdir=~/.backup

source $VIMRUNTIME/ftplugin/man.vim

autocmd Filetype tex source ~/.vim/auctex.vim

" after/plugin/my_tabular_commands.vim
" Provide extra :Tabular commands

if !exists(':Tabularize')
				finish "Give up here; the Tabular plugin mustn't have been loaded
endif

" Make line wrapping possible by resetting the 'cpo' option, first saving it
let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern! asterix /*/11

AddTabularPipeline! remove_leading_spaces /^ /
				\ map(a:lines, "substitute(v:val, '^ *', '')")

" Restore the saved value of 'cpo'
let &cpo = s:save_cpo
unlet s:save_cpo






