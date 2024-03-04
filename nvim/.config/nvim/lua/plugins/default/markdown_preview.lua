return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_browser = vim.g.browser
    -- vim.g.mkdp_auto_close = 0
    vim.keymap.set({ "n", "i" }, "<C-m>", ":MarkdownPreview<cr>", {})
  end,
}
