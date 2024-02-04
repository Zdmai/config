local keymap = vim.keymap.set

return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local types = require("luasnip.util.types")
      local ls = require("luasnip")

      ls.config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "`",
        -- jump back to it even you move out side of the selection
        history = true,

        -- update as you type when you use the dynamic snippets.
        updateevents = "TextChanged,TextChangedI",
        -- Highlights!
        -- #vid3
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "", "GruvboxOrange" } },
            },
          },
          [types.insertNode] = {
            active = {
              virt_text = { { "", "GruvboxBlue" } },
            },
          },
        },
      })
      -- the config luasnip file path
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })

      local auto_expand = require("luasnip").expand_auto
      require("luasnip").expand_auto = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
      end

      -- keymap for luasnip
      keymap("i", "<C-j>", function()
        return ls.expand_or_locally_jumpable() and "<Plug>luasnip-jump-next"
            or "<c-\\><c-n>:call searchpair('[([{<|]', '', '[)\\]}>|]', 'W')<cr>a"
      end, {})
      keymap("i", "<C-h>", function()
        ls.jump(-1)
      end, {})
      keymap({ "i", "s" }, "<C-l>", function()
        ls.jump(1)
      end, {})
      keymap({ "i", "s" }, "<c-j>", "<Plug>luasnip-next-choice", {})
      keymap({ "i", "s" }, "<c-k>", "<Plug>luasnip-prev-choice", {})
      keymap("n", "<Leader>U", '<Cmd>echo "Snippets refreshed!"<CR><Cmd>source ~/.config/nvim/lua/plugins/default/luasnip.lua<CR>')
      -- {
      --   "<tab>",
      --   function()
      --     if require("luasnip").expand_or_jumpable() then
      --       require("luasnip").expand_or_jump()
      --     else
      --       return "<tab>"
      --     end
      --   end,
      --   mode = { "i", "s" },
      -- },
    end,
  },
}
