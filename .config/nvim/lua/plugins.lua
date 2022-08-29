local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'jiangmiao/auto-pairs'
    Plug('neoclide/coc.nvim', {branch = 'release'})
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-sleuth'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvim-lua/popup.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'airblade/vim-gitgutter'
    Plug 'mkitt/tabline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'philrunninger/nerdtree-buffer-ops'
    Plug 'philrunninger/nerdtree-visual-selection'
    Plug 'scrooloose/nerdcommenter'
    Plug 'fatih/vim-go'
    Plug 'rust-lang/rust.vim'
    Plug 'simrat39/rust-tools.nvim'
    Plug('cespare/vim-toml', {branch = 'main'})
    Plug 'vim-syntastic/syntastic'
    Plug 'liuchengxu/vim-clap'
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'elkowar/yuck.vim'
    Plug 'dense-analysis/ale'
    Plug 'lervag/vimtex'
    Plug 'glepnir/dashboard-nvim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'ap/vim-css-color'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'norcalli/nvim-colorizer.lua'
vim.call('plug#end')

-- color scheme
vim.opt.termguicolors = true
vim.cmd [[
  autocmd VimEnter * hi Normal ctermbg=none
  syntax enable
  colorscheme gruvbox
]]

-- airline plugin
vim.g["airline_theme"] ="base16_gruvbox_dark_hard"
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#show_close_button"] = 0
vim.g["airline#extensions#tabline#tabs_label"] = ''
vim.g["airline#extensions#tabline#buffers_label"] = ''
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline#extensions#tabline#show_tab_count"] = 0
vim.g["airline#extensions#tabline#show_buffers"] = 0
vim.g["airline#extensions#tabline#show_splits"] = 0
vim.g["airline#extensions#tabline#show_tab_nr"] = 0
vim.g["airline#extensions#tabline#show_tab_type"] = 0

-- rust plugin
require('rust-tools').setup({})
vim.g["rust_clip_command"] = "xclip -selection clipboard"

-- colorizer plugin
require'colorizer'.setup()

-- telescope plugin
require('telescope').setup({
    defaults = {
        prompt_prefix = ">",
        color_devicons = true,
    }
})

-- go plugin
vim.g["go_highlight_functions"] = 1

-- vimtex plugin
vim.g["vimtex_view_general_viewer"] = "zathura"

-- dashboard plugin
local dashboard = require('dashboard')

dashboard.custom_header = {
    "",
    "    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ",
    "    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ",
    "   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ",
    "   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ",
    "  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ",
    "  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ",
    " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ",
    " ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ",
    " ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ",
    " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ",
    "  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ",
    "   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ",
    "     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ",
    "        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ",
    " ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ",
    "",
}

dashboard.custom_center = { -- let me just take a moment to say that I hate the formatting with this plugin
    {
        desc = "New File",
        action = ":tabnew"
    },
    {
        desc = "  Open File",
        action = ":Telescope find_files"
    },
    {
        desc = "        Open Recent File",
        action = ":Telescope oldfiles"
    },
    {
        desc = "    Quit Neovim",
        action = ":q!"
    }
}

dashboard.custom_footer = { -- if passed nil, it will use the default footer
    ""
}
