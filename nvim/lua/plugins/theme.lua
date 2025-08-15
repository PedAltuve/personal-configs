local function get_current_theme_config()
  local theme_file = os.getenv("HOME") .. "/.config/omarchy/current/theme/neovim.lua"
  local file = io.open(theme_file, "r")

  if file then
    file:close()
    local config = dofile(theme_file)

    -- Filter out LazyVim entries and extract colorscheme
    local filtered = {}
    local colorscheme = nil

    for _, plugin in ipairs(config) do
      if type(plugin) == "table" then
        if plugin[1] == "LazyVim/LazyVim" then
          -- Extract colorscheme from LazyVim opts
          if plugin.opts and plugin.opts.colorscheme then
            colorscheme = plugin.opts.colorscheme
          end
        else
          -- Keep non-LazyVim plugins
          table.insert(filtered, plugin)
        end
      end
    end

    -- If we found a colorscheme in LazyVim opts but no explicit config, add it
    if colorscheme and #filtered > 0 then
      for _, plugin in ipairs(filtered) do
        if not plugin.config and not plugin.init then
          plugin.config = function()
            vim.cmd.colorscheme(colorscheme)
          end
          break
        end
      end
    end

    return filtered
  else
    -- Fallback to your current kanagawa setup
    return {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("kanagawa-dragon")
      end
    }
  end
end

return get_current_theme_config()
