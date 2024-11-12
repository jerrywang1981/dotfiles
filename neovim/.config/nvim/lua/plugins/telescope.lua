local vim = vim

local tag = vim.version().minor < 10 and "0.1.5" or "0.1.8"

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = tag,
    dependencies = {
      -- { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      local lga_actions = require("telescope-live-grep-args.actions")
      local utils = require("telescope.utils")

      vim.keymap.set("n", "<c-p>", function()
        --[[
        --
        local cwd = vim.loop.cwd()
        local in_worktree = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)
        local in_bare = utils.get_os_command_output({ "git", "rev-parse", "--is-bare-repository" }, cwd)
        if in_worktree[1] ~= "true" and in_bare[1] ~= "true" then
          -- return builtin.find_files({ previewer = true })
          return builtin.find_files({ previewer = false })
        else
          -- return builtin.git_files({ previewer = true })
          return builtin.git_files({ previewer = false })
        end
        --]]
        local function is_git_repo()
          vim.fn.system("git rev-parse --is-inside-work-tree")
          return vim.v.shell_error == 0
        end
        local function get_git_root()
          local dot_git_path = vim.fn.finddir(".git", ".;")
          return vim.fn.fnamemodify(dot_git_path, ":h")
        end
        local opts = {}
        if is_git_repo() then
          opts = {
            cwd = get_git_root(),
          }
          builtin.git_files(opts)
        else
          builtin.find_files(opts)
        end
      end, { noremap = true, silent = true, desc = "[T]elescope [F]ind Files" })

      vim.keymap.set("n", "<leader>fh", function()
        builtin.oldfiles()
      end, { noremap = true, silent = true, desc = "[T]elescope [H]istory Files" })

      vim.keymap.set("n", "<leader>Tm", function()
        builtin.marks()
      end, { noremap = true, silent = true, desc = "[T]elescope [M]arks" })

      ---[[
      vim.keymap.set("n", "<leader>fs", function()
        local function is_git_repo()
          vim.fn.system("git rev-parse --is-inside-work-tree")
          return vim.v.shell_error == 0
        end

        local function get_git_root()
          local dot_git_path = vim.fn.finddir(".git", ".;")
          return vim.fn.fnamemodify(dot_git_path, ":h")
        end

        local opts = {}

        if is_git_repo() then
          opts = {
            cwd = get_git_root(),
          }
        end

        builtin.live_grep(opts)
        -- builtin.live_grep()
      end, { noremap = true, silent = true, desc = "[T]elescope [L]ive Search" })
      --]]

      vim.keymap.set("n", "<leader>fS", function()
        builtin.current_buffer_fuzzy_find()
      end, { noremap = true, silent = true, desc = "[T]elescope [F]uzzy Find in current buffer" })

      vim.keymap.set("n", "<leader>fb", function()
        builtin.buffers({ previewer = false })
      end, { noremap = true, silent = true, desc = "[T]elescope [B]uffers" })

      vim.keymap.set("n", "<leader>f.", function()
        builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
      end, { noremap = true, silent = true, desc = "[T]elescope [S]ibling Files" })
      -- vim.keymap.set("n", "<leader>T", ":<c-u>Telescope ", { noremap = true, silent = true, desc = "Telescope All" })

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<M-p>"] = action_layout.toggle_preview,
              -- ["<C-s>"] = actions.cycle_previewers_next,
              -- ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
              ["<M-p>"] = action_layout.toggle_preview,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          live_grep_args = {
            auto_quoting = true,
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-space>"] = actions.to_fuzzy_refine,
              },
            },
            vimgrep_arguments = {
              "rg",
              -- "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--ignore-case",
              -- "--smart-case",
              -- "--hidden",
            },
          },
          --[[
        --
        bookmarks = {
          selected_browser = "chrome",
          url_open_command = "xdg-open",
        },
        --]]
        },
      })

      require("telescope").load_extension("live_grep_args")

      vim.keymap.set("n", "<leader>fg", function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end, { noremap = true, silent = true, desc = "[T]elescope [L]ive Grep" })
    end,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = { "telescope.nvim" },
    config = function() end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    -- enabled=false,
    dependencies = { "telescope.nvim" },
    config = function()
      require("browser_bookmarks").setup({
        -- override default configuration values
        selected_browser = "chrome",
      })
      require("telescope").load_extension("bookmarks")
    end,
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("emoji")
    end,
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      -- { "ibhagwan/fzf-lua" },
    },
    config = function()
      require("neoclip").setup({
        keys = {
          telescope = {
            i = {
              select = "<cr>",
              paste = false, --"<c-p>",
              paste_behind = "<c-k>",
              replay = "<c-q>", -- replay a macro
              delete = "<c-d>", -- delete an entry
              edit = "<c-e>", -- edit an entry
              custom = {},
            },
            n = {
              select = "<cr>",
              paste = false, -- "p",
              --- It is possible to map to more than one key.
              -- paste = { "p", "<c-p>" },
              paste_behind = "P",
              replay = "q",
              delete = "d",
              edit = "e",
              custom = {},
            },
          },
        },
      })
      require("telescope").load_extension("neoclip")
      vim.keymap.set(
        "n",
        '<leader>f"',
        "<cmd>Telescope neoclip<cr>",
        { noremap = true, silent = true, desc = "[T]elescope [N]eoclip" }
      )
    end,
  },
  {
    "otavioschwanck/telescope-alternate",
    enabled = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope-alternate").setup({
        presets = { "rails", "rspec", "nestjs", "angular" },
      })
      require("telescope").load_extension("telescope-alternate")
    end,
  },
  {
    "cljoly/telescope-repo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("repo")
      vim.keymap.set(
        "n",
        "<leader>Tr",
        "<cmd>Telescope repo list<cr>",
        { noremap = true, silent = true, desc = "[T]elescope [R]epo list" }
      )
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>Hm", function()
        require("harpoon.mark").add_file()
        print(" Added(harpoon): " .. vim.fn.expand("%"))
      end, { noremap = true, silent = true, desc = "[H]arpoon [M]ark file" })

      vim.keymap.set("n", "<leader>HH", function()
        require("harpoon.ui").toggle_quick_menu()
      end, { noremap = true, silent = true, desc = "[H]arpoon [T]oggle Menu" })
      require("telescope").load_extension("harpoon")
    end,
  },
}
