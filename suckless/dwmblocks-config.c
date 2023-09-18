#include "config.h"

#include "block.h"
#include "util.h"

Block blocks[] = {
    {"sb-mpd",      0,     15},
    {"sb-mail",     0,     6},
    {"sb-rss",      0,     4},
    {"sb-paru",     0,     5},
    {"sb-volume",   0,     3},
    {"sb-light",    0,     2},
    {"sb-battery",  60,    11},
    {"sb-date",     0,     12},
    {"sb-time",     30,    10},
};

const unsigned short blockCount = LEN(blocks);
