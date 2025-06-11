if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = 'main'
if vim.fn.has('nvim-0.8') == 0 then
  revision = 'cf146a267a6a7db62b1e2aff40414b20081048a1'
end

Deps.add({
  source = 'akinsho/toggleterm.nvim',
  checkout = revision,
})

Deps.later(function()
  -- See :help toggleterm-roadmap
  require('toggleterm').setup({
    open_mapping = '<C-g>',
    direction = 'horizontal',
    shade_terminals = true
  })
end)

