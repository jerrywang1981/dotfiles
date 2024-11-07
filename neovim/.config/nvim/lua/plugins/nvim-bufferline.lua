local vim = vim
return {
  "akinsho/nvim-bufferline.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = function(opts)
          return string.format("%s %s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        separator_style = "slant",
        max_name_length = 100,
        --[[
        name_formatter = function(buf)
          print(buf.path)
          local jdtls_ok, jdtls = pcall(require, "jdtls.setup")
          local p = nil
          if not jdtls_ok then
            p = buf.path:gsub(os.getenv("HOME"), "~")
          else
            local root_dir = jdtls.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
            p = buf.path:gsub(root_dir, "*")
          end
          return vim.fn.pathshorten(p)
        end,
        --]]
      },
    })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>0",
      "<cmd>BufferLinePick<CR>",
      { noremap = true, silent = true, desc = "Pick bufferline" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>1",
      [[<Cmd>BufferLineGoToBuffer 1<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 1" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>2",
      [[<Cmd>BufferLineGoToBuffer 2<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 2" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>3",
      [[<Cmd>BufferLineGoToBuffer 3<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 3" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>4",
      [[<Cmd>BufferLineGoToBuffer 4<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 4" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>5",
      [[<Cmd>BufferLineGoToBuffer 5<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 5" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>6",
      [[<Cmd>BufferLineGoToBuffer 6<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 6" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>7",
      [[<Cmd>BufferLineGoToBuffer 7<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 7" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>8",
      [[<Cmd>BufferLineGoToBuffer 8<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 8" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>9",
      [[<Cmd>BufferLineGoToBuffer 9<CR>]],
      { noremap = true, silent = true, desc = "Go to bufferline 9" }
    )
  end,
}
