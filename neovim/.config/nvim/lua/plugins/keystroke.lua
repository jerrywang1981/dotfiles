return {
  "jerrywang1981/keystroke.nvim",
  -- enabled=false,
  cmd = "KeyStrokeEnable",
  config = function()
    require("keystroke").setup({
      handlers = {
        ["i"] = {
          sound = {
            callback = require("keystroke.sound").play_sound,
            options = {
              style = "typewriter",
              -- style = "mario",
            },
          },
        },
        ["*"] = {},
      },
    })
  end,
}
