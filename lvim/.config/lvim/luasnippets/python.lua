-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = require("luasnip.extras.fmt").snippet_node
-- local rep = require("luasnip.extras").rep -- > replase inputs to another plase
local ls = require("luasnip")
local c = ls.choice_node

return {

  s("logger", fmt([[
        logger.{}("{}")
    ]],
    {
      c(1, {
        t("debug"),
        t("info"),
        t("warning"),
        t("error"),
        t("critical"),
      }),
      i(2, "log message")
    })
  ),

  s("titleBanner", fmt([[
    #####################
    # {}
    #####################
    ]],
    {
      i(1, "title message")
    })
  ),
  s("commentLine", fmt([[
    #####################
    ]], {})
  ),

  -- for show { in fmt you must use {{
  s("charfield", fmt([[
  models.CharField(max_length={})
    ]],
    {
      c(1, {
        t("256"),
        t("100"),
        t("20"),
      })
    })
  ),

  s("on_delete", fmt([[
  on_delete=models.{}
    ]],
    {
      c(1, {
        t("CASCADE"),
        t("PROTECT"),
        t("SET_NULL, null=True"),
        t("SET_DEFAULT"),
      })
    })
  ),

  s("ForeignKey", fmt([[
  models.ForeignKey({}, on_delete={})
    ]],
    {
      i(1, "Model_name"),
      c(2, {
        t("models.CASCADE"),
        t("models.PROTECT"),
        t("models.SET_NULL, null=True"),
        t("models.SET_DEFAULT"),
      })
    })
  ),


  s("dateTimeField", fmt([[
  {} = models.DateTimeField({}={})
    ]],
    {
      i(1, "name"),
      c(2, {
        t("auto_now_add"),
        t("auto_now"),
      }),
      c(3, {
        t("True"),
        t("False"),
      })
    })
  ),
  s("dj_mysql_database", fmt([[
  DATABASES = {{
    "default": {{
        "ENGINE": "django.db.backends.mysql",
        "OPTIONS": {{
            "read_default_file": "{}",
          }},
      }},
  }}
    ]], { i(1, "path of database config"), })
  ),
  s("debugi", fmt([[
    import ipdb
    ]], {})
  ),
  s("debugs", fmt([[
    ipdb.set_trace()
    ]], {})
  ),
}
