---@diagnostic disable: deprecated

local border_style = 'rounded'
local levels = vim.diagnostic.severity

local opts = {
  virtual_text = true,
  float = {},
  signs = {
    text = {
      [levels.ERROR] = '✘',
      [levels.WARN] = '▲',
      [levels.HINT] = '⚑',
      [levels.INFO] = '»',
    },
  },
}

local function sign_define(name, text)
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, {
    texthl = hl,
    text = text,
    numhl = ''
  })
end

-- Ensure compatiblity with older Neovim versions
if vim.fn.has('nvim-0.11') == 1 then
  vim.o.winborder = border_style
else
  opts.float.border = border_style

  sign_define('Error', opts.signs.text[levels.ERROR])
  sign_define('Warn', opts.signs.text[levels.WARN])
  sign_define('Hint', opts.signs.text[levels.HINT])
  sign_define('Info', opts.signs.text[levels.INFO])

  vim.keymap.set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float()<cr>')
  vim.keymap.set('n', '<C-w><C-d>', '<cmd>lua vim.diagnostic.open_float()<cr>')
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

  vim.schedule(function()
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {border = border_style}
    )
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      {border = border_style}
    )
  end)
end

vim.diagnostic.config(opts)

