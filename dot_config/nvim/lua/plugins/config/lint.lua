local ok, lint = pcall(require, 'lint')
if not ok then
    return
end

lint.linters_by_ft = {
    markdown = { 'markdownlint' },
    c = { 'clangformat'},
}
