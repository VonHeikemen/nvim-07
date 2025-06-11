if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = 'main'
if vim.fn.has('nvim-0.8') == 0 then
  revision = '357cc8f8eeb64702e6fcf2995e3b9becee99a5d3'
end

Deps.add({
  source = 'akinsho/bufferline.nvim',
  checkout = revision,
})

Deps.now(function()
  vim.keymap.set('n', 'sb', '<cmd>BufferLinePick<cr>', {desc = 'Pick a visible tab'})

  -- See :help bufferline-settings
  require('bufferline').setup({
    options = {
      mode = 'buffers',
      offsets = {
        {filetype = 'NvimTree'}
      },
    },
    -- :help bufferline-highlights
    highlights = {
      buffer_selected = {
        italic = false
      },
    }
  })
end)

