#define VANIR_PA_SINK_VCHAN_PORT 4713
#define VANIR_PA_SOURCE_VCHAN_PORT 4714

/* source starts in paused state */
#define VANIR_PA_SOURCE_START_CMD 0x00010001
#define VANIR_PA_SOURCE_STOP_CMD 0x00010000
/* sink starts in running state */
#define VANIR_PA_SINK_CORK_CMD 0x00020000
#define VANIR_PA_SINK_UNCORK_CMD 0x00020001
