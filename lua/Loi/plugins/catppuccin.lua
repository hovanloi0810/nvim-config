local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		aerial = false,
		barbar = false,
		beacon = false,
		coc_nvim = false,
		dashboard = true,
		fern = false,
		fidget = false,
		gitgutter = false,
		harpoon = false,
		headlines = false,
		hop = false,
		illuminate = false,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = true,
		mason = true,
		neogit = false,
		neotest = false,
		neotree = false,
		noice = false,
		octo = false,
		overseer = false,
		pounce = false,
		sandwich = false,
		semantic_tokens = false,
		symbols_outline = false,
		telekasten = false,
		treesitter = true,
		treesitter_context = false,
		ts_rainbow = false,
		ts_rainbow2 = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		barbecue = {
			dim_dirname = true,
			bold_basename = true,
			dim_context = false,
			alt_background = false,
		},
		dap = {
			enabled = false,
			enable_ui = false,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		navic = {
			enabled = false,
			custom_bg = "NONE",
		},
	},
})
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
