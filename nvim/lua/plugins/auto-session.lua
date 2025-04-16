return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_restore = true,
      auto_restore_last_session = false,
      auto_save = true,
      log_level = "info",
      session_lens = {
        load_on_setup = false
      }
    })
  end,
}
