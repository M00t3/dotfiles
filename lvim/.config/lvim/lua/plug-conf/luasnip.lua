local ls = require("luasnip")

ls.config.set_config({

  history = true,
  updateevent = "TextChange,TextChangeI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "" } }
      },
    },
  },
})

vim.keymap.set({'i', 's'}, "<a-l>" , function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({'i', 's'}, "<a-h>" , function ()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)
