return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-plenary", "nvim-neotest/neotest-jest" },
    opts = { adapters = { "neotest-plenary", "neotest-jest" } },
  },
}
