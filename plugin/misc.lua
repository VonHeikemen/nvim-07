if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

Deps.add('tpope/vim-fugitive')
Deps.add('tpope/vim-repeat')

