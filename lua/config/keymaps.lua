-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local config_dir = vim.fn.stdpath("config")
local keymaps_file = config_dir .. "/lua/config/keymaps.lua"

-- Configuration and search
map("n", "<leader>cc", "<cmd>edit " .. keymaps_file .. "<CR>", { desc = "Edit keymaps" })
map("n", "<leader>cs", function()
  dofile(keymaps_file)
  vim.notify("Keymaps reloaded", vim.log.levels.INFO)
end, { desc = "Reload keymaps" })
map({ "n", "v" }, "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Keep the IdeaVim line-moving behavior. This intentionally replaces the old
-- tmux navigator mappings for <C-j>/<C-k> (confirmed by the user).
map("n", "<C-j>", ":m .+1<CR>==", opts)
map("n", "<C-k>", ":m .-2<CR>==", opts)
map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
map("x", "p", "P", opts)

-- Scrolling
map({ "n", "v" }, "<leader>d", "<C-d>", { desc = "Scroll down" })
map({ "n", "v" }, "<leader>u", "<C-u>", { desc = "Scroll up" })

-- EasyMotion-like navigation. Leap is already part of this configuration and
-- provides the same fast-jump workflow without a second motion engine.
map("n", "<leader>f", function() require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } }) end, { desc = "Leap" })
map("n", "<leader>F", function() require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } }) end, { desc = "Leap" })
map("n", "<leader>L", function() require("leap").leap({ target_windows = vim.tbl_filter(function(win) return vim.api.nvim_win_is_valid(win) end, vim.api.nvim_list_wins()) }) end, { desc = "Leap across windows" })
map("n", "<leader>w", "<C-w>w", { desc = "Next window" })

-- Explorer and editor actions
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Explorer toggle" })
map("n", "<leader>[", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
map("n", "<leader>]", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close editor" })
map("n", "<leader>m", "<cmd>LazyGit<CR>", { desc = "Git menu" })
map("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Database UI" })
map("n", "<leader>dq", "<cmd>DBUI<CR>", { desc = "Database UI" })
map("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find database buffer" })
map("n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", { desc = "Rename database buffer" })
map("n", "<leader>s", "<cmd>Telescope colorscheme<CR>", { desc = "Change color scheme" })
map("n", "<leader>/", vim.diagnostic.open_float, { desc = "Show error description" })
map("n", "<leader>p", function()
  if vim.fn.exists(":DapToggleBreakpoint") == 2 then
    vim.cmd("DapToggleBreakpoint")
  else
    vim.notify("DAP is not available", vim.log.levels.WARN)
  end
end, { desc = "Toggle breakpoint" })
map("n", "<leader>P", function()
  if vim.fn.exists(":DapEval") == 2 then
    vim.cmd("DapEval")
  else
    vim.notify("DAP is not available", vim.log.levels.WARN)
  end
end, { desc = "Evaluate expression" })

-- Window management and navigation
map("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>ww", "<C-w>c", { desc = "Close split" })
map("n", "<leader>wa", "<cmd>only<CR>", { desc = "Close other splits" })
map("n", "<leader>-", "<C-w>x", { desc = "Exchange split" })
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<S-h>", "<C-w>h", opts)
map("n", "<S-l>", "<C-w>l", opts)
map("n", "<leader>;a", "<cmd>bufdo bd<CR>", { desc = "Close all editors" })
map("n", "<leader>;q", "<cmd>%bd|e#|bd#<CR>", { desc = "Close other editors" })

-- Navigation and source-code actions
local function telescope_picker(name)
  return function(...)
    local ok, builtin = pcall(require, "telescope.builtin")
    if not ok then
      vim.notify("Telescope is not installed. Run :Lazy sync.", vim.log.levels.WARN)
      return
    end
    builtin[name](...)
  end
end

map("n", "<leader>sc", telescope_picker("treesitter"), { desc = "Go to class/symbol" })
map("n", "<leader>sf", telescope_picker("find_files"), { desc = "Go to file" })
map("n", "<leader>sa", telescope_picker("commands"), { desc = "Go to action" })
map("n", "<leader>sr", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Replace in path" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
map("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>ug", telescope_picker("lsp_references"), { desc = "Find usages" })
map("n", "<leader>uu", telescope_picker("lsp_document_symbols"), { desc = "Show usages" })
map("n", "<leader>vs", vim.lsp.buf.definition, { desc = "View source" })
map("n", "<leader>im", telescope_picker("lsp_implementations"), { desc = "Quick implementations" })
map("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Quick type definition" })
map("n", "<leader>ti", vim.lsp.buf.hover, { desc = "Expression type info" })
map("n", "<leader>sh", vim.lsp.buf.hover, { desc = "Show hover info" })
map("n", "<leader>oo", telescope_picker("treesitter"), { desc = "File structure" })

-- Find and replace
map("n", "<S-f>", telescope_picker("current_buffer_fuzzy_find"), { desc = "Find" })
map("n", "<S-r>", telescope_picker("live_grep"), { desc = "Replace" })
map("n", "<leader>ff", telescope_picker("live_grep"), { desc = "Find in path" })
map("n", "<leader>fr", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Replace in path" })

-- Refactoring and editing
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename element" })
map("n", "<leader>aa", vim.lsp.buf.code_action, { desc = "Show intention actions" })
map("n", "<leader>rm", vim.lsp.buf.code_action, { desc = "Extract method" })
map("n", "<leader>rv", vim.lsp.buf.code_action, { desc = "Introduce variable" })
map("n", "<leader>rf", vim.lsp.buf.code_action, { desc = "Introduce field" })
map("n", "<leader>rs", vim.lsp.buf.code_action, { desc = "Change signature" })
map("n", "<leader>rr", vim.lsp.buf.code_action, { desc = "Refactorings" })
map("n", "<leader>a", "<cmd>Explore<CR>", { desc = "External/project view" })
map("n", "<S-space>", vim.lsp.buf.code_action, { desc = "Generate/code action" })
map("n", "<leader>sw", "ysiw", { desc = "Surround word", remap = true })
map("x", "<leader>sw", "S", { desc = "Surround selection", remap = true })
map("n", "<S-k>", "yyp", { desc = "Duplicate line" })
map("i", "<C-[>", "<C-x><C-o>", opts)
map("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Next error" })
map("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Previous error" })
map("n", "<leader>lc", "g;", { desc = "Last change" })
map("n", "<leader>ll", telescope_picker("oldfiles"), { desc = "Recent locations" })
map("n", "<leader>h", telescope_picker("oldfiles"), { desc = "Recent files" })
map("n", "<A-[>", "[m", { desc = "Previous method" })
map("n", "<A-]>", "]m", { desc = "Next method" })
map("n", "zc", "<cmd>foldclose<CR>", { desc = "Collapse fold" })
map("n", "zo", "<cmd>foldopen<CR>", { desc = "Expand fold" })

-- IdeaVim's <C-;> is explicitly unmapped; remove any inherited mapping.
pcall(vim.keymap.del, "n", "<C-;>")
