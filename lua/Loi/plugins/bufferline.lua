local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		indicator = {
			style = "underline",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
