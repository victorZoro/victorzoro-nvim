return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },
  keys = {
    { "<leader>hr", "<cmd>lua require('kulala').run()<CR>", desc = "HTTP request" },
    { "<leader>ha", "<cmd>lua require('kulala').run_all()<CR>", desc = "Run all HTTP requests" },
    { "<leader>hi", "<cmd>lua require('kulala').inspect()<CR>", desc = "Inspect HTTP request" },
    { "<leader>hx", "<cmd>lua require('kulala').scratchpad()<CR>", desc = "HTTP scratchpad" },
  },
  opts = {
    default_view = "body",
    split_direction = "vertical",
    display_mode = "float",
  },
}
