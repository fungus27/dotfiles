float alpha = 0.8f;

static const char *colorname[] = {

	[0] = "#606060",
	[1] = "#6b6b6b",
	[2] = "#767676",
	[3] = "#818181",
	[4] = "#8c8c8c",
	[5] = "#979797",
	[6] = "#a2a2a2",
	[7] = "#adadad",
	[8] = "#b8b8b8",
	[9] = "#c3c3c3",
	[10] = "#cecece",
	[11] = "#d9d9d9",
	[12] = "#e4e4e4",
	[13] = "#efefef",
	[14] = "#fafafa",
	[15] = "#ffffff",
	/* special colors */
	[256] = "#0a0a0a", /* background */
	[257] = "#afafaf", /* foreground */
};

/*
 *  * Default colors (colorname index)
 *   * foreground, background, cursor
 *    */
unsigned int defaultfg = 257;
unsigned int defaultbg = 256;
unsigned int defaultcs = 257;
unsigned int defaultrcs = 257;
