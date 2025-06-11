if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

Deps.later(function()
  -- See :help MiniSurround.config
  require('mini.surround').setup({})

  -- See :help MiniAi-textobject-builtin
  require('mini.ai').setup({n_lines = 500})

  -- See :help MiniComment.config
  require('mini.comment').setup({})

  -- See :help MiniBufremove.config
  require('mini.bufremove').setup({})

  -- See :help MiniExtra
  require('mini.extra').setup({})

  -- Close buffer and preserve window layout
  vim.keymap.set('n', '<leader>bc', '<cmd>lua pcall(MiniBufremove.delete)<cr>', {desc = 'Close buffer'})
end)

