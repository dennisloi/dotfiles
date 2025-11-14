return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          on_attach = function(client, bufnr)
            -- keymap: pin current file as main
            vim.keymap.set("n", "<leader>utp", function()
              client:exec_cmd({
                title = "pin",
                command = "tinymist.pinMain",
                arguments = { vim.api.nvim_buf_get_name(0) },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [P]in main", buffer = bufnr, noremap = true })

            -- keymap: unpin
            vim.keymap.set("n", "<leader>utu", function()
              client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",
                arguments = { vim.v.null },
              }, { bufnr = bufnr })
            end, { desc = "[T]inymist [U]npin main", buffer = bufnr, noremap = true })
          end,
        },
      },
    },
  },
}
