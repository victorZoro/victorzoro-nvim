return {
  { "catppuccin/nvim" },
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = { "italic" },
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = { "bold" },
      booleans = { "italic" },
      properties = {},
      types = { "bold" },
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
      mocha = {
        base = "#000000",
      },
    },
    custom_highlights = {},
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  }),
}
