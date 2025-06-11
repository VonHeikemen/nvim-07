if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

Deps.add({
  source = 'kyazdani42/nvim-tree.lua',
  checkout = '949913f1860eb85024fa1967dbd89ac797777b0d',
})

Deps.now(function()
  vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {desc = 'File explorer'})

  -- See :help nvim-tree-setup
  require('nvim-tree').setup({
    hijack_cursor = false,
    on_attach = function(bufnr)
      local bufmap = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
      end

      -- :help nvim-tree.api
      local api = require('nvim-tree.api')

      bufmap('L', api.node.open.edit, 'Expand folder or go to file')
      bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
      bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
  })
end)

