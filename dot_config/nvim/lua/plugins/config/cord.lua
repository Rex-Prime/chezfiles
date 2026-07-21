local ok, cord = pcall(require, 'cord')

if not ok then
  return
end

cord.setup({
  display = {
    theme = 'void',
  },
  assets = {
    lua = {
      tooltip = 'Luaaaaaaaa', -- Custom tooltip for Lua files
    },
    nix = {
      tooltip = '❄️',
    },
  },
  editor = {
    icon = 'https://github.com/vyfor/icons/blob/master/icons/minecraft/dark/neovim.png?raw=true',
  },
  buttons = {
    {
      label = function(opts)
        return opts.repo_url and 'View Repository' or 'Github'
      end,
      url = function(opts)
        return opts.repo_url or 'https://github.com/Rex-Prime/'
      end,
    },
  },
  advanced = {
    plugin = {
      autocmds = true,
      cursor_update = 'on_hold',
      match_in_mappings = true,
      debounce = {
        delay = 50,
        interval = 750,
      },
    },
  },
  extensions = {
    persistent_timer = {
      scope = 'workspace', -- 'workspace', 'file', 'filetype', or 'global'
      mode = 'all', -- 'all', 'active', or 'idle'
      file = vim.fn.stdpath('data') .. '/cord/extensions/persistent_timer/data.json', -- Path to the timer data file
      save_on = { 'exit', 'focus_change', 'periodic' }, -- Events that trigger a save
      save_interval = 30, -- Interval in seconds for periodic saves
    },
  },
  hooks = {
    post_activity = function(opts, activity)
      local version = vim.version()
      activity.assets.small_text =
        string.format('Neovim %s.%s.%s', version.major, version.minor, version.patch, opts.cursor_line)
      activity.state = string.format('%s | %d:%d', opts.workspace, opts.cursor_line, opts.cursor_char)
      activity.type = 'playing' -- 'playing' | 'listening' | 'watching' | 'competing'
    end,
  },
})
