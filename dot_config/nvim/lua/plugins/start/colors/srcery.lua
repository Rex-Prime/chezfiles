local ok = pcall(vim.cmd.colorscheme, 'srcery')

if not ok then
  return
end

vim.g.srcery_italic = 1
vim.g.srcery_bold = 1
vim.g.srcery_underline = 0
vim.g.srcery_inverse = 0

vim.cmd.colorscheme('srcery')

vim.api.nvim_set_hl(0, 'Search', { bg = '#FAD02C', fg = '#000000', bold = true })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#FF5733', fg = '#FFFFFF', bold = true })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#FF5733', fg = '#FFFFFF', bold = true })
-- vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = "#FFFFFF", bold = true, link = "NONE" })

--[[
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Search", { bg = "#FAD02C", fg = "#000000", bold = true })
    vim.api.nvim_set_hl(0, "CurSearch", { bg = "#FF5733", fg = "#FFFFFF", bold = true })
    vim.api.nvim_set_hl(0, "IncSearch", { bg = "#FF5733", fg = "#FFFFFF", bold = true })
  end,
})
--]]

-- vim.api.nvim_set_hl(0, "Search", { bg = "#FAD02C", fg = "#000000", bold = true })
