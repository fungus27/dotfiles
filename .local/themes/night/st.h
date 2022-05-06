float alpha = 0.8f;

static const char *colorname[] = {

	[0] = "#042b62",
	[1] = "#043170",
	[2] = "#05377f",
	[3] = "#053e8e",
	[4] = "#06449c",
	[5] = "#064bab",
	[6] = "#0751ba",
	[7] = "#0858c8",
	[8] = "#085ed7",
	[9] = "#0965e6",
	[10] = "#096bf4",
	[11] = "#0a71ff",
	[12] = "#0b78ff",
	[13] = "#0b7eff",
	[14] = "#0c85ff",
	[15] = "#0c8bff",
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
