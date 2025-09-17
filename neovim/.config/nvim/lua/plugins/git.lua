local vim = vim

return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.api.nvim_command([[ autocmd BufReadPost fugitive://* set bufhidden=delete ]])
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        -- current_line_blame = true
      })

      vim.keymap.set(
        "n",
        "<leader>TB",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        { desc = "[T]oggle Git [B]lame" }
      )
    end,
  },
  {
    "junegunn/gv.vim",
    opt = true,
    cmd = { "GV" },
  },
}
