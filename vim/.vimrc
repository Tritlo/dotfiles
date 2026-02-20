" Bootstrap vim-plug if not already present
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent exec "!vim +PlugInstall +qa"
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tomasiser/vim-code-dark'
Plug 'Tritlo/vim-rsi' " uses tritlo instead of tpope, due to M-n being same as ð key on icelandic keyboard
call plug#end()

filetype plugin indent on

" WSL clipboard support
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

let g:shell_mappings_enabled = 0

" Source bashrc if present (Linux/WSL)
if has('unix') && filereadable(expand('~/.bashrc'))
  silent !bash -c "source ~/.bashrc"
endif

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=100
    endif
endfunction

" Settings
set hlsearch
set incsearch
set autoread
set number
set laststatus=2
set smartindent autoindent copyindent shiftround
set smartcase ignorecase
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set exrc secure
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.pyc,*.so,*.swp,*.zip
set clipboard=unnamed
set mouse=a
set ruler
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

silent! set colorcolumn=100

" Leader
let mapleader=" "
let maplocalleader="\\"

" Toggle mappings
nnoremap <silent> <Leader>tc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <Leader>tw :set wrap!<CR>
nnoremap <silent> <Leader>ts :set spell!<CR>
nnoremap <silent> <Leader>dw :%s/\s\+$//gc<CR>

nnoremap <Leader>wq :wq<Space>

" Emacs-style window shortcuts
nnoremap <Leader>o :winc w<CR>
nnoremap <Leader>1 :winc o<CR>
nnoremap <Leader>2 :vsplit<CR>
nnoremap <Leader>3 :split<CR>
nnoremap <Leader>0 :winc c<CR>

" Window management
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
noremap <Leader>wz :winc z<CR>
nnoremap <Leader>wH :winc H<CR>
nnoremap <Leader>wJ :winc J<CR>
nnoremap <Leader>wK :winc K<CR>
nnoremap <Leader>wL :winc L<CR>
nnoremap <Leader>w0 :winc c<CR>
nnoremap <Leader>w1 :winc o<CR>
nnoremap <Leader>w2 :vsplit<CR>
nnoremap <Leader>w3 :split<CR>

" Buffers
nnoremap <Leader>bn :enew<CR>
nnoremap <Leader>bb :b<Space>
nnoremap <Leader>bB :buffers<CR>
nnoremap <Leader>bh :bp<CR>
nnoremap <Leader>bl :bn<CR>
nnoremap <Leader>bd :bp\|bd! #<CR>

" Tabs
nnoremap <Leader>th :tabprev<CR>
nnoremap <Leader>tl :tabnext<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>te :tabedit<Space>
nnoremap <Leader>td :tabclose<CR>

" Terminal
if executable('/usr/bin/bash')
  nnoremap <Leader>tt <cmd>terminal /usr/bin/bash --rcfile ~/.bashrc.nvim<CR>
  set shell=/usr/bin/bash
elseif executable('/bin/bash')
  nnoremap <Leader>tt <cmd>terminal /bin/bash<CR>
  set shell=/bin/bash
endif

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope<cr>

nnoremap <Leader>tf <cmd>Neotree<CR>
nnoremap <Leader>fo :!fourmolu -q -i %<CR>

" Sessions
nnoremap <Leader>ss :mksession!<CR>
nnoremap <Leader>sl :source Session.vim<CR>

nnoremap <Leader>cc :make!<CR>

" System clipboard
nmap <leader>cy "+y
vmap <leader>cy "+y<CR>
nmap <leader>cp "+p<CR>

let g:tex_flavor="latex"

set cursorline
set termguicolors

let g:codedark_transparent=1
hi cursor guifg=black guibg=yellow

" Colorscheme selection
if !has('gui')
    if has('nvim')
        " WSL: detect Windows light/dark theme
        if executable('powershell.exe')
            let stl = strlen("AppsUseLightTheme : 1")
            if split(system("powershell.exe Get-ItemProperty -Path \"HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize\" -Name AppsUseLightTheme | findstr.exe AppsUse"),'\zs')[stl-1] == 1
                set background=light
            else
                set background=dark
            endif
        " macOS: detect light/dark theme
        elseif has('mac')
            if system("defaults read -g AppleInterfaceStyle 2>/dev/null") =~? 'dark'
                set background=dark
            else
                set background=light
            endif
        endif
    else
        silent! colorscheme codedark
        let g:airline_theme="codedark"
    endif
else
    set guifont=BerkeleyMono\ Nerd\ Font\ Regular\ 9
endif

hi TermCursor guifg=yellow guibg=black gui=bold,underline

if has('nvim')

if &buftype !=# 'terminal'
  match ExtraWhitespace /\s\+$/
endif

augroup extra_whitespace
  autocmd!
  autocmd TermOpen * match none
  autocmd InsertEnter * if &buftype !=# 'TERMINAL' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &buftype !=# 'TERMINAL' | match ExtraWhitespace /\s\+$/ | endif
augroup end

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { "haskell", "c", "lua", "vim", "latex", "sql" },
      auto_install = true,
    },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {},
  },
  { "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down" },
      { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up" },
      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor" },
      { "<Leader>ma", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = {"x"}, desc = "Add cursors to the lines of the visual area" },
      { "<Leader>mm", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword" },
      { "<Leader>mv", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area" },
      { "<Leader>ml", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors" },
    },
  },
  { "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  { "projekt0n/github-nvim-theme", lazy = false, priority = 1000 },
  { "lewis6991/gitsigns.nvim" },
  { "petertriho/nvim-scrollbar" },
  { 'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown" },
      latex = { enabled = false },
    },
    ft = { "markdown" },
  },
  { "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    },
  },
})

-- Defer plug#end so lazy.nvim and vim-plug don't conflict at startup
vim.schedule(function()
  vim.call('plug#end')

  -- Treesitter folding
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldenable = false
  vim.opt.indentexpr = "v:lua.vim.treesitter.indent()"

  -- LSP config (native vim.lsp.config, Neovim 0.11+)
  vim.lsp.config('texlab', {})
  vim.lsp.config('hls', {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
  })
  vim.lsp.enable({ 'texlab', 'hls' })

  vim.diagnostic.config({
    virtual_lines = true,
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader>rf', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  })

  local theme = vim.o.background == "light"
    and "github_light_high_contrast"
    or "github_dark_high_contrast"
  vim.cmd("colorscheme " .. theme)
  require('lualine').setup({
    options = { theme = theme },
  })
  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      separator_style = "slant",
    },
  })

  require('gitsigns').setup()
  require('ibl').setup()
  require("scrollbar").setup()
  require("scrollbar.handlers.gitsigns").setup()
end)
EOF

endif

" Terminal escape
tnoremap <F10> <Esc>
tnoremap <Esc> <C-\><C-n>

" Neovide
if exists("g:neovide")
  set guifont=BerkeleyMono\ Nerd\ Font:h10
  let g:neovide_cursor_smooth_blink = v:true
endif
