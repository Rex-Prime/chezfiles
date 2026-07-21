local ok, ccc = pcall(require, "ccc.nvim")

if not ok then
	return
end

ccc.setup({})
