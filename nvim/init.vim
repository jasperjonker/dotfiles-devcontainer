" http://nerditya.com/code/guide-to-neovim/
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set smartcase               " except when using capital letters
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an column border for good coding style
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set showcmd                 " Show partial commands in the last line of the screen
set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=5       " Show next lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set list                " Show problematic characters.

" Disable startup warning message expecting neovim >= 0.5.0
let g:coc_disable_startup_warning = 1

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
    set mouse=a
endif

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" The hidden function allows allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Enable syntax highlighting
if has('syntax')
  syntax on
endif


"“ Plugin Section
call plug#begin("~/.vim/plugged")
 " A good theme for neovim
 Plug 'dracula/vim'

 " An easy way for commenting out lines
 Plug 'preservim/nerdcommenter'

 " A fast code completion engine
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " Comment using gcc and gc
 Plug 'tpope/vim-commentary'

 " Multiline editing
 Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Color schemes
 if (has("termguicolors"))
     set termguicolors
 endif
 syntax enable

" Colorscheme evening
colorscheme dracula

" Open new split panes to right and below
set splitright
set splitbelow


" Move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>" copies filepath to clipboard by pressing yf
nnoremap <silent> yf :let @+=expand('%:p')<CR>

nnoremap ; :    " Use ; for commands.
nnoremap Q @q   " Use Q to execute default register.

" Copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Another really useful feature of vim is relative numbers. When turned on, the line numbers will start counting up
" from current line on either side. Extremely useful when you want to yank a few lines starting from the current line.

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

"set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" While searching I prefer to have smart-case. Search will match either case unless at least one letter in search
" pattern is capital. You would also notice annoying highlights from previous searches sometimes, the <C-L> mapping
" gets rid of that. I also rend to do search and replace quite a lot and tying the whole %s/<search>/<replace>/ gets
" too slow. So I added a binding <Leader>s to put the whole command and put the cursor at the search part of it
"
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>


" Execute bash shell shortcut in both normal and interactive mode
nnoremap <F5> <esc>:w<enter>:!%:p<enter>
inoremap <F5> <esc>:w<enter>:!%:p<enter>

nnoremap <F6> <esc>:w<enter>:!python %:p<enter>
inoremap <F6> <esc>:w<enter>:!python %:p<enter>
