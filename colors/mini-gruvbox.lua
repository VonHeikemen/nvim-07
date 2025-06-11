local palette = {
  base00 = '#1e2122',
  base01 = '#45494a',
  base02 = '#36393a',
  base03 = '#404344',
  base04 = '#d4be98',
  base05 = '#c0b196',
  base06 = '#c3b499',
  base07 = '#c7b89d',
  base08 = '#ec6b64',
  base09 = '#e78a4e',
  base0A = '#e0c080',
  base0B = '#a9b665',
  base0C = '#86b17f',
  base0D = '#7daea3',
  base0E = '#d3869b',
  base0F = '#d65d0e',
}

local cterm = {
  base00 = 234,
  base01 = 235,
  base02 = 237,
  base03 = 238,
  base04 = 180,
  base05 = 144,
  base06 = 144,
  base07 = 181,
  base08 = 203,
  base09 = 173,
  base0A = 180,
  base0B = 143,
  base0C = 108,
  base0D = 109,
  base0E = 174,
  base0F = 166,
}

require('mini.base16').setup({palette = palette, use_cterm = cterm})

vim.cmd('highlight clear SignColumn')
vim.api.nvim_set_hl(0, 'NormalFloat', {link = 'Normal'})
vim.api.nvim_set_hl(0, 'FloatBorder', {link = 'Normal'})

local function hl(group, fg, bg, style)
  local attr = {
    fg = palette[fg],
    bg = palette[bg],
    ctermfg = cterm[fg],
    ctermbg = cterm[bg],
  }

  if style.bold then
    attr.bold = true
  end

  vim.api.nvim_set_hl(0, group, attr)
end

hl('LineNr', 'base01', 'base00', {})

hl('DiagnosticFloatingError', 'base08', 'base00', {})
hl('DiagnosticFloatingHint', 'base0D', 'base00', {})
hl('DiagnosticFloatingInfo', 'base0C', 'base00', {})
hl('DiagnosticFloatingOk', 'base0B', 'base00', {})
hl('DiagnosticFloatingWarn', 'base0E', 'base00', {})

hl('MiniClueTitle', 'base0D', 'base00', {})

hl('MiniStatuslineFilename', 'base04', 'base01', {})
hl('MiniStatuslineModeNormal', 'base00', 'base0D', {bold = true})
hl('MiniStatuslineModeInsert', 'base00', 'base0B', {bold = true})
hl('MiniStatuslineModeVisual', 'base00', 'base0E', {bold = true})

hl('BufferLineBufferSelected', 'base05', 'base00', {bold = true})
hl('BufferLineBufferVisible', 'base05', 'base00', {})
hl('BufferLineIndicatorSelected', 'base0D', 'base00', {})

hl('GitSignsAdd', 'base0B', 'base00', {})
hl('GitSignsChange', 'base0E', 'base00', {})
hl('GitSignsDelete', 'base08', 'base00', {})
hl('GitSignsUntracked', 'base0D', 'base00', {})

vim.g.colors_name = 'mini-gruvbox'

