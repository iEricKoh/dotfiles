return {
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    keys = {
      {
        "<C-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files",
      },
      {
        "<C-g>",
        "<cmd>Telescope live_grep<cr>",
      },
      {
        "<C-n>",
        "<cmd>Telescope buffers<cr>",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            -- menu navigation
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
            -- history
            ["<Down>"] = "cycle_history_next",
            ["<Up>"] = "cycle_history_prev",
            -- preview window navigation
            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down",
          },
        },
      },
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
