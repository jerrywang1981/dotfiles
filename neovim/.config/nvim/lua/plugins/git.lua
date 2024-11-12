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
    -- dependencies = {
    -- 	"nvim-lua/plenary.nvim",
    -- },
    config = function()
      require("gitsigns").setup({
        -- current_line_blame = true
      })
    end,
  },
  {
    "junegunn/gv.vim",
    opt = true,
    cmd = { "GV" },
  },
}
