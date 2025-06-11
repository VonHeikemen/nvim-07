if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = 'cb33dea610b7eff240985be9f6fe219920e630ef'
if vim.fn.has('nvim-0.9') == 0 then
  revision = 'e85816c5803410cacb52e9b4fbdb72a1f1a6bd11'
end

Deps.add({
  source = 'neovim/nvim-lspconfig',
  checkout = revision,
  depends = {
    'hrsh7th/cmp-nvim-lsp',
  },
})

Deps.now(function()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config
  local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local nvim_07 = vim.fn.has('nvim-0.8') == 0

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    cmp_capabilities
  )

  lsp_defaults.on_attach = function(_, bufnr)
    local opts = {buffer = bufnr}

    -- You can search each function in the help page.
    -- For example :help vim.lsp.buf.hover()

    vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set({'i', 's'}, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

    if nvim_07 then
      vim.keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
      vim.keymap.set('x', 'gq', '<Esc><cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
    else
      vim.keymap.set({'n', 'x'}, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end
  end
end)

