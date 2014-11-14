so ~/.vimrc.plugins

if has('gui_running')
    silent! colorscheme molokai
else
    colorscheme pablo
    let g:airline_theme="luna"
endif



autocmd BufRead,BufNewFile .xmobarrc set filetype=haskell
autocmd BufRead,BufNewFile Dockerfile set filetype=Dockerfile
autocmd BufRead,BufNewFile *.go set filetype=go
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
        set guifont=Terminus\ 13
    endif
    let g:ctrlp_extensions = ['gazetteer']
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

if has("unix")
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline#extensions#tabline#left_sep = '▶'
    let g:airline#extensions#tabline#left_alt_sep = '|'
    "let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    "let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
endif

" space is pretty easy to reach:
let mapleader=" "
let maplocalleader="\\"


" key bindings
" file browsing
nmap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>ig :IndentGuidesToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
inoremap <F8> <ESC>:TagbarToggle<CR>i


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

nnoremap <Leader>tt :VimShellCreate<Cr>
" nnoremap <Leader>u :Unite<Cr>


"close quickfix
nnoremap <Leader>qc :ccl<CR>

" save
" enable emacs save in insert,
" this overwrites in-line spell check;
" nnoremap <C-x><C-s> :w<CR>
" inoremap <C-x><C-s> <ESC>:w<CR>i
" done on save
" nnoremap <C-c><C-c> :SyntasticCheck<CR>

" Reminder: Jumplist with ctrl-i and ctrl-o.

"" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']


"let g:UltiSnipsExpandTrigger="<c-j>"

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


let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_run_bind = '<leader>pr'
nnoremap <Leader>pl :PymodeLintToggle<CR>
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

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
let g:org_command_for_emacsclient = "emacsclient"

" let $XIKI_DIR="/home/tritlo/Workspace/xiki"
" source $XIKI_DIR/etc/vim/xiki.vim
"
let g:ft_ignore_pat = '\.org'
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
let g:org_capture_file = '~/org/captures.org'

" Save fold information and cursor location
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

nmap <Leader>c<Space> gc
vmap <Leader>c<Space> gc

nmap <leader>cy "+y
vmap <leader>cy "+y<CR>
nmap <leader>cp "+p<CR>

" vim-notes
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.md'
" no replacing!
let g:notes_smart_quotes = 0
let g:notes_unicode_enabled = 0

vnoremap <leader>ne :NoteFromSelectedText<CR>
vnoremap <leader>ns :SplitNoteFromSelectedText<CR>
vnoremap <leader>nt :TabNoteFromSelectedText<CR>
vnoremap <leader>nm :NoteToMarkdown<CR>
vnoremap <leader>nh :NoteToHtml<CR>
vnoremap <leader>nd :DeleteNote<CR>
nnoremap <leader>nn :Note<Space>
nnoremap <leader>ns :SearchNotes<CR>
nnoremap <leader>nv :execute 'VoomToggle' &ft<CR>

let g:shell_mappings_enabled = 0


