if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

Deps.now(function()
  vim.cmd('colorscheme mini-gruvbox')

  -- See :help MiniNotify.config
  local notify = require('mini.notify')
  notify.setup({
    lsp_progress = {
      enable = false,
    },
  })

  vim.notify = notify.make_notify()

  vim.api.nvim_create_user_command('Notifications', function()
    notify.show_history()
  end, {})
end)

