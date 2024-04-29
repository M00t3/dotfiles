-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase
local ls = require("luasnip")
local c = ls.choice_node

return {
  -- for show { in fmt you must use {{
  s("ttt", fmt([[
    this is test snippet_node
    {}
    ]],
    {
      c(1, {
        t("first item"),
        t("second item"),
        t("terd item"),
        t("fort item"),
      })
    })
  ),
}
