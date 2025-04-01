local vim = vim

return {
  "nvim-neotest/neotest",
  -- keys = "<leader>tt",
  -- keys = {
  --   { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "run nearest test" },
  --   { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "toggle test summary panel" },
  -- },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcasia/neotest-java",
    "nvim-neotest/neotest-go",
    -- "nvim-neotest/neotest-vim-test",
    -- "vim-test/vim-test",
  },
  event = "LspAttach",
  init = function()
    -- vim.api.nvim_set_keymap("n", "<leader>tt", '<cmd>lua require("neotest").run.run()<cr>', { noremap = true, silent = true })
  end,
  config = function()
    require("neotest").setup({
      log_level = vim.log.levels.DEBUG,
      adapters = {
        require("neotest-go"),
        -- require("neotest-vim-test")({
        --   ignore_file_types = { "python", "vim", "lua", "go" },
        -- }),
        require("neotest-java")({
          junit_jar = nil, -- default: stdpath("data") .. /nvim/neotest-java/junit-platform-console-standalone-[version].jar
          incremental_build = true,
          ignore_wrapper = false,
        }),
      },
    })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tt",
      '<cmd>lua require("neotest").run.run()<cr>',
      { noremap = true, silent = true, desc = "run nearest test" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tT",
      '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
      { noremap = true, silent = true, desc = "run current test file" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tD",
      '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>',
      { noremap = true, silent = true, desc = "debug current test file" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tO",
      '<cmd>lua require("neotest").output_panel.toggle()<cr>',
      { noremap = true, silent = true, desc = "toggle test output pannel" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>to",
      '<cmd>lua require("neotest").output.open({ enter = true })<cr>',
      { noremap = true, silent = true, desc = "open test output" }
    )

    vim.api.nvim_set_keymap(
      "n",
      "<leader>ts",
      '<cmd>lua require("neotest").summary.toggle()<cr>',
      { noremap = true, silent = true, desc = "toggle test summary panel" }
    )

    -- vim.keymap.set("n", "<leader>tt", "<cmd>Test", { noremap = true, silent = true })
    -- vim.cmd [[ nmap <leader>tt :lua require("neotest").run.run() ]]
  end,
}
