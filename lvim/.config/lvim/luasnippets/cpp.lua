-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase

return {
  -- for show { in fmt you must use {{
  s("start", fmt([[
  #include <iostream>
  using namespace std;

  int main() {{
    {}
    return 0;
  }}
  ]],
    { i(1) })
  ),

  s("pae",
    fmt([[
    // print element of array
    int {} = sizeof({}) / sizeof({}[0]);
    for (int i = 0; i < {} ;i++){{
      cout << i << " -> " << {}[i] << "\n";
    }}
    ]], {
      i(1, "array_size"),
      i(2, "array_name"),
      rep(2),
      rep(1),
      rep(2),
    }
    )
  ),

  s("array_size",
    fmt([[
    int {} = sizeof({}) / sizeof({}[0]);
    ]], {
      i(1, "arraySize"),
      i(2, "arrayName"),
      rep(2),
    }
    )
  ),

}
