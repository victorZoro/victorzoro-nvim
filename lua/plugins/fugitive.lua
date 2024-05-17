return {
  "tpope/vim-fugitive",
  cmd = "G",
  setup = function()
    vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>gd", ":Gvdiffsplit<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>gc", ":Gcommit<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>gp", ":Gpush<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>gl", ":Gpull<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>gb", ":Gblame<CR>", { noremap = true, silent = true })
  end,
}
