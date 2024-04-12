local vim = vim
local keymap = vim.keymap.set

return {
	"mhartington/formatter.nvim",
  enabled = false,
	config = function()
    local ft_names = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue"
    }
    local filetype={}
    for _, ft_name in ipairs(ft_names) do
      filetype[ft_name] = {
        require("formatter.filetypes." .. ft_name).prettier
      }
    end

    filetype["json"] = {
      require("formatter.filetypes.json").jq
    }

    require('formatter').setup({
      filetype=filetype
    })
    local opts = { noremap = true }
    -- keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
    -- keymap("n", "<leader>F", "<cmd>FormatWrite<CR>", opts)
	end,
}

