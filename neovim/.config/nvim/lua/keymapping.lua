local vim = vim

vim.api.nvim_set_keymap("", "<leader>ev", [[<cmd>exe 'edit' $MYVIMRC<cr>]], { noremap = true, silent = true })

for _, key in pairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
  vim.api.nvim_set_keymap("", key, "<Nop>", { noremap = true, silent = true, desc = "Disable arrow keys" })
end

vim.api.nvim_set_keymap("i", "<c-h>", "<left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<c-l>", "<right>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<c-left>", ":vert res -5<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-right>", ":vert res +5<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-up>", ":res +5<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-down>", ":res -5<cr>", { noremap = true, silent = true })

vim.keymap.set({ "i", "v" }, "kj", "<esc>", { noremap = true, silent = true, desc = "esc replacement" })
vim.keymap.set({ "i", "v" }, "jk", "<esc>", { noremap = true, silent = true, desc = "esc replacement" })

-- if vim.lsp.inlay_hint then
--   vim.keymap.set("n", "<leader>th", function()
--     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
--   end, { desc = "Toggle Inlay hint" })
-- end
