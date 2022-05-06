float alpha = 0.8f;

static const char *colorname[] = {

	[0] = "#540404",
	[1] = "#5f0404",
	[2] = "#6b0505",
	[3] = "#770505",
	[4] = "#830606",
	[5] = "#8e0606",
	[6] = "#9a0707",
	[7] = "#a60707",
	[8] = "#b20808",
	[9] = "#bd0909",
	[10] = "#c90909",
	[11] = "#d50a0a",
	[12] = "#e10a0a",
	[13] = "#ec0b0b",
	[14] = "#f80b0b",
	[15] = "#ff0c0c",
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
