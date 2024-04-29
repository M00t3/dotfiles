-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase
local ls = require("luasnip")
local c = ls.choice_node

return {
  -- for show { in fmt you must use {{
  s("load_static_files", fmt([[
    {{% load static %}}
    ]],
    {}
  )
  ),
  s("for_loop", fmt([[
    {{% for {} in {} %}}
      {}
    {{% endfor %}}
    ]],
    {
      i(1, 'item'),
      i(2, 'items'),
      i(3),
    }
  )
  ),
  s("comment", fmt([[
    {{% comment {} %}}
    {{% endcomment %}}
    ]],
    {
      i(1, 'comment_name'),
    }
  )
  ),
  s("include", fmt([[
    {{% include '{}' %}}
    ]],
    {
      i(1, 'path_to_html_file'),
    }
  )
  ),
  s("block_content", fmt([[
    {{% block content %}}
      {}
    {{% endblock content %}}
    ]],
    {
      i(1),
    }
  )
  ),
  s("sh_object", fmt([[
    {{{{ {} }}}}
    ]],
    {
      i(1),
    }
  )
  ),
  s("extents", fmt([[
    {{% extends '{}' %}}
    ]],
    {
      i(1, 'file_path'),
    }
  )
  ),
  s("if", fmt([[
    {{% if {} %}}
      {}
    {{% endif %}}
    ]],
    {
      i(1, "Condition"),
      i(2),
    }
  )
  ),
  s("else", fmt([[
    {{% else %}}
      {}
    ]],
    {
      i(1),
    }
  )
  ),
  s("url", fmt([[
    {{% url '{}' %}}
    ]],
    {
      i(1, "url name"),
    }
  )
  ),
}
