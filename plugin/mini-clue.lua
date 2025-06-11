if vim.g.load_plugins ~= 1 then
  return
end

local Deps = require('mini.deps')
local user = {}

Deps.later(function()
  -- See :help MiniClue.config
  local clue = user.clues()
  require('mini.clue').setup({
    window = {
      delay = 600,
      config = {
        width = 50,
      },
    },
    triggers = clue.triggers({
      {mode = 'n', keys = '<leader>'},
      {mode = 'x', keys = '<leader>'},
      {mode = 'n', keys = 's'},
      {mode = 'x', keys = 's'},
      {mode = 'n', keys = '['},
      {mode = 'n', keys = ']'},
    }),
    clues = clue.gen({
      {mode = 'n', keys = '['},
      {mode = 'n', keys = ']'},
      {mode = 'n', keys = '<leader>f', desc = '+Find in files'},
      {mode = 'n', keys = '<leader>b', desc = '+Buffers'},
    }),
  })
end)

function user.clues()
  local gen = require('mini.clue').gen_clues
  local triggers = {
    -- Built-in completion
    {mode = 'i', keys = '<C-x>'},

    -- `g` key
    {mode = 'n', keys = 'g'},
    {mode = 'x', keys = 'g'},

    -- Marks
    {mode = 'n', keys = "'"},
    {mode = 'n', keys = '`'},
    {mode = 'x', keys = "'"},
    {mode = 'x', keys = '`'},

    -- Registers
    {mode = 'n', keys = '"'},
    {mode = 'x', keys = '"'},
    {mode = 'i', keys = '<C-r>'},
    {mode = 'c', keys = '<C-r>'},

    -- Window commands
    {mode = 'n', keys = '<C-w>'},

    -- `z` key
    {mode = 'n', keys = 'z'},
    {mode = 'x', keys = 'z'},
  }

  local clues = {
    gen.builtin_completion(),
    gen.g(),
    gen.marks(),
    gen.registers(),
    gen.windows(),
    gen.z(),
  }

  local extend = function(list)
    return function(opts)
      if type(opts) ~= 'table' then
        return list
      end

      for _, t in ipairs(opts) do
        table.insert(list, t)
      end

      return list
    end
  end

  return {
    triggers = extend(triggers),
    gen = extend(clues)
  }
end

