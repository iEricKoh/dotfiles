return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local actions = fzf.actions

    -- Update the keybinding here
    opts.files = {
      actions = {
        ["ctrl-i"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    }

    opts.grep = {
      actions = {
        ["ctrl-i"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    }

    return opts
  end,
}
