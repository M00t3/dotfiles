-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase
local ls = require("luasnip")
local c = ls.choice_node

return {

  s("slink",
    fmt(
      [[
      SCRIPT_PATH=$(readlink -f "$0")
      SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
      cd "$SCRIPT_DIR" || exit 2
        ]], {})
  ),
  s("rofi-f",
    fmt(
      [[ rofi -dmenu -i -matching fuzzy -lines 10 -width 30 -mesg 'search: ' ]], {})
  ),
  s("rofi-d",
    fmt(
      [[ rofi -dmenu -lines 1 -p 'search: ' ]], {})
  ),
  s("line",
    fmt(
      [[##########]], {})
  ),
  s("title",
    fmt(
      [[
      ##########
      # {}
      ##########
      ]], {
      i(1, "Model_name"),
    })
  ),
  s("chert",
    fmt(
      [[
      test chert
      ]], { })
  ),
  s("chert3",
    fmt(
      [[
      test chert3
      ]], { })
  ),
}
