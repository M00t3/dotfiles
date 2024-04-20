/* Bar functionality */
#include "bar_indicators.c"
#include "bar_tagicons.c"
#include "bar.c"

#include "bar_alpha.c"
#include "bar_anybar.c"
#include "bar_ltsymbol.c"
#include "bar_status.c"
#include "bar_status2d.c"
#include "bar_tags.c"
#include "bar_wintitle.c"

/* Other patches */
#include "autostart.c"
#include "ipc.c"
#ifdef VERSION
#include "ipc/IPCClient.c"
#include "ipc/yajl_dumps.c"
#include "ipc/ipc.c"
#include "ipc/util.c"
#endif
#include "movestack.c"
#include "pertag.c"
#include "restartsig.c"
#include "vanitygaps.c"
/* Layouts */
#include "layout_facts.c"
#include "layout_fibonacci.c"
#include "layout_monocle.c"
#include "layout_tile.c"

