return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    clangd = {},

    ty = {},

    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },

    rust_analyzer = {},
  },

  config = function(_, opts)
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = '■',
      },
      severity_sort = true,
      update_in_insert = false,
    })

    for name, config in pairs(opts) do
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
}
