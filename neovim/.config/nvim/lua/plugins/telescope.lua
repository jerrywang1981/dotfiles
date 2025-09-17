local vim = vim

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-frecency.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local themes = require("telescope.themes")
      local action_layout = require("telescope.actions.layout")
      local lga_actions = require("telescope-live-grep-args.actions")
      local utils = require("telescope.utils")

      vim.lsp.handlers["textDocument/documentSymbol"] = builtin.lsp_document_symbols

      vim.keymap.set("n", "<c-p>", function()
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

      vim.keymap.set("n", "<leader>f/", function()
        builtin.current_buffer_fuzzy_find()
      end, { noremap = true, silent = true, desc = "[T]elescope [F]uzzy Find in current buffer" })

      vim.keymap.set("n", "<leader>fb", function()
        builtin.buffers({ previewer = false })
      end, { noremap = true, silent = true, desc = "[T]elescope [B]uffers" })

      vim.keymap.set("n", "grO", function()
        builtin.lsp_dynamic_workspace_symbols()
      end, { noremap = true, silent = true, desc = "[T]elescope [B]uffers" })

      vim.keymap.set(
        "n",
        "<leader>ff",
        "<cmd>Telescope frecency workspace=CWD theme=ivy<cr>",
        --   function()
        --   require("telescope").extensions.frecency.frecency({
        --     workspace = "CWD",
        --   })
        -- end,
        { noremap = true, silent = true, desc = "[T]elescope [F]recency" }
      )

      vim.keymap.set("n", "<leader>f.", function()
        builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
      end, { noremap = true, silent = true, desc = "[T]elescope [S]ibling Files" })

      require("telescope").setup({
        defaults = {
          path_display = {
            filename_first = {
              reverse_directories = false,
            },
          },
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
        pickers = {
          find_files = {
            theme = "ivy",
          },
          git_files = {
            theme = "ivy",
          },
          live_grep = {
            theme = "ivy",
          },
          oldfiles = {
            theme = "ivy",
          },
          current_buffer_fuzzy_find = {
            theme = "ivy",
          },
          lsp_document_symbols = {
            theme = "ivy",
          },
        },
        extensions = {
          ["ui-select"] = {
            -- require("telescope.themes").get_dropdown({}),
            require("telescope.themes").get_ivy({}),
          },
          frecency = {
            auto_validate = false,
            matcher = "fuzzy",
            -- show_scores = true,
            show_filter_column = false,
          },
          live_grep_args = {
            auto_quoting = true,
            theme = "ivy",
            mappings = { -- extend mappings
              i = {
                ["<C-i>"] = lga_actions.quote_prompt(),
                -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
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
        },
      })

      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("ui-select")
      -- require("telescope").load_extension("emoji")
      require("telescope").load_extension("frecency")

      vim.keymap.set("n", "<leader>fg", function()
        require("telescope").extensions.live_grep_args.live_grep_args({})
      end, { noremap = true, silent = true, desc = "[T]elescope [L]ive Grep" })
    end,
  },
}
