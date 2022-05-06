float alpha = 1.0f;

static const char *colorname[] = {

	[0] = "#4a3637", /* black   */
	[1] = "#d17b49", /* red     */
	[2] = "#7b8748", /* green   */
	[3] = "#af865a", /* yellow  */
	[4] = "#306e52", /* blue    */
	[5] = "#775759", /* magenta */
	[6] = "#6d715e", /* cyan    */
	[7] = "#c0b18b", /* white   */
	[8]  = "#402e2e", /* black   */
	[9]  = "#ac5d2f", /* red     */
	[10] = "#647035", /* green   */
	[11] = "#8f6840", /* yellow  */
	[12] = "#3b8765", /* blue    */
	[13] = "#614445", /* magenta */
	[14] = "#585c49", /* cyan    */
	[15] = "#978965", /* white   */
	/* special colors */
	[256] = "#0a0a0a", /* background */
	[257] = "#c0b18b", /* foreground */
};

/*
 *  * Default colors (colorname index)
 *   * foreground, background, cursor
 *    */
unsigned int defaultfg = 257;
unsigned int defaultbg = 256;
unsigned int defaultcs = 257;
unsigned int defaultrcs = 257;
