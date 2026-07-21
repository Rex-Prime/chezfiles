local ok, tokyodark = pcall(require, "tokyodark")
if not ok then
  return
end

tokyodark.setup({})

vim.cmd.colorscheme "tokyodark"
