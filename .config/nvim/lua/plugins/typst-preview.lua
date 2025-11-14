return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- load immediately (so the preview commands are always available)
    version = "1.*",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- You can leave this empty, or configure preview options if you like:
      -- server = {
      --   open_cmd = "firefox", -- e.g., use another browser
      -- },
    },
  },
}
