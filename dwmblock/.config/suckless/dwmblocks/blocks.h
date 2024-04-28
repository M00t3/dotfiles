//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	// /*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	// {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	// // {"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
	// {"", "date '+%I:%M%p'",					5,		0},
 

	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"⌨", "sb-kbselect", 0, 30}, */
	// {"", "cat /tmp/recordingicon 2>/dev/null",	0,	9},
	// {"",	"~/.config/suckless/statusbar_scripts/sb-tasks",	10,	26},
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-music",	0,	11}, */
	// {"",	"~/.config/suckless/statusbar_scripts/sb-pacpackages",	0,	8},
	// {"",	"~/.config/suckless/statusbar_scripts/sb-news",		0,	6},
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-price xmr Monero 🔒 24",			9000,	24}, */
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-price eth Ethereum 🍸 23",	9000,	23}, */
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-price btc Bitcoin 💰 21",				9000,	21}, */
	// {"",	"~/.config/suckless/statusbar_scripts/sb-torrent",	20,	7},
	 // {"",	"~/.config/suckless/statusbar_scripts/sb-xbps_update_num",	600,	22}, 
	 {"",	"~/.config/suckless/statusbar_scripts/sb-memory",	5,	14}, 
	 {"",	"~/.config/suckless/statusbar_scripts/sb-cpu-usage",	5,	17}, 
	 {"",	"~/.config/suckless/statusbar_scripts/sb-home-storage",	10,	18}, 
  // {"",	"~/.config/suckless/statusbar_scripts/sb-cpu",		10,	18}, 
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-moonphase",	18000,	17}, */
	// {"",	"~/.config/suckless/statusbar_scripts/sb-doppler",	0,	13},
	// {"",	"~/.config/suckless/statusbar_scripts/sb-forecast",	18000,	5},
	// {"",	"~/.config/suckless/statusbar_scripts/sb-mailbox",	180,	12},
	// {"",	"~/.config/suckless/statusbar_scripts/sb-wifi_name",	5,	4},

	{"",	"~/.config/suckless/statusbar_scripts/sb-internet",	5,	4},
	{"",	"~/.config/suckless/statusbar_scripts/sb-ping",	2,	16},
	{"",	"~/.config/suckless/statusbar_scripts/sb-nettraf",	1,	16},
	{"",	"~/.config/suckless/statusbar_scripts/sb-volume",	1,	10},
  {"",	"~/.config/suckless/statusbar_scripts/sb-cpu-temp",		5,	18}, 
	{"",	"~/.config/suckless/statusbar_scripts/sb-battery",	5,	3},
	{"",	"~/.config/suckless/statusbar_scripts/sb-clock",	60,	1},
	/* {"",	"~/.config/suckless/statusbar_scripts/sb-iplocate", 0,	27}, */
	// {"",	"~/.config/suckless/statusbar_scripts/sb-help-icon",	0,	15},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
// static char delim[] = " | ";
static char delim[] = " ";
static unsigned int delimLen = 3;
