-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces for each indentation level
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 4
-- Number of spaces to use for soft tabbing (when pressing <Tab>)
vim.opt.softtabstop = 4
-- Show line numbers
vim.opt.number = true
-- Show relative line numbers
vim.opt.relativenumber = true
-- Keep undo/redo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
-- Wrap
vim.opt.wrap = false
-- Set clipboard to system clipboard
vim.opt.clipboard = "unnamedplus"
