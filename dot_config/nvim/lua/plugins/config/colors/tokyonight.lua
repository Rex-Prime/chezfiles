local ok, tokyonight = pcall(require, "tokyonight")

if not ok then
	return
end

tokyonight.setup({
	style = "night",
	styles = {
		functions = {},
	},
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
})
vim.cmd("colorscheme tokyonight")
