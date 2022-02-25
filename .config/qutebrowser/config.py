# General settings
myTerm = "alacritty"

config.load_autoconfig(False)
c.content.default_encoding = "utf-8"
c.content.autoplay = False
c.content.tls.certificate_errors = "ask-block-thirdparty"
c.editor.command = [myTerm, "-e", "vim", "-f", "{}"]
c.completion.cmd_history_max_items = 100
c.completion.open_categories = ["searchengines", "quickmarks", "bookmarks", "filesystem"]

# Ad-block
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://easylist.to/easylist/fanboy-social.txt',
    'https://easylist-downloads.adblockplus.org/easylistdutch.txt',
    'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt',
    'https://www.i-dont-care-about-cookies.eu/abp/',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt',
    'https://secure.fanboy.co.nz/fanboy-annoyance.txt',
    #'https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter.txt',
    'https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt',
    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt'
]

# Search
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['gg'] = 'https://www.google.com/search?hl=en&source=hp&ie=UTF-8-l&q={}'
c.url.searchengines['gh'] = 'https://github.com/search?q={}'
c.url.searchengines['ew'] = 'https://en.wikipedia.org/w/index.php?search={}'
c.url.searchengines['zw'] = 'https://zh.wikipedia.org/w/index.php?search={}'
c.url.searchengines['aw'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['ap'] = 'https://archlinux.org/packages/?name={}'
c.url.searchengines['aur'] = 'https://aur.archlinux.org/packages?O=0&K={}'

# Keybindings
config.bind('J', 'tab-prev', mode = 'normal')
config.bind('K', 'tab-next', mode = 'normal')
config.bind('>', 'tab-move +', mode='normal')
config.bind('<', 'tab-move -', mode='normal')
config.bind('xb', 'config-cycle statusbar.show never always', mode = 'normal')
config.bind('xt','config-cycle tabs.show never always', mode = 'normal')
config.bind('yf','hint links yank', mode = 'normal')

# Font and define colors values
c.fonts.default_family = ['Inconsolata']
c.fonts.default_size = '18px'
c.fonts.web.family.cursive = 'Inconsolata'
c.fonts.web.family.sans_serif = 'Inconsolata'
c.fonts.completion.category = 'bold default_size default_family'
c.fonts.contextmenu = '16px default_family'
c.fonts.hints = '14px sans'

# Colors
bg = "#1d2021"
fg = "#d4be98"
base01 = "#1d2021" # black
base02 = "#ea6962" # red
base03 = "#a9b665" # green
base04 = "#e78a4e" # yellow
base05 = "#7daea3" # blue
base06 = "#d3869b" # magenta
base07 = "#89b482" # cyan
base08 = "#d4be98" # white
base09 = "#32302f" # black
base10 = "#ea6962" # red
base11 = "#a9b665" # green
base12 = "#e78a4e" # yellow
base13 = "#7daea3" # blue
base14 = "#d3869b" # magenta
base15 = "#89b482" # cyan
base16 = "#d4be98" # white

# Context menu colors
c.colors.contextmenu.menu.bg = bg
c.colors.contextmenu.menu.fg = fg
c.colors.contextmenu.selected.bg = base05
c.colors.contextmenu.selected.fg = bg

# Completion colors
c.colors.completion.category.bg = base01                    # Background color of the completion widget category headers
c.colors.completion.category.border.bottom = base01         # Bottom border color of the completion widget category headers
c.colors.completion.category.border.top = base01            # Top border color of the completion widget category headers
c.colors.completion.category.fg = fg                        # Foreground color of completion widget category headers
c.colors.completion.even.bg = bg                            # Background color of the completion widget for even rows
c.colors.completion.odd.bg = bg                             # Background color of the completion widget for odd rows
c.colors.completion.fg = fg                                 # Text color of the completion widget
c.colors.completion.item.selected.bg = base05               # Background color of the selected completion item
c.colors.completion.item.selected.border.bottom = base09    # Bottom border color of the selected completion item
c.colors.completion.item.selected.border.top = base09       # Top border color of the completion widget category headers
c.colors.completion.item.selected.fg = base01               # Foreground color of the selected completion item
c.colors.completion.match.fg = base11                       # Foreground color of the matched text in the completion
c.colors.completion.scrollbar.bg = base01                   # Color of the scrollbar in completion view
c.colors.completion.scrollbar.fg = base09                   # Color of the scrollbar handle in completion view

# Downloads colors
c.colors.downloads.bar.bg = bg          # Background color for the download bar
c.colors.downloads.start.bg = bg        # Background color for active download bar
c.colors.downloads.start.fg = base04    # Foreground color for active download bar
c.colors.downloads.error.bg = base02    # Background color for downloads with errors
c.colors.downloads.error.fg = base01    # Foreground color for downloads with errors
c.colors.downloads.stop.bg = bg         # Color gradient stop for download backgrounds
c.colors.downloads.stop.fg = base11     # Color gradient stop for download foregrounds
c.colors.downloads.system.bg = 'none'   # Color gradient interpolation system for download backgrounds

# Hints colors
c.colors.hints.bg = bg                  # Background color for hints. use rgba value for transparency
c.colors.hints.fg = fg                  # Font color for hints
c.hints.border = '1px solid' + base01   # Hints
c.colors.hints.match.fg = base11        # Font color for the matched part of hints
c.colors.keyhint.bg = bg                # Background color of the keyhint widget
c.colors.keyhint.fg = fg                # Text color for the keyhint widget
c.colors.keyhint.suffix.fg = fg         # Highlight color for keys to complete the current keychain

# Info and error messages colors
c.colors.messages.error.bg = base02         # Background color of an error message
c.colors.messages.error.border = base10     # Border color of an error message
c.colors.messages.error.fg = base16         # Foreground color of an error message
c.colors.messages.info.bg = base01          # Background color of an info message
c.colors.messages.info.border = base01      # Border color of an info message
c.colors.messages.info.fg = base16          # Foreground color an info message
c.colors.messages.warning.bg = base06       # Background color of a warning message
c.colors.messages.warning.border = base12   # Border color of a warning message
c.colors.messages.warning.fg = base16       # Foreground color a warning message

# Prompt colors
c.colors.prompts.bg = base09                    # Background color for prompts
c.colors.prompts.border = '1px solid' + base01  # Border used around UI elements in prompts
c.colors.prompts.fg = fg                        # Foreground color for prompts
c.colors.prompts.selected.bg = bg               # Background color for the selected item in filename prompts

# Caret colors
c.colors.statusbar.caret.bg = bg            # Background color of the statusbar in caret mode
c.colors.statusbar.caret.fg = fg            # Foreground color of the statusbar in caret mode
c.colors.statusbar.caret.selection.bg = bg  # Background color of the statusbar in caret mode with a selection
c.colors.statusbar.caret.selection.fg = fg  # Foreground color of the statusbar in caret mode with a selection

# Statusbar colors
c.colors.statusbar.command.bg = base01              # Background color of the statusbar in command mode
c.colors.statusbar.command.fg = fg                  # Foreground color of the statusbar in command mode
c.colors.statusbar.command.private.bg = bg          # Background color of the statusbar in private browsing + command mode
c.colors.statusbar.command.private.fg = fg          # Foreground color of the statusbar in private browsing + command mode
c.colors.statusbar.insert.bg = base11               # Background color of the statusbar in insert mode
c.colors.statusbar.insert.fg = bg                   # Foreground color of the statusbar in insert mode
c.colors.statusbar.normal.bg = bg                   # Background color of the statusbar
c.colors.statusbar.normal.fg = fg                   # Foreground color of the statusbar
c.colors.statusbar.passthrough.bg = base05          # Background color of the statusbar in passthrough mode
c.colors.statusbar.passthrough.fg = base16          # Foreground color of the statusbar in passthrough mode
c.colors.statusbar.private.bg = bg                  # Background color of the statusbar in private browsing mode
c.colors.statusbar.private.fg = fg                  # Foreground color of the statusbar in private browsing mode
c.colors.statusbar.progress.bg = base16             # Background color of the progress bar
c.colors.statusbar.url.error.fg = base06            # Foreground color of the URL in the statusbar on error
c.colors.statusbar.url.fg = base16                  # Default foreground color of the URL in the statusbar
c.colors.statusbar.url.hover.fg = base09            # Foreground color of the URL in the statusbar for hovered links
c.colors.statusbar.url.success.http.fg = base11     # Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.success.https.fg = base11    # Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.warn.fg = base04             # Foreground color of the URL in the statusbar when there's a warning
