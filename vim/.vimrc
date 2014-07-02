" set the runtime path to include Vundle and initialize 
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"mana

" let Vundle manage Vundle, required
" use PluginInstall to install these plugins
" and PluginClean to clean.
" requires Vundle to be installed,
" install Vundle with
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Required
Plugin 'gmarik/Vundle.vim'
" The greatest colorscheme?
Plugin 'tomasr/molokai'

Plugin 'flazz/vim-colorschemes'
" Powerline symbols recommended

" Aw yiss
Plugin 'scrooloose/nerdtree'
" Commenter
Plugin 'scrooloose/nerdcommenter'

Plugin 'bling/vim-airline'
" Dat syntax highlighter
Plugin 'scrooloose/syntastic'
" git integration
Plugin 'tpope/vim-fugitive'

Plugin 'jnwhiteh/vim-golang'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fs111/pydoc.vim'

Plugin 'pangloss/vim-javascript'

autocmd BufRead,BufNewFile .xmobarrc set filetype=haskell
autocmd BufRead,BufNewFile *.go set filetype=go

if has("unix")
    " unix only plugins go here
endif

" Thessi haegja a, viljum thad ekki i terminal
if has('gui_running')
    " opencl.
    " remember to create
    " opencl.vim in ~/.vim/ftdetect/
    " containing the command
    " autocmd BufRead,BufNewFile *.cl set filetype=opencl
    Plugin 'petRUShka/vim-opencl'

    Plugin 'nathanaelkane/vim-indent-guides'

    " File finder
    Plugin 'kien/ctrlp.vim'

    "git gutter
    Plugin 'airblade/vim-gitgutter'
    " Ser medhondlun

    if has("unix")
        " Code completion, tharf ad compile-a med cmake og libclang og e-d
        Plugin 'Valloric/YouCompleteMe'

        " Tharf exuberant ctags
        Plugin 'jeetsukumaran/vim-gazetteer'
        Plugin 'majutsushi/tagbar'
    endif
endif

call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete

set hidden " do not remove buffers that are hidden
set nocompatible " no vi mode here
set number " display line numbers
syntax enable " syntax highlighting
set laststatus=2 " always display status bar
set encoding=utf-8
" automatically indent
set smartindent autoindent
" ignore case in searches/replaces, except if they contain uppercase letters.
set smartcase ignorecase
" Tab = 4 spaces, expand tabs into 4 spaces, and make a <BS> delete 4 spaces.
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" read .exrc's in project folders.
set exrc secure

au BufRead,BufNewFile *.X68 setfiletype asm68k

" use w!! to save a file that should have been opened with sudo!
cmap w!! w !sudo tee > /dev/null %

let g:syntastic_c_check_header = 1
let g:syntastic_always_populate_loc_list = 1
let g:airline#extensions#tabline#enabled = 1
" let g:molokai_original = 1
if has("unix")
    let g:rehash256 = 1
    set t_Co=256
endif
colorscheme molokai
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    if has("win32")
        set guifont=Terminus:h14
    else
        set guifont=Terminus\ 13
    endif
    let g:ctrlp_extensions = ['gazetteer']
    let g:ycm_confirm_extra_conf = 0

    let g:indent_guides_guide_size=1
    let g:indent_guides_start_level=2
    let g:indent_guides_enable_on_vim_startup=1

    "toggle tagbar
    nnoremap <F8> :TagbarToggle<CR>
    nnoremap <Leader>tb :TagbarToggle<CR>
    inoremap <F8> <ESC>:TagbarToggle<CR>i
endif

" show line showing location of character 80
set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=#505040

" search highlighting
" set hlsearch
" disable search higlight on enter
" nnoremap <CR> :noh<CR><ESC>

" show trailing whitespace
highlight ExtraWhitespace ctermbg=236 guibg=#303030

match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" set spell spelllang=en

command Date r !date
""LatexCompile
command Lc !pdflatex -shell-escape %
""LatexView
command Lv !evince %:r.pdf & disown
command La !pdflatex -shell-escape % && evince %:r.pdf & disown

if has("unix")
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
endif

" space is pretty easy to reach:
let mapleader=" "


" key bindings
" file browsing
nmap <silent> <C-x>f :NERDTreeToggle<CR>
nnoremap <C-x><C-f> :e<Space>

nnoremap <Leader>wq :wq<Space>

" emacs keybindings
nnoremap <C-x>o :winc w<CR>
nnoremap <C-x>1 :winc o<CR>
nnoremap <C-x>2 :vsplit<CR>
nnoremap <C-x>3 :split<CR>
nnoremap <C-x>0 :winc c<CR>
nnoremap <C-w>0 :winc c<CR>

" more vimlike
nnoremap <Leader>ww :winc w<CR>
nnoremap <Leader>wn :winc n<CR>
nnoremap <Leader>wo :winc o<CR>
nnoremap <Leader>wc :winc c<CR>
nnoremap <Leader>wd :winc c<CR>

nnoremap <Leader>wh :winc h<CR>
nnoremap <Leader>wj :winc j<CR>
nnoremap <Leader>wk :winc k<CR>
nnoremap <Leader>wl :winc l<CR>

nnoremap <Leader>wv :winc v<CR>
nnoremap <Leader>ws :winc s<CR>
noremap <Leader>w- :winc -<CR>
noremap <Leader>w+ :winc +<CR>
noremap <Leader>w< :winc <<CR>
noremap <Leader>w> :winc ><CR>

"move
nnoremap <Leader>wH :winc H<CR>
nnoremap <Leader>wJ :winc J<CR>
nnoremap <Leader>wK :winc K<CR>
nnoremap <Leader>wL :winc L<CR>

" close and split
nnoremap <Leader>w0 :winc c<CR>
nnoremap <Leader>w1 :winc o<CR>
nnoremap <Leader>w2 :vsplit<CR>
nnoremap <Leader>w3 :split<CR>

" buffers
nnoremap <Leader>bn :enew<CR>
nnoremap <Leader>bb :enew<CR>
nnoremap <Leader>bh :bp<CR>
nnoremap <Leader>bl :bn<CR>
nnoremap <Leader>bd :bd<CR>

nnoremap <Leader>e :e 

" tabs
" vi bindings
nnoremap  <Leader>th :tabprev<CR>
nnoremap  <Leader>tl :tabnext<CR>
nnoremap  <Leader>tn :tabnew<CR>
nnoremap  <Leader>td :tabclose<CR>

" quit
nnoremap <C-x>q :wqa<CR>

" save
" enable emacs save in insert,
" this overwrites in-line spell check;
nnoremap <C-x><C-s> :w<CR>
inoremap <C-x><C-s> <ESC>:w<CR>i
" done on save
" nnoremap <C-c><C-c> :SyntasticCheck<CR>

" go to buffer
nnoremap <C-x>b :buffer<Space>
inoremap <C-x>b <ESC>:buffer<Space>

" list buffers
nnoremap <C-x><C-b> :buffers<CR>
inoremap <C-x><C-b> <ESC>:buffers<CR>
if has("unix")
    " unix only mappings
    nnoremap <F4> :!sakura & disown<CR>
    inoremap <F4> :!sakura & disown<CR>
endif

if has('gui_running')
    nnoremap <M-x> :
    inoremap <M-x> <Esc>:
endif


"let $XIKI_DIR="/home/tritlo/Workspace/xiki"
"source $XIKI_DIR/etc/vim/xiki.vim
