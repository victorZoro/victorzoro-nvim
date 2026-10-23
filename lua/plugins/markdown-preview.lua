-- LazyVim's markdown extra may use the Vimscript installer function from
-- markdown-preview.nvim. With lazy.nvim that function is not always on the
-- runtime path during the build phase, so install the bundled app directly.
return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
}
