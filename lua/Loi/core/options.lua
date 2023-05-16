local opt = vim.opt -- for conciseness

vim.opt.list = true

-- line number
opt.relativenumber = true
opt.number = true
opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.winblend = 0
opt.pumblend = 5

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split winddows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.laststatus = 4 -- only the last window will always have a status line
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.scrolloff = 6 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 6 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

-- Plugins
-- nvim-ufo
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
