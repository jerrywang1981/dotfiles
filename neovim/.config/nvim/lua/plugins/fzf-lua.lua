local vim = vim
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<c-p>",
      function()
        require("fzf-lua").git_files()
      end,
      noremap = true,
      silent = true,
      desc = "Find Git Files",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [f]ind Files",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [b]uffers",
    },
    {
      "<leader>fB",
      function()
        require("fzf-lua").builtin()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [B]uiltin",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [r]esume",
    },
    {

      "<leader>fh",
      function()
        require("fzf-lua").oldfiles()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [h]istory",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf live [g]rep",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").grep_cword()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf current [w]ord",
    },
    {
      "<leader>fW",
      function()
        require("fzf-lua").grep_cWORD()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf current [W]ord",
    },
    {
      "<leader>f/",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf live grep current [/] Buffer",
    },
    {
      "<leader>flws",
      function()
        require("fzf-lua").lsp_live_workspace_symbols()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [l]ive [w]orkspace [s]ymbols",
    },
  },
  config = function()
    local actions = require("fzf-lua").actions
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      defaults = {
        --   git_icons = false,
        --   file_icons = false,
        --   color_icons = false,
        formatter = "path.filename_first",
      },
      winopts = {
        width = 0.95,
        preview = {
          layout = "vertical",
          vertical = "up:70%",
        },
        -- fullscreen = true,
      },
      keymap = {
        builtin = {
          -- ["ctrl-d"] = "preview-page-down",
          -- ["ctrl-u"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
          -- ["ctrl-d"] = "preview-page-down",
          -- ["ctrl-u"] = "preview-page-up",
        },
      },
      grep = {
        actions = {
          -- ["ctrl-g"] = { actions.grep_lgrep },
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
    })
  end,
}
