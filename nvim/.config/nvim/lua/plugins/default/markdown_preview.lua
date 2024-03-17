-- return {
--   "iamcco/markdown-preview.nvim",
--   run = 'cd app && yarn install',
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   ft = { "markdown" },
--   build = function()
--     vim.fn["mkdp#util#install"]()
--   end,
--   keys = {
--     '<C-m>',
--     function ()
--       vim.cmd[[MarkdownPreview<cr>]]
--     end,
--     mode = { 'n', 'i' }
--   },
--   config = function()
--     vim.g.mkdp_browser = vim.g.browser
--     vim.g.mkdp_auto_close = 0
--     -- vim.keymap.set({ "n", "i" }, "<C-m>", ":MarkdownPreview<cr>", {})
--   end,
-- }

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  keys = {
    { mode = { 'n', 'i' }, '<A-m>', "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
  },
  config = function()
    vim.g.mkdp_browser = vim.g.browser
    vim.g.mkdp_auto_close = 0
  end,
}
