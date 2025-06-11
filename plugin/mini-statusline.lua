if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

vim.o.laststatus = 3

-- See :help MiniStatusline-example-content
local function statusline()
  local mini = require('mini.statusline')
  local mode, mode_hl = mini.section_mode({trunc_width = 120})
  local diagnostics = mini.section_diagnostics({trunc_width = 75})
  local lsp = mini.section_lsp({icon = 'LSP', trunc_width = 75})
  local filename = mini.section_filename({trunc_width = 140})
  local percent = '%2p%%'
  local location = '%3l:%-2c'

  return mini.combine_groups({
    {hl = mode_hl,                  strings = {mode}},
    {hl = 'MiniStatuslineDevinfo',  strings = {diagnostics, lsp}},
    '%<', -- Mark general truncate point
    {hl = 'MiniStatuslineFilename', strings = {filename}},
    '%=', -- End left alignment
    {hl = 'MiniStatuslineFilename', strings = {'%{&filetype}'}},
    {hl = 'MiniStatuslineFileinfo', strings = {percent}},
    {hl = mode_hl,                  strings = {location}},
  })
end

Deps.now(function()
  -- See :help MiniStatusline.config
  require('mini.statusline').setup({
    content = {active = statusline},
    set_vim_settings = false,
  })
end)

