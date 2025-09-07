-- ~/.config/nvim/lua/custom/commands.lua
vim.api.nvim_create_user_command(
  "Delete", -- Name des Befehls
  "%d _", -- Befehl, der ausgeführt wird: lösche alle Zeilen ins "black hole" register
  {
    desc = "Delete all content in the current buffer without yanking",
  }
)
