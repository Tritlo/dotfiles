filetype off

" Bootstrap vim-plug if not already present
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent exec "!vim +PlugInstall +qa"
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
" repeat last command, . on steroids
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tomasiser/vim-code-dark'

Plug 'Tritlo/vim-rsi' " uses tritlo instead of tpope, due to M-n being same as ð key on icelandic keyboard
" Plug 'tritlo/hypersubatomic.vim', {'branch': 'main'}
" Plug 'tpope/vim-markdown', {'for': 'markdown'}

if !has('nvim')
    " Plug 'nathanaelkane/vim-indent-guides'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'nvim-treesitter/playground'
    " Plug 'neovim/nvim-lspconfig'
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
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tagbar#enabled = 0

let g:shell_mappings_enabled = 0

" Make sure to load bashrc to set the environment variables correctly
if has('unix')
  silent !bash -c "source ~/.bashrc"
  " or
  " silent !zsh -c "source ~/.zshrc"
endif


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
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
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
noremap <Leader>wz :winc z<CR>
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

nnoremap <Leader>tf <cmd>Neotree<CR>

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

set guicursor=
autocmd OptionSet guicursor set guicursor=

if !has('gui')
    if has('nvim')
        " colorscheme hypersubatomic
        " let g:airline_theme="catppuccin"

        if executable('powershell.exe')
            let stl = strlen("AppsUseLightTheme : 1")
            if split(system("powershell.exe Get-ItemProperty -Path \"HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize\" -Name AppsUseLightTheme | findstr.exe AppsUse"),'\zs')[stl-1] == 1
                set background=light
                colorscheme catppuccin-latte
            else
                set background=dark
                " colorscheme hypersubatomic
                " let g:airline_theme="hypersubatomic"
            endif
        endif
    else
        colorscheme codedark
        let g:airline_theme="codedark"
    endif
else
    set guifont=BerkeleyMono\ Nerd\ Font\ Regular\ 9
    " colorscheme hypersubatomic
    " let g:airline_theme="hypersubatomic"
    " set guiligatures=!\"$%&\'()*+,-./:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{\|}~
endif

" Set after the theme to overwrite
"highlight ColorColumn ctermbg=238 guibg=#3B3F51
"highlight ExtraWhitespace ctermbg=246 guibg=#8F93A2
"
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

" this messes up the terminal cursor sadly
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
    "--branch=stable", -- latest stable release
    lazypath,
})
end

vim.opt.rtp:prepend(lazypath)
-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
 -- { 'vim-airline/vim-airline'},
 -- { 'vim-airline/vim-airline-themes'},
  { 'nvim-lualine/lualine.nvim',
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {'tpope/vim-fugitive'},
  {'tpope/vim-commentary'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-treesitter/playground'},
  {'neovim/nvim-lspconfig'},
  -- {'tritlo/hypersubatomic.vim'},
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
    config = function()
      require("ibl").setup {}
    end,
  },
  --{"github/copilot.vim" },
  { 'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("nvim-tree").setup {
  --       -- renderer = {
  --       --     icons = {
  --       --         show = {
  --       --             file = false,
  --       --             folder = false,
  --       --             git = true,
  --       --             folder_arrow = false, }
  --       --         }
  --       --     }
  --     }
  --   end,
  -- },
 --{
 --  'mrcjkb/rustaceanvim',
 --  version = '^5', -- Recommended
 --  lazy = false, -- This plugin is already lazy
 --},
 {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",  -- Use the latest tagged version
  opts = {},  -- This causes the plugin setup function to be called
  keys = {
    {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
    {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},
    {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},
    {"<Leader>mm", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = {"x"}, desc = "Add cursors to the lines of the visual area"},
    {"<Leader>ml", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
    },
  },
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
{
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{'brenton-leighton/multiple-cursors.nvim',
 version = '*',
 commit='f46d8de',
 opts = {},
 keys={
   {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},
   {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
   {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},
   -- Gives an error sadly
   {"<Leader>ma", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = {"x"}, desc = "Add cursors to the lines of the visual area"},
   {"<Leader>mm", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
   {"<Leader>mv", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},
   },
},
{ "lewis6991/gitsigns.nvim"},
{"petertriho/nvim-scrollbar"},
{
  -- Make sure to set this up properly if you have lazy=true
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    file_types = { "markdown"},
    latex = {enabled = false},
  },
  ft = { "markdown" },
},
-- {
--  "yetone/avante.nvim",
--  event = "VeryLazy",
--  version = false, -- Never set this value to "*"! Never!
--  opts = {
--    -- add any opts here
--    -- for example
--   --provider = "openai",
--   --openai = {
--   --  endpoint = "https://api.openai.com/v1",
--   --  model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
--   --  timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
--   --  temperature = 0,
--   --  max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
--   --  --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
--   --},
--   behaviour = {
--    enable_cursor_planning_mode = true,
--   },
--   provider = "ollama",
--   ollama = {
--      model = "deepcoder",
--   }
-- 
--  },
--  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--  build = "make",
--  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--  dependencies = {
--    "nvim-treesitter/nvim-treesitter",
--    "stevearc/dressing.nvim",
--    "nvim-lua/plenary.nvim",
--    "MunifTanjim/nui.nvim",
--    --- The below dependencies are optional,
--    --"echasnovski/mini.pick", -- for file_selector provider mini.pick
--    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
--    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--    --"ibhagwan/fzf-lua", -- for file_selector provider fzf
--    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--    --"zbirenbaum/copilot.lua", -- for providers='copilot'
--    {
--      -- support for image pasting
--      "HakonHarnes/img-clip.nvim",
--      event = "VeryLazy",
--      opts = {
--        -- recommended settings
--        default = {
--          embed_image_as_base64 = false,
--          prompt_for_file_name = false,
--          drag_and_drop = {
--            insert_mode = true,
--          },
--          -- required for Windows users
--          use_absolute_path = true,
--        },
--      },
--    },
--   --{
--   --  -- Make sure to set this up properly if you have lazy=true
--   --  'MeanderingProgrammer/render-markdown.nvim',
--   --  opts = {
--   --    file_types = { "markdown", "Avante" },
--   --  },
--   --  ft = { "markdown", "Avante" },
--   --},
--  },
-- }

})

-- Uff, but ok
vim.schedule(function()
vim.call('plug#end')





require("nvim-treesitter.configs").setup {

  ensure_installed = {"haskell", "c", "lua", "vim", "latex", "sql"},--, "dpella"},
  auto_install = true,
  highlight = {enable = true },
  indent = {enable = true},
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- debounce time for highlighting nodes in the playground
    persist_queries = false,
  },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.dpella = {
    install_info = {
        url = '/home/tritlo/Code/DPella/engine-v2/dpella-treesitter',
        files = {'src/parser.c'},
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
  },
  filetype = 'dpella',
}

-- Note: to enable custom latex highlighting for listings, you need to define e.g.
--
-- (listing_environment
--   code: ((source_code) @injection.content
--          (#lua-match? @injection.content "language=haskell"))
--   (#set! injection.language "haskell"))
--
-- and add it to ~/.vim/plugged/nvim-treesitter/queries/latex/injections.scm
-- note: not required for minted.

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- vim.cmd("colorscheme hypersubatomic")
-- vim.g["airline_theme"] = "hypersubatomic"


-- Latex LSP
require('lspconfig').texlab.setup({})

-- Haskell LSP
require('lspconfig').hls.setup({
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  --settings = {haskell = {plugin = {rename = {globalOn = true}}}},
})

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')


vim.filetype.add({
  extension = {
    dpella = "dpella",
  },
})

vim.opt.indentexpr = "nvim_treesitter#indent()"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
-- Register a new server configuration
if not configs.dpella then
  configs.dpella = {
    default_config = {
      cmd = { '/home/tritlo/Code/DPella/engine-v2/dist-newstyle/build/x86_64-linux/ghc-9.6.5/dpella-repl-0.1.0.0/x/dpella-lsp/opt/build/dpella-lsp/dpella-lsp'},
      filetypes = { 'dpella' },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
      settings = {},
      init_options = {}
    }
  }
end


lspconfig.dpella.setup({filetypes = { 'dpella' }})

vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.opt.indentexpr = "nvim_treesitter#indent()"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

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
    --vim.keymap.set('i', '<C-x><C-o>', vim.lsp.buf.completion, opts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

vim.cmd[[colorscheme tokyonight]]
require('lualine').setup({
  options = {
  theme = 'tokyonight',
  }
})
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant"
  }
})

require('gitsigns').setup()
require('ibl').setup()
require("scrollbar").setup()
require("scrollbar.handlers.gitsigns").setup()

end)
EOF

endif


tnoremap <F10> <Esc>
tnoremap <Esc> <C-\><C-n>

autocmd BufRead,BufNewFile *.dpella set ft=dpella

if exists("g:neovide")
  set guifont=BerkeleyMono\ Nerd\ Font:h10
  let g:neovide_cursor_smooth_blink = v:true
  "set linespace=0
  "let g:neovide_scale_factor = 1.0
  "let g:neovide_text_gamma = 0.0
  "let g:neovide_text_contrast = 0.5
  "let g:neovide_padding_top = 0
  "let g:neovide_padding_bottom = 0
  "let g:neovide_padding_right = 0
  "let g:neovide_padding_left = 0
  "let g:neovide_title_background_color = "green"
  "let g:neovide_title_text_color = "pink"
endif
