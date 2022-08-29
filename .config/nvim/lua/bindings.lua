local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<C-n>", ":NERDTreeToggle<CR>")

map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")

map("n", "<Tab>", "gt")
map("n", "<leader>new", ":tabnew<cr>")
map("n", "<leader>edit", ":tabe")
map("n", "<leader>close", ":tabc<cr>")
map("n", "<leader>only", ":tabo<cr>")
