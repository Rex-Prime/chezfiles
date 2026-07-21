local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end

ls.setup({
	update_events = { "TextChanged", "TextChangedI" },
})
