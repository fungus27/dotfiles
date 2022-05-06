float alpha = 1.0f;

static const char *colorname[] = {

	[0] = "#555555", /* black   */
	[1] = "#ac4142", /* red     */
	[2] = "#90a959", /* green   */
	[3] = "#f4bf75", /* yellow  */
	[4] = "#6a9fb5", /* blue    */
	[5] = "#aa759f", /* magenta */
	[6] = "#75b5aa", /* cyan    */
	[7] = "#d0d0d0", /* white   */
	[8]  = "#505050", /* black   */
	[9]  = "#ac4142", /* red     */
	[10] = "#90a959", /* green   */
	[11] = "#f4bf75", /* yellow  */
	[12] = "#6a9fb5", /* blue    */
	[13] = "#aa759f", /* magenta */
	[14] = "#75b5aa", /* cyan    */
	[15] = "#f5f5f5", /* white   */

	/* special colors */
	[256] = "#24241f", /* background */
	[257] = "#d0d0d0", /* foreground */
};

/*
 *  * Default colors (colorname index)
 *   * foreground, background, cursor
 *    */
unsigned int defaultfg = 257;
unsigned int defaultbg = 256;
unsigned int defaultcs = 257;
unsigned int defaultrcs = 257;
