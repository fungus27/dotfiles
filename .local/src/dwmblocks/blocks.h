//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "date '+%H:%M:%S %d/%m/%y'"							,	1,		0},
	{"mem: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g"			,	15,		0},
	{"cpu: ","~/.local/bin/cpu_load"							,	10,		0},
	{"space: ", "df -h ~ | awk 'FNR == 2 {print $2}'"					,	120,		0},
	{"tor: ", "[ -z \"$(pidof tor)\" ] && echo off || echo on"				,	0,		14},
	{"usd: ", "echo \"$(exchange usd pln zl)\""						,	7200,		0},
	{"xmr: ", "echo \"$(exchange xmr pln zl) ($(exchange xmr usd $))\""			,	7200,		0},
	{"btc: ", "echo \"$(exchange btc pln zl) ($(exchange btc usd $))\""			,	7200,		0}
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "   ";
static unsigned int delimLen = 5;
