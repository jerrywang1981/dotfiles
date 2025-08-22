local vim = vim
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.o.background = "dark"
      -- vim.api.nvim_command("colorscheme nightfox")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.o.background = "dark"
      -- vim.api.nvim_command("colorscheme tokyonight")
    end,
  },

  "alvan/vim-closetag",
  -- "milisims/nvim-luaref",
  -- "nanotee/luv-vimdocs",
  "tpope/vim-surround",
  {
    "tpope/vim-unimpaired",
    -- enabled = vim.version().major == 0 and vim.version().minor < 11,
  },
  "tpope/vim-repeat",
  "wellle/targets.vim",
  "kshenoy/vim-signature",
  "mfussenegger/nvim-jdtls",
  "christoomey/vim-tmux-navigator",
  ---[[
  {
    "junegunn/fzf",
    -- enabled = false,
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  --]]
  "junegunn/fzf.vim",
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
  {
    "honza/dockerfile.vim",
    opt = true,
    ft = { "Dockerfile" },
  },
  -- {
  --   "junegunn/gv.vim",
  --   opt = true,
  --   cmd = { "GV" },
  -- },
  {
    "elzr/vim-json",
    opt = true,
    ft = { "json" },
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
  {
    "JavaHello/java-deps.nvim",
    -- lazy = true,
    -- enabled = false,
    -- ft = "java",
    dependencies = {
      { "mfussenegger/nvim-jdtls" },
      { "simrat39/symbols-outline.nvim" },
    },
    config = function()
      require("java-deps").setup({})
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    enabled = false,
    -- cmd = "SymbolsOutline",
    init = function()
      vim.keymap.set("n", "<space>0", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Outline" })
    end,
    config = function()
      require("symbols-outline").setup({
        auto_close = true,
      })
    end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    -- enabled = false,
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      local ftMap = {
        vim = "indent",
        python = { "indent" },
        git = "",
        dbui = "",
        dbout = "",
        json = "",
      }
      -- Option 3: treesitter as a main provider instead
      -- (Note: the `nvim-treesitter` plugin is *not* needed.)
      -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          if ftMap[filetype] ~= nil then
            return ftMap[filetype]
          end
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
