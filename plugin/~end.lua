if vim.g.load_plugins ~= 1 then
  return
end

---
-- At this point all the plugins have been loaded.
-- Emit the event "User PluginsReady"
---

vim.g.plugins_ready = true
vim.api.nvim_exec_autocmds('User', {pattern = 'PluginsReady'})

