---
-- Ensure mini.nvim is installed
-- and mini.deps is setup
---
local uv = vim.loop or vim.uv

local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'

local revision = 'main'
if vim.fn.has('nvim-0.8') == 0 then
  revision = 'dd71253c8ab1569f7664034579345f3ae10efa81'
end

if not uv.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }

  vim.fn.system(clone_cmd)

  if revision ~= 'main' then
    local switch_cmd = {'git', 'switch', '--detach', revision}
    local job_opts = {cwd = mini_path}
    vim.fn.jobwait({vim.fn.jobstart(switch_cmd, job_opts)})
  end

  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

local ok, Deps = pcall(require, 'mini.deps')
vim.g.plugins_ready = false

if not ok then
  vim.g.load_plugins = 0
  return
end

vim.g.load_plugins = 1

Deps.setup({})

Deps.add({
  source = 'echasnovski/mini.nvim',
  checkout = revision,
})

