return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local officeLogo = [[
       -  _    (°з°)                     (°з°)          ...       -  _
     _(°_o)_ __  \|_ ________   _______ __//    ________°з°)  _ _(°_o)_
    |       |  | |  |       |  |       |   |   |       |  |  | |       |
    8_     _8  |_|  |    ___|  |    _  |   |   |   _   |   |_| |_     _8
      |   | |       |   |___   |   |_| |   |   |  |_|  |       | |   |
      |   | |       |    ___|  |    ___|   |___|       |  _    | |   |
      |   | |   _   |   |___   |   |   |       |   _   | | |   | |   |
      |___| |__| |__|_______|  |___|   |_______|__| |__|_|  |__| |___|
        ]]

    local homeLogo = [[
                  / )
  (\__/)         ( (
  )    (          ) )
={      }=       / /
  )     `-------/ /
  (               /
  \              |
  ,'\       ,    ,'
  `-'\  ,---\   | \
    _) )    `. \ /
    (__/       ) )  
              (_/
        ]]

    local function getHostName()
      local f = io.popen("/bin/hostname")
      local hostname = f:read("*a") or ""
      f:close()
      return hostname:match("^%s*(.-)%s*$") -- Trim whitespace
    end

    local logo = ""

    local hostname = getHostName()

    if hostname == "Erics-MacBook-Pro.local" then
      logo = officeLogo
    else
      logo = homeLogo
    end

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
