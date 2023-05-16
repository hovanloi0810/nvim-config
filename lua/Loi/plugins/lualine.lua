local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = {
		"info",
		"error",
		"warn",
		"hint",
	},
	symbols = {
		error = " ",
		warn = " ",
		hint = " ",
		info = " ",
	},
	colored = true,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	color = { bg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local location = {
	"location",
	padding = 0,
}

local vim_icons = {
	function()
		return ""
	end,
	separator = { left = "" },
}

local modes = {
	"mode",
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	icon = "",
	-- color = { bg = "#242735", fg = "#c296eb" },
	separator = { left = "", right = "" },
}
local spaces = function()
	return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsp_progess = function()
	msg = msg or "LS Inactive"
	local buf_clients = vim.lsp.buf_get_clients()
	if next(buf_clients) == nil then
		-- TODO: clean up this if statement
		if type(msg) == "boolean" or #msg == 0 then
			return "LS Inactive"
		end
		return msg
	end
	local buf_ft = vim.bo.filetype
	local buf_client_names = {}
	local copilot_active = false
	local null_ls = require("null-ls")
	local alternative_methods = {
		null_ls.methods.DIAGNOSTICS,
		null_ls.methods.DIAGNOSTICS_ON_OPEN,
		null_ls.methods.DIAGNOSTICS_ON_SAVE,
	}

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" and client.name ~= "copilot" then
			table.insert(buf_client_names, client.name)
		end

		if client.name == "copilot" then
			copilot_active = true
		end
	end

	function list_registered_providers_names(filetype)
		local s = require("null-ls.sources")
		local available_sources = s.get_available(filetype)
		local registered = {}
		for _, source in ipairs(available_sources) do
			for method in pairs(source.methods) do
				registered[method] = registered[method] or {}
				table.insert(registered[method], source.name)
			end
		end
		return registered
	end
	function list_registered(filetype)
		local registered_providers = list_registered_providers_names(filetype)
		local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
			return registered_providers[m] or {}
		end, alternative_methods))
		return providers_for_methods
	end

	function formatters_list_registered(filetype)
		local registered_providers = list_registered_providers_names(filetype)
		return registered_providers[null_ls.methods.FORMATTING] or {}
	end
	-- formatters
	local supported_formatters = formatters_list_registered(buf_ft)
	vim.list_extend(buf_client_names, supported_formatters)

	-- linters
	local supported_linters = list_registered(buf_ft)
	vim.list_extend(buf_client_names, supported_linters)
	local unique_client_names = vim.fn.uniq(buf_client_names)

	local language_servers = "" .. table.concat(unique_client_names, ", ") .. ""

	if copilot_active then
		language_servers = language_servers .. "%#SLCopilot#" .. ""
	end

	return language_servers
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "everforest",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			vim_icons,
			modes,
		},
		lualine_b = {
			{
				"filetype",
				icon_only = true,
				colored = true,
			},
			{
				"filename",
				separator = { left = "", right = "" },
			},
		},
		lualine_c = {
			branch,
			diff,
			{
				function()
					return ""
				end,
				-- color = { bg = "#94e2d5", fg = "#121319" },
				separator = { left = "", right = "" },
			},
			diagnostics,
		},
		lualine_x = {
			{
				function()
					return ""
				end,
				separator = { left = "", right = "" },
				-- color = { bg = "#f9e2af", fg = "#000000" },
			},
			{
				lsp_progess,
				-- color = { bg = "#313244", fg = "#cdd6f4" },
			},
		},
		lualine_y = {
			{
				function()
					return ""
				end,
				separator = { left = "", right = "" },
				-- color = { bg = "#eba0ac", fg = "#000000" },
			},
			{
				"progress",
				-- color = { bg = "#313244", fg = "#cdd6f4" },
			},
		},
		lualine_z = {

			{
				function()
					return ""
				end,
				separator = { left = "", right = "" },
				-- color = { bg = "#f2cdcd", fg = "#000000" },
			},
			{
				"location",
				-- color = { bg = "#313244", fg = "#cdd6f4" },
			},
		},
	},
})
