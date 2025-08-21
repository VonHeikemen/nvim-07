if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')

local revision = 'main'
if vim.fn.has('nvim-0.8') == 0 then
  revision = 'abacd4cb7ffd640b558845b617cfca1692dcb1a6'
end

Deps.add({
  source = 'hrsh7th/nvim-cmp',
  checkout = revision,
})

Deps.add('hrsh7th/cmp-buffer')
Deps.add('hrsh7th/cmp-path')
Deps.add('hrsh7th/cmp-vsnip')
Deps.add('rafamadriz/friendly-snippets')

Deps.add({
  source = 'hrsh7th/cmp-nvim-lsp',
  commit = 'a8912b88ce488f411177fc8aed358b04dc246d7b'
})
Deps.add({
  source = 'hrsh7th/vim-vsnip',
  checkout = 'b7445b3c43acb08c0b74350d046e0088ece88033',
})

Deps.later(function()
  local cmp = require('cmp')
  local select_opts = {behavior = cmp.SelectBehavior.Select}

  vim.keymap.set({'i', 's'}, '<C-h>', function()
    if vim.call('vsnip#jumpable', -1) then
      return '<Plug>(vsnip-jump-prev)'
    end

    return '<C-h>'
  end, {expr = true})

  vim.keymap.set({'i', 's'}, '<C-l>', function()
    if vim.call('vsnip#jumpable', 1) then
      return '<Plug>(vsnip-jump-next)'
    end

    return '<C-l>'
  end, {expr = true})

  vim.keymap.set({'i', 's'}, '<C-j>', function()
    if vim.call('vsnip#expandable') then
      return '<Plug>(vsnip-expand)'
    end

    return '<C-j>'
  end, {expr = true})

  cmp.setup({
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer', keyword_length = 3},
      {name = 'vsnip', keyword_length = 2},
    },
    snippet = {
      expand = function(args)
        vim.call('vsnip#anonymous', args.body)
      end,
    },
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<CR>'] = cmp.mapping.confirm({select = false}),

      ['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts),

      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1

        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, {'i', 's'}),
    },
  })
end)

