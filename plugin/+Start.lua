if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

Deps.now(function()
  vim.cmd('colorscheme mini-gruvbox')

  -- See :help MiniNotify.config
  require('mini.notify').setup({
    lsp_progress = {
      enable = false,
    },
  })

  vim.notify = require('mini.notify').make_notify()
end)

