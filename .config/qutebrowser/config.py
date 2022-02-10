# General settings
myTerm = "alacritty"

config.load_autoconfig(False)
c.content.default_encoding = "utf-8"
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.tls.certificate_errors = "ask-block-thirdparty"
c.fileselect.folder.command = [myTerm, "-e", "vifm", "{}"]
c.fileselect.multiple_files.command = [myTerm, "-e", "vifm", "--choose-files", "{}"]
c.fileselect.single_file.command = [myTerm, "-e", "vifm", "--choose-files", "{}"]
c.editor.command = [myTerm, "-e", "vim", "-f", "{}"]

# Search
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['gg'] = 'https://www.google.com/search?hl=en&source=hp&ie=UTF-8-l&q={}'
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
