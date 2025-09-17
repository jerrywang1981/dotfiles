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
      "<leader>fgg",
      function()
        require("fzf-lua").live_grep()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf live [g]rep",
    },
    {
      "<leader>fgl",
      function()
        require("fzf-lua").grep_last()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [g]rep [l]ast",
    },
    {
      "<leader>fgr",
      function()
        require("fzf-lua").live_grep_resume()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf live [g]rep [r]esume",
    },
    {
      "<leader>fgw",
      function()
        require("fzf-lua").grep_cword()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [g]rep current [w]ord",
    },
    {
      "<leader>fgW",
      function()
        require("fzf-lua").grep_cWORD()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [g]rep current [W]ord",
    },
    {
      "<leader>fgv",
      function()
        require("fzf-lua").grep_visual()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [g]rep [v]isual",
    },
    {
      "<leader>fg/",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf live [g]rep current [/] buffer",
    },
    {
      "<leader>fGt",
      function()
        require("fzf-lua").git_tags()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [G]it tags",
    },
    {
      "<leader>fGb",
      function()
        require("fzf-lua").git_bcommits()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [G]it [b]uffer commits",
    },
    {
      "<leader>fGc",
      function()
        require("fzf-lua").git_commits()
      end,
      noremap = true,
      silent = true,
      desc = "[f]zf [G]it [c]ommits",
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
      git = {
        commits = {
          actions = { ["enter"] = false },
        },
        bcommits = {
          actions = { ["enter"] = false },
        },
        tags = {
          actions = { ["enter"] = false },
        },
      },
    })
  end,
}
