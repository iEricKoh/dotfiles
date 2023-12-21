return {
  "gbprod/yanky.nvim",
  opts = {
    ring = {
      storage = "shada",
      history_length = 100,
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },

    highlight = { timer = 250 },

    system_clipboard = {
      sync_with_ring = true,
    },
  },
}
