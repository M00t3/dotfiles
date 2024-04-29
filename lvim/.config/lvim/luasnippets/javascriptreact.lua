-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase
local ls = require("luasnip")
local c = ls.choice_node

return {

  s("imrc", fmt([[
    import React, {{ Component }} from "react";
    ]],
    {})
  ),

  s("cc", fmt([[
  export default class {} extends Component {{
    state = {{
    {}
    }};

    render() {{
    return 
    }}
  }}
    ]],
    {
      i(1, "ClassName"),
      i(2),
    }
  )
  ),
}
