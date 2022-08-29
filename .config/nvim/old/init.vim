" Everything regarding plugins.
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'glepnir/dashboard-nvim'
Plug 'vim-syntastic/syntastic'
Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'elkowar/yuck.vim'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ap/vim-css-color'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" Color scheme configuration.
autocmd VimEnter * hi Normal ctermbg=none
colorscheme gruvbox
let g:go_highlight_functions = 1

" NERDTree configuration.
nmap <C-n> :NERDTreeToggle<CR>

" Airline configuration.
let g:airline_theme="base16_gruvbox_dark_hard"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0                    
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0

" Rust configuration.
let g:rust_clip_command = 'xclip -selection clipboard'

" General settings.
let mapleader=","
syntax on
set termguicolors
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set spelllang=en_us
set autoindent
set clipboard+=unnamedplus
set nohlsearch
set noerrorbells
set noswapfile
set noshowmode
set number relativenumber
filetype on
filetype plugin on
filetype indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Tabs, casing, and spacing.
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set si
set ignorecase
set smartcase

" Colorizer config.
lua require'colorizer'.setup()

" Rust config.
lua require('rust-tools').setup({})

" Telescope config.
lua << EOF
require('telescope').setup({
    defaults = {
        prompt_prefix = ">",
        color_devicons = true,
    }
})
EOF

" VimTex config.
let g:vimtex_view_general_viewer = "zathura"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" Navigation and whatnot.
nnoremap <Tab> gt
map <leader>new :tabn<cr>
map <leader>edit :tabe
map <leader>close :tabc<cr>
map <leader>only :tabo<cr>

" Dashboard config.
let g:dashboard_custom_header=[
    \'',
    \'    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ',
    \'    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ',
    \'   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ',
    \'   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ',
    \'  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ',
    \'  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ',
    \' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ',
    \' ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ',
    \' ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ',
    \' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ',
    \'  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ',
    \'   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ',
    \'     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ',
    \'        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ',
    \' ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ',
    \'',
    \]

" Allows me to undo files even after I exit the editor.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo//
endif

" Enter into a file's directory automatically
autocmd BufEnter * silent! lcd %:p:h
