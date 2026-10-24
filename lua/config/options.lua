-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Homebrew installs database clients as keg-only packages on macOS. Make
-- their executables visible to vim-dadbod even when Neovim was launched from
-- a GUI, a restored session, or before the shell profile was reloaded.
if vim.fn.has("mac") == 1 then
  local brew_bin_paths = {
    "/opt/homebrew/opt/mysql-client/bin",
    "/usr/local/opt/mysql-client/bin",
    "/opt/homebrew/opt/libpq/bin",
    "/usr/local/opt/libpq/bin",
  }
  vim.env.PATH = table.concat(brew_bin_paths, ":") .. ":" .. vim.env.PATH
end

vim.opt.colorcolumn = "80,120"

-- Core editing options mirrored from the IdeaVim configuration.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
