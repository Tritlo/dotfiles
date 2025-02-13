filetype off

" Bootstrap vim-plug if not already present
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent exec "!vim +PlugInstall +qa"
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
" repeat last command, . on steroids
" Plug 'tpope/vim-repeat'
"
Plug 'vim-airline/vim-airline' "status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " git integration
Plug 'tpope/vim-commentary'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tomasiser/vim-code-dark'

Plug 'Tritlo/vim-rsi' " uses tritlo instead of tpope, due to M-n being same as ð key on icelandic keyboard
Plug 'tritlo/hypersubatomic.vim', {'branch': 'main'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

if !has('nvim')
    Plug 'nathanaelkane/vim-indent-guides'
else
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
endif

call plug#end()



if executable('clip.exe')
    let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
endif

" call vundle#end()            " required
filetype plugin indent on    " required

" let g:markdown_fold_style = 'nested'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

let g:shell_mappings_enabled = 0

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=100
    endif
endfunction
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


" show line showing location of character 80
silent! set colorcolumn=100


" space is pretty easy to reach:
let mapleader=" "
let maplocalleader="\\"
" nnoremap <Leader>ti :IndentGuidesToggle<CR>
nnoremap <silent> <Leader>tc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <Leader>tw :set wrap!<CR>
nnoremap <silent> <Leader>ts :set spell!<CR>
nnoremap <silent> <Leader>dw :%s/\s\+$//gc<CR>

" map the leader to : so that all commands are just a space away.
" nnoremap <Leader> :

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
nnoremap <Leader>bd :bp\|bd! #<CR>


"nnoremap <Leader>e :e<Space>

" tabs
" vi bindings
nnoremap  <Leader>th :tabprev<CR>
nnoremap  <Leader>tl :tabnext<CR>
nnoremap  <Leader>tn :tabnew<CR>
nnoremap  <Leader>te :tabedit<Space>
nnoremap  <Leader>td :tabclose<CR>

nnoremap <Leader>tt <cmd>terminal /usr/bin/bash --rcfile ~/.bashrc.nvim<CR>
set shell=/usr/bin/bash
" nnoremap <Leader>tt <cmd>terminal<CR>
" set shell=/usr/bin/zsh

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope<cr>

nnoremap <Leader>tf <cmd>NvimTreeToggle<CR>

nnoremap <Leader>fo :!fourmolu -q -i %<CR>

nnoremap <Leader>ss :mksession!<CR>
nnoremap <Leader>sl :source Session.vim<CR>

nnoremap <Leader>cc :make!<CR>

nmap <leader>cy "+y
vmap <leader>cy "+y<CR>
nmap <leader>cp "+p<CR>

let g:tex_flavor="latex"

set cursorline
set termguicolors

" let g:codedark_conservative=1
" let g:codedark_modern=1
let g:codedark_transparent=1
"set t_Co=256
"set t_ut=
" colorscheme catppuccin-latte
"
hi cursor guifg=black guibg=yellow

" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"     \,sm:block-blinkwait175-blinkoff150-blinkon175
set guicursor=
autocmd OptionSet guicursor set guicursor=

if !has('gui')
    if has('nvim')
        colorscheme hypersubatomic
        let g:airline_theme="catppuccin"

        " if executable('powershell.exe')
        " let stl = strlen("AppsUseLightTheme : 1")
        " if split(system("powershell.exe Get-ItemProperty -Path \"HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize\" -Name AppsUseLightTheme | findstr.exe AppsUse"),'\zs')[stl-1] == 1
        "     set background=light
        "     colorscheme catppuccin-latte
        " else
        "     set background=dark
        "     colorscheme hypersubatomic
        "     let g:airline_theme="hypersubatomic"
        " endif
    else
        colorscheme codedark
        let g:airline_theme="codedark"
    endif
else
    set guifont=BerkeleyMono\ Nerd\ Font\ Regular\ 9
    colorscheme hypersubatomic
    let g:airline_theme="hypersubatomic"
    " set guiligatures=!\"$%&\'()*+,-./:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{\|}~
endif

" Set after the theme to overwrite
"highlight ColorColumn ctermbg=238 guibg=#3B3F51
"highlight ExtraWhitespace ctermbg=246 guibg=#8F93A2
"
hi TermCursor guifg=yellow guibg=black gui=bold,underline

if &buftype !=# 'terminal'
  match ExtraWhitespace /\s\+$/
endif

augroup extra_whitespace
  autocmd!
  autocmd TermOpen * match none
  autocmd InsertEnter * if &buftype !=# 'TERMINAL' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &buftype !=# 'TERMINAL' | match ExtraWhitespace /\s\+$/ | endif
augroup end



if has('nvim')
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
})
end
vim.opt.rtp:prepend(lazypath)
-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
  config = function()
    require("ibl").setup {}
  end,
},
{"github/copilot.vim"

},
{ 'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
  require("nvim-tree").setup {
       -- renderer = {
       --     icons = {
       --         show = {
       --             file = false,
       --             folder = false,
       --             git = true,
       --             folder_arrow = false, }
       --         }
       --     }
        }
  end,
},
{
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
},
--{ "epwalsh/obsidian.nvim",
--   lazy=false,
--   dependencies = { "nvim-lua/plenary.nvim" },
--   opts={
--       workspaces={
--           {
--                   name="vault",
--                   path="~/Obsidian"
--           }
--       },
--       daily_notes={
--           folder="Dailies/",
--           template="Daily.md"
--       },
--       templates={
--           folder="Templates/"
--       }
--
--   }
--}
-- {
-- "folke/flash.nvim",
-- event = "VeryLazy",
-- ---@type Flash.Config
-- opts = {},
-- -- stylua: ignore
-- keys = {
--     { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--     { "R", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--     --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--     --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
-- },
-- },
--{
--  "folke/which-key.nvim",
--  event = "VeryLazy",
--  init = function()
--    vim.o.timeout = true
--    vim.o.timeoutlen = 300
--  end,
--  opts = {
--    -- your configuration comes here
--    -- or leave it empty to use the default settings
--    -- refer to the configuration section below
--  }
-- }

})



-- Uff, but ok
vim.schedule(function()
vim.call('plug#end')

require("nvim-treesitter.configs").setup {

    ensure_installed = {"haskell", "c", "lua", "vim", "latex"},
    highlight = {enable = true },
    indent = {enable = true},
}


-- Latex LSP
require('lspconfig').texlab.setup({})

-- Haskell LSP
require('lspconfig').hls.setup({
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  --settings = {haskell = {plugin = {rename = {globalOn = true}}}},
})

-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})



end)
EOF

endif


tnoremap <F10> <Esc>
tnoremap <Esc> <C-\><C-n>

autocmd BufRead,BufNewFile *.dpella set ft=dpella
