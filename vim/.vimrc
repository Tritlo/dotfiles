so ~/.vimrc.plugins

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


if has('gui_running')
    silent! colorscheme molokai
else
    let g:airline_theme="luna"
    colorscheme pablo
endif



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
        set guifont=Terminus\ 11
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

nnoremap <Leader>e :e<Space>

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
call tinymode#EnterMap("winsize","<C-W>+","+")
call tinymode#EnterMap("winsize","<C-W>-","-")
call tinymode#EnterMap("winsize","<Leader>w+","+")
call tinymode#EnterMap("winsize","<Leader>w-","-")
call tinymode#Map("winsize","+","wincmd +")
call tinymode#Map("winsize","-","wincmd -")
call tinymode#EnterMap("winsize","<C-W><","<")
call tinymode#EnterMap("winsize","<C-W>>",">")
call tinymode#EnterMap("winsize","<Leader>w<","<")
call tinymode#EnterMap("winsize","<Leader>w>",">")
call tinymode#Map("winsize","<","wincmd <")
call tinymode#Map("winsize",">","wincmd >")
call tinymode#ModeMsg("winsize","Change window size +/-, </>")

call tinymode#EnterMap("yankstack","<Leader>pj","j")
call tinymode#EnterMap("yankstack","<Leader>pk","k")
call tinymode#Map("yankstack","j","normal \<Plug>yankstack_substitute_newer_paste")
call tinymode#Map("yankstack","k","normal \<Plug>yankstack_substitute_older_paste")
call tinymode#ModeMsg("yankstack","Scroll through yankstack with j/k")

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
