" L: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 

"------------------------------------------------------------
" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"------------------------------------------------------------
" Plugins

Plugin 'valloric/youcompleteme'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic' 
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
 

" End Plugins
"-----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"-----------------------------------------------------------
" Plugin settings

" You Complete Me
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1


" Syntastic
let g:synstastic_python_checkers = ['python', 'flake8', 'Pylint']
let g:synstastic_javascript_checkers = ['jshint']
let g:synstastic_html_checkers = ['tidy', 'w3']
let g:synstastic_css_checkers = ['csslint', 'mixedindentlint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%t
set statusline+=    
set statusline+=%=
set statusline+=%4l
set statusline+=,
set statusline+=%2c

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
 
" Enable syntax highlighting
syntax on

" Make saving and opening views (for folding) automatic
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
set wildmode=list:longest
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set relativenumber
 
" Quickly time out on keycodes, but never time out on mappings
set timeout timeoutlen=300 ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set encoding=utf-8
set scrolloff=3
set showmode


" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
" Set leader to space
let mapleader = "\<Space>"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
noremap Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
inoremap ii <ESC> 

" Remap VIM 0 to first non-blank character
nnoremap L $
nnoremap H ^

" Remap s to substitute the entire word
nnoremap s ves


" Remap o and O to return to normal mode after adding line
nnoremap o o<ESC>
nnoremap O O<ESC>

" Remap <leader> + h, j, k, or l to Ctrl-w + h, j, k, or l to quickly switch
" windows
nnoremap <leader>hh <C-w>h
nnoremap <leader>jj <C-w>j
nnoremap <leader>kk <C-w>k
nnoremap <leader>ll <C-w>l

" Surrond word under cursor with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Surround visually selected text in double quotes
vnoremap <leader>" '<,'>i""

" Search options
nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
noremap <leader>, :noh<cr>


" Use tab to match brackets
nnoremap <tab> %
vnoremap <tab> %

" Options for handling long code lines
set colorcolumn=85
set wrap
set textwidth=79
set formatoptions=qrn1

" Quickly open and edit vimrc and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quickly enter visual line
nnoremap vv V
vnoremap ii <ESC>

" Map for easy toggle of NERDTree
nnoremap <leader>tt :NERDTreeToggle<CR>

" Map for easy toggle of Syntastic
nnoremap <leader>ts :SyntasticToggleMode<CR> :SyntasticToggleMode<CR>


"------------------------------------------------------------
"Word processor mode for word processing
func! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
com! WP call WordProcessorMode()
