local lspconfig_ok = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

-- LSP Keymaps & Autocommands (from kickstart)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Document Highlight logic
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "■", -- i.e '■', '▲', 'vertical'
	},
	severity_sort = true,
	update_in_insert = false,
})

-- defining a global table
_G.lsp_servers = {
	clangd = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
	rust_analyzer = {},
}

-- native neovim activation loop
for name, user_config in pairs(_G.lsp_servers) do
	-- grab the pre-defined template from the native lspconfig registry
	local default_config = vim.lsp.config[name]

	if default_config then
		-- deep merge custom settings with Neovim's native template
		local merged_config = vim.tbl_deep_extend("force", default_config, user_config)

		-- load and enable native client
		vim.lsp.config(name, merged_config)
		vim.lsp.enable(name)
	else
		-- If no default template exists in the registry, load user configuration directly
		vim.lsp.config(name, user_config)
		vim.lsp.enable(name)
	end
end
