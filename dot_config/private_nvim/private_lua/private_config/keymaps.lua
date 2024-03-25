local mapkey = require("util.keymapper").mapkey

-- Essentials
mapkey("<leader>wq", "wq", "n")
mapkey("<leader>wa", "wa", "n")
mapkey("<leader>ww", "w", "n")
mapkey("<leader>qq", "q", "n")
mapkey("<leader>qa", "qa", "n")
mapkey("<leader>q!", "q!", "n")

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>bk", "bd", "n") -- Delete Buffer from open list

-- Text Navigation
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = false }) -- Recenter when moving through search results
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = false }) -- Recenter when moving through search results
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = false }) -- Recenter when scrolling down half a page
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = false }) -- Recenter when scrolling up half a page

-- Directory Navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimise

-- Indenting
vim.keymap.set("v", "<", "<gv") -- Shift Indentation to Left
vim.keymap.set("v", ">", ">gv") -- Shift Indentation to Right

-- Open Lazy
mapkey("<leader>L", "Lazy", "n") -- Show Full File Path

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "goc", { noremap = false })
vim.api.nvim_set_keymap("n", "gcc", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "gcc", "goc", { noremap = false })
