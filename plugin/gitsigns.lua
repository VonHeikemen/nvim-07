if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = 'ee28ba3e70ecea811b8f6d7b51d81976e94b121c'
if vim.fn.has('nvim-0.9') == 0 then
  revision = '76b71f74ce002119fce322df13bd21cc52c1d112'
end

Deps.add({
  source = 'lewis6991/gitsigns.nvim',
  checkout = revision,
})

Deps.later(function()
  -- See :help gitsigns-usage
  require('gitsigns').setup({
    signs = {
      add = {text = '▎'},
      change = {text = '▎'},
      delete = {text = '➤'},
      topdelete = {text = '➤'},
      changedelete = {text = '▎'},
    }
  })
end)

