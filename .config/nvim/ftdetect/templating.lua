-- Set filetype for chezmoi template files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tmpl",
  callback = function()
    local filename = vim.fn.expand("%:t")
    if filename:match("dot_tmux.conf") then
      vim.bo.filetype = "tmux"
    elseif filename:match("dot_gitconfig") then
      vim.bo.filetype = "gitconfig"
    elseif filename:match("dot_zshrc") or filename:match("dot_bashrc") then
      vim.bo.filetype = "sh"
    elseif filename:match("install.*.sh") then
      vim.bo.filetype = "sh"
    -- Fügen Sie hier bei Bedarf weitere Regeln hinzu
    end
  end,
})
