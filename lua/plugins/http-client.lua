return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
  },
  ft = { "http" },
  keys = {
    { "<leader>hr", "<cmd>Rest run<CR>", desc = "HTTP request" },
    { "<leader>ha", "<cmd>Rest run<CR>", desc = "Run HTTP request" },
    { "<leader>hi", "<cmd>Rest env<CR>", desc = "HTTP environment" },
    { "<leader>hx", "<cmd>Rest open<CR>", desc = "HTTP response" },
  },
  config = function(_, opts)
    require("rest-nvim").setup(opts)
  end,
  opts = {
    result = {
      show_url = true,
      show_curl_command = true,
      skip_ssl_verification = false,
    },
  },
}
