-- some sort of loading
vim.loader.enable()

-- taken from kickstart.nvim
-- This autocommand runs after a plugin is installed or updated and
-- runs the appropriate build command for that plugin if necessary.

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable('make') == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has('win32') ~= 1 and vim.fn.executable('make') == 1 then
        run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
      end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
      return
    end
  end,
})

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo)
  return 'https://github.com/' .. repo
end

-- Colorschemes
vim.pack.add({ gh('folke/tokyonight.nvim') })

-- GuessIndent
vim.pack.add({ gh('NMAC427/guess-indent.nvim') })

-- DevIcons
vim.pack.add({ gh('nvim-tree/nvim-web-devicons') })

-- Lualine
vim.pack.add({ gh('nvim-lualine/lualine.nvim') })

-- Lint
vim.pack.add({ gh('mfussenegger/nvim-lint') })

-- Lsp
vim.pack.add({
  gh('neovim/nvim-lspconfig'),
})

-- Formatter
vim.pack.add({ gh('stevearc/conform.nvim') })

-- Completion
vim.pack.add({ gh('L3MON4D3/LuaSnip') })
vim.pack.add({
  {
    src = gh('Saghen/blink.cmp'),
    version = 'v1',
  },
})

-- AutoPairs
vim.pack.add({ gh('windwp/nvim-autopairs') })

-- CCC
vim.pack.add({ gh('uga-rosa/ccc.nvim') })

-- Cord
vim.pack.add({ gh('vyfor/cord.nvim') })

-- BlackLine
vim.pack.add({ gh('lukas-reineke/indent-blankline.nvim') })

require('plugins.config.colors.tokyonight')
require('plugins.config.guess-indent')
require('plugins.config.lualine')
require('plugins.config.lint')
require('plugins.config.conform')
require('plugins.config.luasnip')
require('plugins.config.blink')
require('plugins.config.autopairs')
require('plugins.config.ccc')
require('plugins.config.cord')
require('plugins.config.indent-blankline')

require('plugins.config.lsp')
