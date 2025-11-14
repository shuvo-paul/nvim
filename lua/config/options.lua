-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Configure snacks terminal to always float
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.schedule(function()
      if _G.Snacks and _G.Snacks.config then
        _G.Snacks.config.terminal = _G.Snacks.config.terminal or {}
        _G.Snacks.config.terminal.win = _G.Snacks.config.terminal.win or {}
        _G.Snacks.config.terminal.win.position = "float"
      end
    end)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("organise_imports", { clear = true }),
  pattern = "*.ts",
  callback = function()
    vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
    -- vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} } })
  end,
})
