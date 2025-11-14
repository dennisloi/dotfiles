return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    enable = true,      -- enable by default
    max_lines = 3,      -- how many lines of context to show
    trim_scope = "outer",
    mode = "cursor",    -- show context for cursor position
    separator = nil,    -- you can set a line or ── separator
  },
}

