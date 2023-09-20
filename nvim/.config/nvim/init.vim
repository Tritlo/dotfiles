filetype off
if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    silent exec expand('!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    silent exec "!nvim +PlugInstall +qa"
endif

call plug#begin('~/.config/nvim/plugged')
" The colorschemes
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline' "status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic' " Dat syntax highlighter
Plug 'tpope/vim-fugitive' " git integration
" use cs to change surrounding, ds to delete surrounding and ys to insert surrounding
Plug 'tpope/vim-surround' 
" repeat last command, . on steroids
Plug 'tpope/vim-repeat'
Plug 'Tritlo/vim-rsi' " uses tritlo instead of tpope, due to M-n being same as ð key on icelandic keyboard

Plug 'nathanaelkane/vim-indent-guides' " toggleable with <Leader>ig
call plug#end()
" call vundle#end()            " required
filetype plugin indent on    " required

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=80
    endif
endfunction

set cursorline
" space is pretty easy to reach:
let mapleader=" "
let maplocalleader="\\"



nnoremap <Leader> :

nnoremap <Leader>ti :IndentGuidesToggle<CR>
nnoremap <silent> <Leader>tc :call g:ToggleColorColumn()<CR>
" emacs keybindings
nnoremap <Leader>o :winc w<CR>
nnoremap <Leader>1 :winc o<CR>
nnoremap <Leader>2 :vsplit<CR>
nnoremap <Leader>3 :split<CR>
nnoremap <Leader>0 :winc c<CR>
" nnoremap <C-w>0 :winc c<CR>

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

"Closes preview
nnoremap <Leader>wz :winc z<CR>
"noremap <Leader>w- :winc -<CR>
"noremap <Leader>w+ :winc +<CR>
"noremap <Leader>w< :winc <<CR>
"noremap <Leader>w> :winc ><CR>

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
nnoremap <Leader>bb :b<Space>
nnoremap <Leader>bB :buffers<CR>
nnoremap <Leader>bh :bp<CR>
nnoremap <Leader>bl :bn<CR>
nnoremap <Leader>bd :bd<CR>

"nnoremap <Leader>e :e<Space>

" tabs
" vi bindings
nnoremap  <Leader>th :tabprev<CR>
nnoremap  <Leader>tl :tabnext<CR>
nnoremap  <Leader>tn :tabnew<CR>
nnoremap  <Leader>te :tabedit<Space>
nnoremap  <Leader>td :tabclose<CR>

nnoremap <leader>h :set hlsearch!<CR>

" nnoremap <Leader>jb :call JsBeautify()<cr>
"close quickfix
nnoremap <Leader>qc :ccl<CR>
nnoremap <Leader>cc :make<CR>

autocmd BufWinLeave *.* mkview!
" autocmd BufWinEnter *.* silent loadview

" show trailing whitespace
highlight ExtraWhitespace ctermbg=236 guibg=#303030

match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" show line showing location of character 80
silent! set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=#505040

set showcmd

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if !&scrolloff
  set scrolloff=1
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options


" Native settings
silent! set cryptmethod=blowfish " Set encryption method. Encrypt files with :X.
" Unencrypt with an empyt key.
set hlsearch " highlight search matches
set incsearch " starts search before enter
set autoread " reads files again if they have been changed outside of vim
set hidden " do not remove buffers that are hidden
set nocompatible " no vi mode here
set number " display line numbers
syntax enable " syntax highlighting
set laststatus=2 " always display status bar
set encoding=utf-8
" automatically indent
set smartindent autoindent copyindent shiftround
" ignore case in searches/replaces, except if they contain uppercase letters.
set smartcase ignorecase
" Tab = 4 spaces, expand tabs into 4 spaces, and make a <BS> delete 4 spaces.
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" read .exrc's in project folders.
set exrc secure
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.pyc,*.so,*.swp,*.zip " ignore these when expanding paths.
set clipboard=unnamed " yank to clipboard
set mouse=a " enable mouse support
set ruler   " show cursor location in statusbar

colorscheme molokai

let g:airline_theme="minimalist"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1

