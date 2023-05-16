vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Silent keymap option
local opts = { silent = true }
-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<Leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<Leader>+", "<C-a>")
keymap.set("n", "<Leader>-", "<C-x>")

keymap.set("n", "<Leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<Leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<Leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<Leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<Leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<Leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<Leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<Leader>tp", ":tabp<CR>") -- go to previous tab

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap.set("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap.set("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Plugins
-- vim-maximizer
keymap.set("n", "<Leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<Leader>fs", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>")

-- hop
keymap.set("n", "<Leader>h1", "<cmd>HopChar1<cr>") -- move with one keywork
keymap.set("n", "<Leader>h2", "<cmd>HopChar2<cr>") -- move with two keywork

-- keymap.set("n", "<Leader>hl", "<cmd>HopLine<cr>") -- move line with keywork
keymap.set("n", "<Leader>hl", "<cmd>HopLineStart<cr>") -- move line with keywork
keymap.set("n", "<Leader>hp", "<cmd>HopPattern<cr>") -- search with pattern and move
keymap.set("n", "<Leader>hw", "<cmd>HopWord<cr>") -- move with word

--nvim-ufo
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap.set("n", "zR", require("ufo").openAllFolds)
keymap.set("n", "zM", require("ufo").closeAllFolds)
keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
