call pathogen#infect()
call pathogen#helptags()

" Make colors look good
syntax enable
filetype indent plugin on
set t_Co=256
set background=dark
colorscheme molokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" crtlP remap
let g:ctrlp_map = '<leader>p'

" turn off error beeps
set noeb

" backspace over everything
set backspace=2

" Have vim auto read when a file is changed from outside
set autoread

" Set tabs to work good - 2 spaces, as spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" make tab-complete like bash
set wildmenu
set wildignore=*.o,*~,*.pyc

" autocomplete enhancements
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <Tab> pumvisible() ? '<Down>' : '<Tab>'

" turn backups off, since git/dropbox handles everything anyway
set nobackup
set nowb
set noswapfile

" auto indent, smart indent, wrap lines
"set ai
"set si
set wrap linebreak nolist
set tw=80

" viminfo: this saves commands, searches, etc. from one session to the next
set vi='50           "save marks for up to 50 files
set vi+=\"100        "save 100 lines for each register
set vi+=:100         "save 100 lines of command history
set vi+=n~/.viminfo  "save it all in ~/.viminfo

" Status Line
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

" Other UI
set number  " line numbers
set showcmd " show last command used
set lazyredraw " don't redraw during macros
set showmatch " match [({})]

" Searching
set hlsearch " hilight search results
set incsearch " search character by character

" Scrolling
set scrolloff=5 " Keep 3 lines below and above the cursor
set whichwrap+=<,>,h,l,[,] " wrap around to beginning of next line with h and l

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" treat long lines as break lines, for moving around in them
map j gj
map k gk

" smart moving between windows, ctrl-[hjkl]
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" easier buffer switching
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

" turn off search highlight and save more quickly
nnoremap <leader><Space> :w<CR>
nnoremap <leader>] :nohlsearch<CR>

" auto-open NERDTree
"au VimEnter *  NERDTree

" don't show compiled files
let NERDTreeIgnore = ['\.pyc$', '\.o$']

" leader-n opens NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=23

" leader-f runs flake8
autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>

" remap 0 to first non-blank character
map 0 ^

" Map Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()

let g:coquille_auto_move = 'true'

if executable('ovamlmerlin') && has('python')
    let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/ocamlmerlin"
    execute "set rtp+=".s:ocamlmerlin."/vim"
    execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
