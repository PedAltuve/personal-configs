return {
  "rmagatti/auto-session",
  init = function ()
    vim.opt.sessionoptions = {
      "buffers",
      "curdir",
      "tabpages",
      "winsize",
      "help",
      "blank",
      "folds",
      "winpos",
      "terminal",
      "localoptions",
    }
  end,
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
