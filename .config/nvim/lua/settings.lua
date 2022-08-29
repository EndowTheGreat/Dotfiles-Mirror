vim.g.mapleader = ","
vim.g.encoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.splitright = true
vim.opt.si = true
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.cmd [[
  filetype on
  filetype plugin on
  filetype indent on
]]
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

vim.cmd [[
  if has('persistent_undo')
      set undofile
      set undodir=~/.config/nvim/tmp/undo//
  endif
]]

vim.cmd("autocmd BufEnter * silent! lcd %:p:h")
