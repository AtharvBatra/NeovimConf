local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

--Shorten the function
local keymap = vim.api.nvim_set_keymap

--Set space as leader "\" inconvenient
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --

--Window Nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


--Resize
keymap("n", "<C-up>", ":resize +2<CR>", opts)
keymap("n", "<C-down>", ":resize -2<CR>", opts)
keymap("n", "<C-left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-right>", ":vertical resize +2<CR>", opts)

--Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move Text Up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk instead of esc
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-1<CR>==", opts)
keymap("v", "p", '"_dP,', opts)

-- Visual Block --
--Move Text Up and down
--keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
--Better navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Fuzzy Finder
keymap("n", "<leader>t", ":Telescope find_files theme=dropdown<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--Formatting
keymap("n", "<leader>f", ":Format<CR>", opts)
