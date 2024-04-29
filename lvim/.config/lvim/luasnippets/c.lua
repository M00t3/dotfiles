return {
  -- for show { in fmt you must use {{
  s("start", fmt([[
#include <stdio.h>
int main() {{
  {}
  return 0;
  }}
]],
    { i(1) })
  ),
}
