return {
  "nat-418/boole.nvim",
  lazy = true,
  opts = {
    mappings = {
      increment = "<C-a>",
      decrement = "<C-x>",
      -- true
      -- no
      -- 6
    },
    additions = {
      { "production", "development", "test" },
      { "let", "const" },
      { "start", "end" },
      { "before", "after" },
      { "plus", "minus" },
      { "smart", "truncate" },
      { "left", "right" },
      { "is", "are" },
    },
  },
}
