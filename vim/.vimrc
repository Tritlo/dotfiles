filetype off

" Bootstrap vim-plug if not already present
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent exec "!vim +PlugInstall +qa"
endif

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
" use PlugInstall to install these plugins
" and PlugClean to clean.
" install Plug.vim with
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Plug 'gmarik/Vundle.vim' " Required

" The colorschemes
" Plug 'tomasr/molokai'
" Plug 'flazz/vim-colorschemes'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}


Plug 'scrooloose/nerdtree', {'on': 'NERDTreeFind'} " file browser
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeFind'}
"Plug 'scrooloose/nerdcommenter' " Commenter
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline' "status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic' " Dat syntax highlighter
Plug 'tpope/vim-fugitive' " git integration

" easy motion, to train motions better.
" mapped to leader leader.
" Plug 'Lokaltog/vim-easymotion'



" use cs to change surrounding, ds to delete surrounding and ys to insert surrounding
Plug 'tpope/vim-surround' 
" repeat last command, . on steroids
Plug 'tpope/vim-repeat'

" enable readline bindings in vim (i.e. c-a to go to start of line in insert
" and command line mode, c-e end of line, c-f and c-b a letter forward and
" backward and m-f and m-b for a word worard and backward
Plug 'Tritlo/vim-rsi' " uses tritlo instead of tpope, due to M-n being same as ð key on icelandic keyboard

" supercharges the * command (search for word under cursor)
" Plug 'ironhouzi/vim-stim'

" Wakatime timetracking
" Plug 'wakatime/vim-wakatime'

"" misc
"Plug 'tinymode.vim' " continuous key presses
Plug 'rking/ag.vim', {'on':'Ag'} " better grep, search for term in project.


" filetype plugins
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'jnwhiteh/vim-golang', {'for' : 'go'}
Plug 'pangloss/vim-javascript', {'for' : 'javascript'}
Plug 'ekalinin/Dockerfile.vim'
"Plug 'nginx.vim', {'for': 'nginx'}
Plug 'elzr/vim-json'
" Plug 'godlygeek/tabular' " for markdown
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

" Plug 'jiangmiao/auto-pairs'

" Beautify
" Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
" JSX
Plug 'mxw/vim-jsx' ", {'for': 'javascript'}
Plug 'jaxbot/syntastic-react' ", {'for': 'javascript'}
" opencl.
" remember to create
" opencl.vim in ~/.vim/ftdetect/
" containing the command
" autocmd BufRead,BufNewFile *.cl set filetype=opencl
Plug 'petRUShka/vim-opencl', {'for': 'opencl'}

Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}



" supervisor files and supervisor ctl
Plug 'thiderman/vim-supervisor' " also some functionality
" Plug 'vim-scripts/Tail-Bundle' " works for other tail files as well

Plug 'sjl/gundo.vim', {'on':'GundoToggle'}     " bound to <Leader>gu, displays the undo tree (so that i use it)
" Plug 'edsono/vim-matchit' " better % matching, including html tags

" Plug 'SirVer/ultisnips' " inserts snippets
" Plug 'honza/vim-snippets' " lots of predefined snippets

Plug 'nathanaelkane/vim-indent-guides' " toggleable with <Leader>ig


" vimshell and deps.
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/vimshell.vim' , {'on': 'VimShellCreate'}
" Plug 'Shougo/neocomplcache.vim'


" clojure
" Plug 'tpope/vim-dispatch', {'for':'clojure'}
" Plug 'tpope/vim-fireplace', {'for':'clojure'}
" Plug 'tpope/vim-leiningen', {'for':'clojure'}

" Latex

" Plug 'git://git.code.sf.net/p/vim-latex/vim-latex', {'for':'latex'}

" Plug 'vim-voom/VOoM' " outline viewer
" Plug 'vim-scripts/utl.vim' " better vim url handling
" emacs kill-ring in vim.
" use with meta-p to scroll through yank history.
" Does not work with the Icelandic key ð.
Plug 'maxbrunsfeld/vim-yankstack'

Plug 'lervag/vimtex'
" Thessi haegja a, viljum thad ekki i terminal
if has('gui_running')
    " these take longer to load

    "vim notes
    " Plug 'xolox/vim-shell'
    " Plug 'xolox/vim-misc'
    " Plug 'xolox/vim-notes'
    "
    " local vimrc, loads .lvimrc files in reverse order, and applies those 
    " settings. Like exrc, but hierarchical.
    Plug 'embear/vim-localvimrc'

    Plug 'klen/python-mode', {'for' : 'python'}
    " File finder
    Plug 'kien/ctrlp.vim'
    Plug 'tpope/vim-sleuth' " automatically detects indent settings

    "git gutter
    Plug 'airblade/vim-gitgutter'
    " vim-rooter is nice, but might be confusing
    " during command line editing
    Plug 'airblade/vim-rooter'
    " Ser medhondlun

    if has("unix")
        " unix only plugins go here
        " Code completion, tharf ad compile-a med cmake og libclang og e-d
        Plug 'Valloric/YouCompleteMe'
        " Tharf exuberant ctags
        Plug 'jeetsukumaran/vim-gazetteer'
        Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
    endif
endif
call plug#end()
" call vundle#end()            " required
filetype plugin indent on    " required




autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

if has("unix")
    " if !exists('g:airline_symbols')
    "   let g:airline_symbols = {}
    " endif
    let g:airline_powerline_fonts = 1
    " let g:airline#extensions#tabline#left_sep = '|>'
    " let g:airline#extensions#tabline#right_sep = '<|'
    " let g:airline#extensions#tabline#left_alt_sep = '||>'
    " let g:airline#extensions#tabline#right_alt_sep = '<||'
    " let g:airline_left_sep = '|>'
    " let g:airline_right_sep = '<|'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.whitespace = '_'

    " " unicode symbols
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'

endif


" Have vim-rooter not echo the dir
let g:rooter_silent_chdir = 1

let g:wakatime_PythonBinary = '/usr/bin/python'


let g:pymode_rope_completion = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_unmodified = 0
let g:pymode_folding = 0

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'vimshell' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'conque_term' : 1
      \}


let g:yankstack_map_keys = 0
let g:markdown_fold_style = 'nested'

"

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_c_check_header = 1
let g:syntastic_always_populate_loc_list = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:ycm_confirm_extra_conf = 0

let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1

let g:shell_mappings_enabled = 0

if has('gui_running')
    let g:ctrlp_extensions = ['gazetteer']
    let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    let g:ctrlp_gazetteer_ctags_bin = "ctags-exuberant"
    let g:ctrlp_gazetteer_types = {
        \   'javascript' :{
        \       'bin' : 'jsctags',
        \       'args' : '-f -',
        \   }
        \ }
endif


" call tinymode#EnterMap("winsize","<C-W>+","+")
" call tinymode#EnterMap("winsize","<C-W>-","-")
" call tinymode#EnterMap("winsize","<Leader>w+","+")
" call tinymode#EnterMap("winsize","<Leader>w-","-")
" call tinymode#Map("winsize","+","wincmd +")
" call tinymode#Map("winsize","-","wincmd -")
" call tinymode#EnterMap("winsize","<C-W><","<")
" call tinymode#EnterMap("winsize","<C-W>>",">")
" call tinymode#EnterMap("winsize","<Leader>w<","<")
" call tinymode#EnterMap("winsize","<Leader>w>",">")
" call tinymode#Map("winsize","<","wincmd <")
" call tinymode#Map("winsize",">","wincmd >")
" call tinymode#ModeMsg("winsize","Change window size +/-, </>")
" call tinymode#EnterMap("yankstack","<Leader>pj","j")
" call tinymode#EnterMap("yankstack","<Leader>pk","k")
" call tinymode#Map("yankstack","j","normal \<Plug>yankstack_substitute_newer_paste")
" call tinymode#Map("yankstack","k","normal \<Plug>yankstack_substitute_older_paste")
" call tinymode#ModeMsg("yankstack","Scroll through yankstack with j/k")



" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('sh', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')






set tags=./tags,.tags;

function CreateTags()
    exec ':!git rev-parse --show-toplevel && cd $(git rev-parse --show-toplevel) && git ls-files | ctags -f .tags -L-'
endfunction

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=80
    endif
endfunction

" let g:airline_theme="dark"
"colorscheme default

" if has('gui_running')
"     silent! colorscheme molokai
" else
"     let g:airline_theme="dark"
"     colorscheme pablo
" endif



autocmd BufRead,BufNewFile .xmobarrc set filetype=haskell
autocmd BufRead,BufNewFile Dockerfile set filetype=Dockerfile
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufEnter,BufRead,BufNewFile *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.djhtml set filetype=html
au BufRead,BufNewFile *.X68 setfiletype asm68k
autocmd BufEnter \[vimshell\]* NeoComplCacheEnable
autocmd BufLeave \[vimshell\]* NeoComplCacheDisable


set omnifunc=syntaxcomplete#Complete

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

" stuff from vim-sensible
set showcmd

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
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
" set fileformat+=mac

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" use w!! to save a file that should have been opened with sudo!
cmap w!! w !sudo tee > /dev/null %

" let g:molokai_original = 1
if has("unix")
    let g:rehash256 = 1
    set t_Co=256
endif

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    if has("win32")
        set guifont=Terminus:h14
    else
        set guifont=Hack\ 11
    endif
    silent! colorscheme molokai

    "toggle tagbar
endif

" show line showing location of character 80
silent! set colorcolumn=80
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


" space is pretty easy to reach:
let mapleader=" "
let maplocalleader="\\"


" key bindings
" file browsing
nmap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>tg :GundoToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>tf :NERDTreeToggle<CR>
nnoremap <Leader>ti :IndentGuidesToggle<CR>
nnoremap <silent> <Leader>tc :call g:ToggleColorColumn()<CR>

" nnoremap <F8> :TagbarToggle<CR>
" inoremap <F8> <ESC>:TagbarToggle<CR>i

nnoremap <Leader>gz :CtrlPGazetteer<CR>

nnoremap <Leader>gt :call CreateTags()<CR>

"Shifting keeps us in visual mode
" vnoremap < <gv
" vnoremap > >gv

" map the leader to : so that all commands are just a space away.
nnoremap <Leader> :

nnoremap <Leader>wq :wq<Space>

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

" nnoremap <Leader>tt :VimShellCreate<Cr>
nnoremap <leader>ts :SyntasticToggleMode<CR>
" nnoremap <Leader>u :Unite<Cr>


nnoremap <Leader>jb :call JsBeautify()<cr>
"close quickfix
nnoremap <Leader>qc :ccl<CR>
nnoremap <Leader>cc :make<CR>

let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_run_bind = '<leader>pr'
nnoremap <Leader>pl :PymodeLintToggle<CR>

" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion=['<C-j>',"<tab>"]
let g:ycm_key_list_previous_completion=['<C-k>']



"let g:UltiSnipsExpandTrigger="<c-j>"
"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"continuous resize

" save
" enable emacs save in insert,
" this overwrites in-line spell check;
" nnoremap <C-x><C-s> :w<CR>
" inoremap <C-x><C-s> <ESC>:w<CR>i
" done on save
" nnoremap <C-c><C-c> :SyntasticCheck<CR>

" Reminder: Jumplist with ctrl-i and ctrl-o.


" list buffers
if has("unix")
    " unix only mappings
    nnoremap <F4> :!sakura & disown<CR>
    inoremap <F4> :!sakura & disown<CR>
endif

" if has('gui_running')
"     nnoremap <M-x> :
"     inoremap <M-x> <Esc>:
" endif


" run search replace on all files in quickfix list (e.g. after Ag find)
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" ensure closing of nerdtree

nnoremap <leader>h :set hlsearch!<CR>

" let $XIKI_DIR="/home/tritlo/Workspace/xiki"
" source $XIKI_DIR/etc/vim/xiki.vim
"
"

" Save fold information and cursor location
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" nmap <leader>c<Space> gc
" vmap <leader>c<Space> gc

nmap <leader>cy "+y
vmap <leader>cy "+y<CR>
nmap <leader>cp "+p<CR>

let g:tex_flavor="latex"


let g:vimtex_quickfix_ignore_all_warnings=1
let g:vimtex_quickfix_ignored_warnings=[
    \ 'Underfull',
    \ 'Overfull',
    \ 'specifier changed to',
    \ ]

set cursorline
" Light mode terminal:
" colorscheme delek
colorscheme pablo
let g:airline_theme="minimalist"
