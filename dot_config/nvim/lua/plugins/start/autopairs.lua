local ok, autopairs = pcall(require, "autopairs.nvim")

if not ok then
	return
end

autopairs.setup({})
