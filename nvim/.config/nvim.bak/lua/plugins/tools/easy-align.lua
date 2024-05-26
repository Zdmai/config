-- Start interactive EasyAlign in visual mode (e.g. vipga)
-- vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
return {
  "junegunn/vim-easy-align",
  config = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)<CR>")
  end
}
