if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')
local user = {}

Deps.later(function()
    -- See :help MiniJump2d.config
  require('mini.jump2d').setup({
    allowed_lines = {
      blank = false,
      fold = false,
    },
    allowed_windows = {
      not_current = false,
    },
    mappings = {
      start_jumping = '',
    },
  })

  -- Begin a 2 character jump using mini.jump2d
  vim.keymap.set({'n', 'x', 'o'}, 'gw', user.jump_char(), {desc = '2-character jump'})
end)

function user.jump_char()
  local jump2d = require('mini.jump2d')
  local spotter = nil

  local opts = {hooks = {}}
  local noop = function() return {} end
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

  if jump2d.gen_spotter then
    spotter = jump2d.gen_spotter.pattern
  else
    spotter = jump2d.gen_pattern_spotter
  end

  opts.hooks.before_start = function()
    local prompt = {{'Chars: '}}
    local input = ''
    local total = 2

    vim.api.nvim_echo(prompt, false, {})

    for _=1, total, 1 do
      local ok_ch, ch = pcall(vim.fn.getcharstr)
      if ok_ch == false or ch == nil or ch == esc then
        opts.spotter = noop
        return
      end

      table.insert(prompt, {ch})
      vim.api.nvim_echo(prompt, false, {})

      if ch:match('[a-zA-Z]') then
        input = string.format('%s[%s%s]', input, ch:lower(), ch:upper())
      else
        input = string.format('%s%s', input, vim.pesc(ch))
      end
    end

    opts.spotter = spotter(input)
  end

  return function()
    require('mini.jump2d').start(opts)
  end
end

