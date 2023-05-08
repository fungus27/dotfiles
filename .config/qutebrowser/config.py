import os

# TODO:
# better font system
# other stuff
# content.proxy
# clean up
# editor

config.load_autoconfig(False)

default_font = "envypn"
default_size = "13px"
default_web_font = "Lato"

c.downloads.remove_finished = -1

c.messages.timeout = 2000

c.completion.web_history.max_items = 3
c.completion.height = "40%"
c.completion.open_categories = ["quickmarks", "searchengines", "bookmarks", "history"]
c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 4

c.content.cookies.store = False
c.content.prefers_reduced_motion = True

c.tabs.indicator.width = 0
c.tabs.position = "right"
c.tabs.width = "15%"
c.tabs.favicons.show = "never"
c.tabs.show = "never"
c.tabs.title.format = "{index}: [{host}] {audio}{current_title}"
c.tabs.title.format_pinned = c.tabs.title.format

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.statusbar.caret.bg = "black"
c.colors.statusbar.caret.selection.bg = "black"
c.colors.statusbar.command.private.bg = "black"
c.colors.statusbar.insert.bg = "black"
c.colors.statusbar.passthrough.bg = "black"
c.colors.statusbar.private.bg = "#10002a"
c.colors.statusbar.url.success.http.fg = "#ff5151"
c.colors.statusbar.url.success.https.fg = "#ff5151"

c.colors.tabs.pinned.even.bg = c.colors.tabs.even.bg
c.colors.tabs.pinned.even.fg = "lime"
c.colors.tabs.pinned.odd.bg = c.colors.tabs.odd.bg
c.colors.tabs.pinned.odd.fg = "lime"

c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.pinned.selected.even.fg = "lime"
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.selected.odd.fg = "lime"

c.window.title_format = "qutebrowser"

c.keyhint.delay = 1000
c.keyhint.radius = 0

c.fonts.default_family = [default_font]
c.fonts.default_size = default_size
c.fonts.hints = f"15px default_family"
c.fonts.contextmenu = f"default_size default_family"
c.fonts.prompts = f"default_size default_family"
c.fonts.web.family.cursive = default_web_font
c.fonts.web.family.fantasy = default_web_font
c.fonts.web.family.fixed = default_web_font
c.fonts.web.family.sans_serif = default_web_font
c.fonts.web.family.serif = default_web_font
c.fonts.web.family.standard = default_web_font

c.hints.radius = 0

c.statusbar.show = "always"
c.statusbar.widgets = ["keypress", "url", "history", "text:fungus", "tabs", "progress"]

c.url.searchengines = {"DEFAULT": "http://zupa.xyz/search?q={}",
                       "pl": "http://zupa.xyz/search?q={}&language=pl-PL",
                       "wiki": "https://www.wikipedia.org/w/index.php?title=Special:Search&search={}",
                       "git": "https://github.com/search?q={}",
                       "ggl": "https://www.google.com/search?q={}"}

c.url.default_page = "http://zupa.xyz/"
c.url.start_pages = "http://zupa.xyz/"

c.content.blocking.method = "both"

terminal = os.environ["TERMINAL"]

c.editor.command = [terminal, "-e","nvim", "{file}"]

config.bind("<Ctrl-N>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus prev", mode="command")

leader_key = "<space>"

config.bind(f"{leader_key}t", "config-cycle tabs.show always never")
config.bind(f"{leader_key}et", "config-cycle tabs.width 15% 40%")
config.bind(f"{leader_key}w", "spawn mpv {url}")
