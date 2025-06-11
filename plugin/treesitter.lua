if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = '42fc28ba918343ebfd5565147a42a26580579482'
if vim.fn.has('nvim-0.9') == 0 then
  revision = '4cccb6f494eb255b32a290d37c35ca12584c74d0'
end

Deps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = revision,
  hooks = {
    post_checkout = function()
      vim.cmd('TSUpdate')
    end
  },
})

Deps.now(function()
  -- See :help nvim-treesitter-modules
  require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
      enable = true,
    },
    ensure_installed = {
      'lua',
      'vim',
    },
  })
end)

