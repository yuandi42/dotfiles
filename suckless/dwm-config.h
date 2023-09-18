/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx       = 3;   /* border pixel of windows */
static const unsigned int snap           = 32;  /* snap pixel */
static const int swallowfloating         = 0;   /* 1 means swallow floating windows by default */
static const int showbar                 = 1;   /* 0 means no bar */
static const int topbar                  = 0;   /* 0 means bottom bar */
/* Status is to be shown on: -1 (all monitors), 0 (a specific monitor by index), 'A' (active monitor) */
static const int statusmon               = 'A';
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int showsystray             = 1;   /* 0 means no systray */

/* Indicators: see patch/bar_indicators.h for options */
static int tagindicatortype              = INDICATOR_TOP_LEFT_SQUARE;
static int tiledindicatortype            = INDICATOR_NONE;
static int floatindicatortype            = INDICATOR_TOP_LEFT_SQUARE;
static const char *fonts[]               = { "Iosevka Nerd Font:size=10","Noto Color Emoji:size=10", "Sarasa Mono SC:size=10", };
static const char dmenufont[]            = "monospace:size=10";

static char c000000[]                    = "#000000"; // placeholder value

static char normfgcolor[]                = "#bbbbbb";
static char normbgcolor[]                = "#222222";
static char normbordercolor[]            = "#444444";
static char normfloatcolor[]             = "#444444";

static char selfgcolor[]                 = "#eeeeee";
static char selbgcolor[]                 = "#005577";
static char selbordercolor[]             = "#770000";
static char selfloatcolor[]              = "#770000";

static char titlenormfgcolor[]           = "#bbbbbb";
static char titlenormbgcolor[]           = "#222222";
static char titlenormbordercolor[]       = "#444444";
static char titlenormfloatcolor[]        = "#db8fd9";

static char titleselfgcolor[]            = "#eeeeee";
static char titleselbgcolor[]            = "#005577";
static char titleselbordercolor[]        = "#005577";
static char titleselfloatcolor[]         = "#005577";

static char tagsnormfgcolor[]            = "#bbbbbb";
static char tagsnormbgcolor[]            = "#222222";
static char tagsnormbordercolor[]        = "#444444";
static char tagsnormfloatcolor[]         = "#db8fd9";

static char tagsselfgcolor[]             = "#eeeeee";
static char tagsselbgcolor[]             = "#005577";
static char tagsselbordercolor[]         = "#005577";
static char tagsselfloatcolor[]          = "#005577";

static char hidnormfgcolor[]             = "#227799";
static char hidselfgcolor[]              = "#005577";
static char hidnormbgcolor[]             = "#222222";
static char hidselbgcolor[]              = "#bbbbbb";

static char urgfgcolor[]                 = "#222222";
static char urgbgcolor[]                 = "#eeeeee";
static char urgbordercolor[]             = "#ff0000";
static char urgfloatcolor[]              = "#ff0000";

static char scratchselfgcolor[]          = "#FFF7D4";
static char scratchselbgcolor[]          = "#77547E";
static char scratchselbordercolor[]      = "#894B9F";
static char scratchselfloatcolor[]       = "#894B9F";

static char scratchnormfgcolor[]         = "#FFF7D4";
static char scratchnormbgcolor[]         = "#664C67";
static char scratchnormbordercolor[]     = "#bbbbbb";
static char scratchnormfloatcolor[]      = "#bbbbbb";


static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3] = {
	/*                       fg      bg        border     */
	[SchemeNorm]         = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]          = { OPAQUE, baralpha, borderalpha },
	[SchemeTitleNorm]    = { OPAQUE, baralpha, borderalpha },
	[SchemeTitleSel]     = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsNorm]     = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsSel]      = { OPAQUE, baralpha, borderalpha },
	[SchemeHidNorm]      = { OPAQUE, baralpha, borderalpha },
	[SchemeHidSel]       = { OPAQUE, baralpha, borderalpha },
	[SchemeUrg]          = { OPAQUE, baralpha, borderalpha },
	[SchemeScratchSel]   = { OPAQUE, baralpha, borderalpha },
	[SchemeScratchNorm]  = { OPAQUE, baralpha, borderalpha },
};

static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
	[SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
	[SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
	[SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
	[SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
	[SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
	[SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },
	[SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
	[SchemeScratchSel]   = { scratchselfgcolor, scratchselbgcolor, scratchselbordercolor, scratchselfloatcolor },
	[SchemeScratchNorm]  = { scratchnormfgcolor, scratchnormbgcolor, scratchnormbordercolor, scratchnormfloatcolor },
};




static const char *scratchpadcmd[] = {"s", "st", "-n", "spterm", NULL};

/* Tags
 * In a traditional dwm the number of tags in use can be changed simply by changing the number
 * of strings in the tags array. This build does things a bit different which has some added
 * benefits. If you need to change the number of tags here then change the NUMTAGS macro in dwm.c.
 *
 * Examples:
 *
 *  1) static char *tagicons[][NUMTAGS*2] = {
 *         [DEFAULT_TAGS] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I" },
 *     }
 *
 *  2) static char *tagicons[][1] = {
 *         [DEFAULT_TAGS] = { "•" },
 *     }
 *
 * The first example would result in the tags on the first monitor to be 1 through 9, while the
 * tags for the second monitor would be named A through I. A third monitor would start again at
 * 1 through 9 while the tags on a fourth monitor would also be named A through I. Note the tags
 * count of NUMTAGS*2 in the array initialiser which defines how many tag text / icon exists in
 * the array. This can be changed to *3 to add separate icons for a third monitor.
 *
 * For the second example each tag would be represented as a bullet point. Both cases work the
 * same from a technical standpoint - the icon index is derived from the tag index and the monitor
 * index. If the icon index is is greater than the number of tag icons then it will wrap around
 * until it an icon matches. Similarly if there are two tag icons then it would alternate between
 * them. This works seamlessly with alternative tags and alttagsdecoration patches.
 */
static char *tagicons[][NUMTAGS] =
{
	[DEFAULT_TAGS]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
	[ALTERNATIVE_TAGS]    = { "A", "B", "C", "D", "E", "F", "G", "H", "I" },
	[ALT_TAGS_DECORATION] = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
};


/* There are two options when it comes to per-client rules:
 *  - a typical struct table or
 *  - using the RULE macro
 *
 * A traditional struct table looks like this:
 *    // class      instance  title  wintype  tags mask  isfloating  monitor
 *    { "Gimp",     NULL,     NULL,  NULL,    1 << 4,    0,          -1 },
 *    { "Firefox",  NULL,     NULL,  NULL,    1 << 7,    0,          -1 },
 *
 * The RULE macro has the default values set for each field allowing you to only
 * specify the values that are relevant for your rule, e.g.
 *
 *    RULE(.class = "Gimp", .tags = 1 << 4)
 *    RULE(.class = "Firefox", .tags = 1 << 7)
 *
 * Refer to the Rule struct definition for the list of available fields depending on
 * the patches you enable.
 */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *	WM_WINDOW_ROLE(STRING) = role
	 *	_NET_WM_WINDOW_TYPE(ATOM) = wintype
	 */
	RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
	RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
	RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
	RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
	RULE(.class = "St", .isterminal = 1)
	RULE(.class = "firefox", .tags = 1 << 1)
	RULE(.title = "Event Tester", .noswallow = 1)
	RULE(.instance = "spterm", .scratchkey = 's', .isfloating = 1)
};



/* Bar rules allow you to configure what is shown where on the bar, as well as
 * introducing your own bar modules.
 *
 *    monitor:
 *      -1  show on all monitors
 *       0  show on monitor 0
 *      'A' show on active monitor (i.e. focused / selected) (or just -1 for active?)
 *    bar - bar index, 0 is default, 1 is extrabar
 *    alignment - how the module is aligned compared to other modules
 *    widthfunc, drawfunc, clickfunc - providing bar module width, draw and click functions
 *    name - does nothing, intended for visual clue and for logging / debugging
 */
static const BarRule barrules[] = {
	/* monitor   bar    alignment         widthfunc                 drawfunc                clickfunc                hoverfunc                name */
	{ -1,        0,     BAR_ALIGN_LEFT,   width_tags,               draw_tags,              click_tags,              hover_tags,              "tags" },
	{  0,        0,     BAR_ALIGN_RIGHT,  width_systray,            draw_systray,           click_systray,           NULL,                    "systray" },
	{ -1,        0,     BAR_ALIGN_LEFT,   width_ltsymbol,           draw_ltsymbol,          click_ltsymbol,          NULL,                    "layout" },
	{ statusmon, 0,     BAR_ALIGN_RIGHT,  width_status2d,           draw_status2d,          click_statuscmd,         NULL,                    "status2d" },
	{ -1,        0,     BAR_ALIGN_NONE,   width_awesomebar,         draw_awesomebar,        click_awesomebar,        NULL,                    "awesomebar" },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */



static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "TTT",      bstack },
	{ "[D]",      deck },
};


/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },



/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
	"dmenu_run",
	"-m", dmenumon,
	"-fn", dmenufont,
	"-nb", normbgcolor,
	"-nf", normfgcolor,
	"-sb", selbgcolor,
	"-sf", selfgcolor,
	NULL
};
static const char *termcmd[]  = { "st", NULL };

/* This defines the name of the executable that handles the bar (used for signalling purposes) */
#define STATUSBAR "dwmblocks"


static const Key keys[] = {
	/* modifier                     key            function                argument */
	{ MODKEY,                  XK_F3,         spawn,                  {.v = dmenucmd } },
	{ MODKEY|ShiftMask,        XK_F3,         spawn,                  {.v = termcmd } },
	{ MODKEY,                  XK_b,          togglebar,              {0} },
	{ MODKEY,                  XK_j,          focusstack,             {.i = +1 } },
	{ MODKEY|ALTKEY,           XK_k,          focusstack,             {.i = -2 } },
	{ MODKEY|ALTKEY,           XK_j,          focusstack,             {.i = +2 } },
	{ MODKEY,                  XK_k,          focusstack,             {.i = -1 } },
	{ MODKEY|ShiftMask,        XK_j,          inplacerotate,          {.i = +1 } },
	{ MODKEY|ShiftMask,        XK_k,          inplacerotate,          {.i = -1 } },
	{ MODKEY|ALTKEY|ShiftMask, XK_j,          inplacerotate,          {.i = +2} },
	{ MODKEY|ALTKEY|ShiftMask, XK_k,          inplacerotate,          {.i = -2} },
	{ MODKEY|ShiftMask,        XK_h,          incnmaster,             {.i = +1 } },
	{ MODKEY|ShiftMask,        XK_l,          incnmaster,             {.i = -1 } },
	{ MODKEY,                  XK_h,          setmfact,               {.f = -0.05} },
	{ MODKEY,                  XK_l,          setmfact,               {.f = +0.05} },
	{ MODKEY,                  XK_i,          moveresize,             {.v = "0x 25y 0w 0h" } },
	{ MODKEY,                  XK_o,          moveresize,             {.v = "0x -25y 0w 0h" } },
	{ MODKEY,                  XK_p,          moveresize,             {.v = "25x 0y 0w 0h" } },
	{ MODKEY,                  XK_u,          moveresize,             {.v = "-25x 0y 0w 0h" } },
	{ MODKEY|ShiftMask,        XK_i,          moveresize,             {.v = "0x 0y 0w 25h" } },
	{ MODKEY|ShiftMask,        XK_o,          moveresize,             {.v = "0x 0y 0w -25h" } },
	{ MODKEY|ShiftMask,        XK_p,          moveresize,             {.v = "0x 0y 25w 0h" } },
	{ MODKEY|ShiftMask,        XK_u,          moveresize,             {.v = "0x 0y -25w 0h" } },
	{ MODKEY,                  XK_m,          zoom,                   {0} },
	{ MODKEY,                  XK_Tab,        view,                   {0} },
	{ MODKEY,                  XK_n,          showhideclient,         {0} },
	{ MODKEY|ShiftMask,        XK_c,          killclient,             {0} },
	{ MODKEY|ShiftMask,        XK_Escape,     quit,                   {0} },
	{ MODKEY,                  XK_t,          setlayout,              {.v = &layouts[0]} },
	{ MODKEY,                  XK_y,          setlayout,              {.v = &layouts[1]} },
	{ MODKEY,                  XK_g,          setlayout,              {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,        XK_g,          setlayout,              {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,        XK_t,          setlayout,              {.v = &layouts[4]} },
	{ MODKEY|ShiftMask,        XK_y,          setlayout,              {0} },
	{ MODKEY,                  XK_f,          togglefloating,         {0} },
	{ MODKEY,                  XK_grave,      togglescratch,          {.v = scratchpadcmd } },
	{ MODKEY|ControlMask,      XK_grave,      setscratch,             {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,        XK_grave,      removescratch,          {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,        XK_f,          togglefullscreen,             {0} },
	{ MODKEY,                  XK_0,          view,                   {.ui = ~0 } },
	{ MODKEY|ShiftMask,        XK_0,          tag,                    {.ui = ~0 } },
	{ MODKEY,                  XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                  XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,        XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,        XK_period,     tagmon,                 {.i = +1 } },
	TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	TAGKEYS(                        XK_6,                                  5)
	TAGKEYS(                        XK_7,                                  6)
	TAGKEYS(                        XK_8,                                  7)
	TAGKEYS(                        XK_9,                                  8)
};


/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask           button          function        argument */
	{ ClkLtSymbol,          0,                   Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,                   Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,                   Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,                   Button3,        showhideclient, {0} },
	{ ClkWinTitle,          0,                   Button2,        zoom,           {0} },
	{ ClkStatusText,        0,                   Button1,        sigstatusbar,   {.i = 1 } },
	{ ClkStatusText,        0,                   Button2,        sigstatusbar,   {.i = 2 } },
	{ ClkStatusText,        0,                   Button3,        sigstatusbar,   {.i = 3 } },
	{ ClkStatusText,        0,                   Button4,        sigstatusbar,   {.i = 4 } },
	{ ClkStatusText,        0,                   Button5,        sigstatusbar,   {.i = 5 } },
	{ ClkClientWin,         MODKEY,              Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,              Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,              Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,                   Button1,        view,           {0} },
	{ ClkTagBar,            0,                   Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
};
